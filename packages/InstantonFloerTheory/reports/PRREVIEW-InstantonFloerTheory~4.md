# Review of InstantonFloerTheory (pull request #1083 at 4f6a153)

**Verdict:** needs changes

Incremental re-review of the 46 changed lines since 22d369a (README only; `Suggested.lean` and `metadata.toml` are byte-identical). All five previous findings are repaired. The new disjoint-union paragraph of IF5 introduces one blocking defect: its differential sign does not give a chain complex. It also introduces two P3 defects: a library attribution that is too broad at the pin, and a cyclic Künneth theorem stated more narrowly than the argument and this roadmap's own complexes require. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates.

## R01 (P2) — the tensor-product differential of IF5 uses the braiding sign `(−1)^(|x||y|)` and is not a complex

Location: `TauCetiRoadmap/InstantonFloerTheory/README.md` line 194, "the `Z/8`-graded tensor product of the component complexes over Z, with the Koszul sign `(−1)^(|x||y|)` in the differential (parity is well defined modulo 8)".

Claim: with `d(x⊗y)=dx⊗y+(−1)^(|x||y|) x⊗dy`, one gets `d²(x⊗y)=((−1)^((|x|−1)|y|)+(−1)^(|x||y|)) dx⊗dy`, which is `2dx⊗dy` whenever `|y|` is even. The sign of the differential is `(−1)^|x|`; `(−1)^(|x||y|)` is the sign of the symmetry `x⊗y↦y⊗x`. A second gap: IF0 (line 68) makes the admissible complex only *relatively* `Z/8`-graded, so the parity `|x|` and the degrees `p+q=n` of the Künneth sequence need an absolute lift, which the paragraph does not choose.

Witness: `C: e↦f` (degrees 1→0), `C′: g↦h` (degrees 2→1). As stated, `d(e⊗g)=f⊗g+e⊗h` and `d²(e⊗g)=2f⊗h≠0`. Mathlib `ComplexShapeSigns.lean` line 159 sets `ε₂ (p,q) = c.ε p`. The `(−1)^(pq)` sign is the braiding `σ` (line 349).

Repair: write `d(x⊗y)=dx⊗y+(−1)^|x| x⊗dy`, with `|x|` the parity of a chosen absolute lift of the first factor's relative `Z/8` grading. Shifting that lift by `k` changes the complex by the isomorphism `x⊗y↦(−1)^(k|y|)x⊗y`; reserve `(−1)^(|x||y|)` for the symmetry isomorphism of the union. Tested on the witness: `d(e⊗g)=f⊗g−e⊗h`, `d(f⊗g)=f⊗h`, `d(e⊗h)=f⊗h`, so `d²(e⊗g)=0`. The existing Tor-witness Check cannot catch this error: its only nonzero differential starts in degree 1, where the two signs agree. Add the witness above as a sign Check, and name the generators `e` (degree 1) and `f` (degree 0, `de=2f`) in the Tor-witness Check, which now uses `e⊗f−f⊗e` without introducing them.

## R02 (P3) — Tau Ceti's universal-coefficient sequence is said to be stated "on any complex shape"; at the pin it is stated for `ChainComplex C α`

Location: `README.md` line 287 (IF7a *Needs:*), "`TauCeti.ChainComplex.exact_extToHomology_kronecker` (…, stated on any complex shape under the free-cycles hypotheses …)". Line 17 says the same: "The universal-coefficient sequence and the free-cycles splittings on any complex shape".

Claim: the free-cycles lemmas are stated for every shape. The universal-coefficient theorem is stated only for chain complexes whose index type is an additive right-cancellative semigroup with `1`, that is, for the shape `ComplexShape.down α`. The conclusion "hence on the `Z/8`-graded complexes here" is still right, because `ZMod 8` is such an index type.

Witness: `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean` line 79, `{α : Type*} [AddRightCancelSemigroup α] [One α]`, and line 83, `{X : ChainComplex C α}`. By contrast, `PrincipalIdealRing.lean` lines 55–56 use `{c : ComplexShape ι}`.

Repair: at line 287 write "stated for chain complexes `ChainComplex C α` over an additive right-cancellative index `α` with `1`, which includes `ZMod 8` with `d:C_i→C_(i−1)`". At line 17 write "the free-cycles splittings on any complex shape and the universal-coefficient sequence for `ChainComplex C α`". Checked: `ZMod 8` is an additive group with `1`, so the theorem's binders are satisfied for the dual complexes `C_i=(CF^i)*` of IF7a.

## R03 (P3) — the cyclically graded Künneth sequence this roadmap takes ownership of is stated for `Z/8` and finite free complexes only

Location: `README.md` line 194, "Prove the `Z/8`-graded Künneth short exact sequence … for finite free `Z/8`-graded complexes". Line 17 adds "No roadmap owns a cyclically graded Künneth theorem".

Claim: the roadmap owns this theorem, so it should state it at the generality of its proof. The free-cycles argument written there works for every even cyclic grading `ZMod (2m)`, with one factor degreewise free over a principal ideal domain, no finiteness and no hypothesis on the other factor. The roadmap also forms complexes that the `Z/8` statement does not cover. The folded extended-gauge complex is relatively `Z/4`-graded (line 68), and line 5 asks for the graded tensor product of every component complex of a disjoint union.

Witness: the paragraph's own argument tensors the split sequence `0→Z→C→B[−1]→0` with `C′` and uses freeness of `C` only. Tau Ceti's ℕ-indexed sequence says "No hypothesis is imposed on `K`" (`Kunneth/Sequence.lean` line 34).

Repair: state the sequence for complexes indexed by `ZMod (2m)`, `m≥1`, with one factor degreewise free over a principal ideal domain. Use `ε(i)=(−1)^i`, which is well defined exactly for an even modulus. `Z/8` (the admissible theory) and `Z/4` (the folded theory) are then instances. Add the odd-modulus non-example as a Check: on `ZMod 3` no sign satisfies `ε(i+1)=−ε(i)`, since `ε(0)=ε(3)=−ε(0)`. Checked on the Tor witness: only the factor `C` (free, `e↦2f`) is used, and the values `H₁(C⊗C)=Z/2=Tor₁(Z/2,Z/2)` are unchanged.

## Previous findings

- R01 — repaired: line 273 "Over C set (Kronheimer–Mrowka Definition 7.3, p. 55, and the genus-one remark in the proof of Theorem 7.7, p. 57)"; line 277 attaches Scaduto §7.1 (p. 29) to the integral orbit model `C#(Y)`, with that model correctly described.
- R02 — repaired: line 113 "(Donaldson §5.5, p. 134; Daemi–Fukaya–Lipyanskiy §6.1, p. 75)"; line 125 keeps "Kronheimer–Mrowka §7.1 (p. 52) for the admissible datum only" and adds "Frøyshov §2 (p. 4) for the finite nondegenerate perturbed critical set".
- R03 — repaired: Daemi–Fukaya–Lipyanskiy §2.2 at lines 363, 377, 404, 410, 514; Kronheimer–Mrowka §7.2 at lines 225, 228; mixed-equation "§5 (pp. 40–58)" at lines 438, 515.
- R04 — repaired, but the repair introduced R01–R03 above: lines 17, 203 and 287 now cite Tau Ceti's Künneth, free-cycles, splitting and universal-coefficient files, and no Mathlib Künneth claim remains. The author rightly did not follow the previous report's suggestion to apply KhovanovHomology K5 after unrolling: a `Z/8` complex unrolls to an unbounded periodic complex, and the unrolling of `C⊗C′` is not the tensor product of the unrollings.
- R05 — repaired: line 331 "cutting both along their tori and regluing crosswise joins the two intervals into one circle, giving one copy of `S¹×T²` that contains the two parallel tori"; line 486 "`w₂` the class dual to the circle factor, which pairs oddly with `[S²]`".

## Verified sound

**Gate, build, dependency check, scope.** My run of the gate at 4f6a153 reports `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on the same head also reports `build=0`. The dependency check prints:

    depcheck: 239 roadmaps, 2428 edges, 0 problem(s)

with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` exits 0 with no output. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git diff --stat 22d369a..HEAD` touches only `README.md`.

**Suggested.lean.** Unchanged since the previous review: module form, one `public import Mathlib`, one module docstring and an empty namespace. It has no declarations, so there is nothing to `#check` or to probe with one tactic. The five headline theorems it names are still the README's headlines: IF5 homology; IF6 cobordism maps and `u²−64=0`; IF7 reduced and framed groups; IF8 triangle, excision and nilpotence; IF9–IF10 Atiyah–Floer. None is statable at the pins, as the previous report verified. The new cyclic Künneth sequence is statable, but it is homological algebra that names none of the roadmap's objects, so it is not a headline. The pull-request description calls `Suggested.lean` "the exact 3,261-byte native eigenspace/intertwiner prototype". The file at this head is a 2,392-byte docstring-only module. This concerns the description, not the folder.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9):

- Mathlib `Mathlib/Algebra/Homology/ComplexShapeSigns.lean`:
  - lines 156–159: total-complex shape with `ε₂ (p,q) = c.ε p`;
  - lines 168 and 182: `TensorSigns` for `down ℕ` and `up ℤ`, which bears out the README's "exist at the pin for ℕ-indexed chain and Z-indexed cochain complexes";
  - line 349: the braiding `σ`.
- Mathlib `Mathlib/CategoryTheory/Monoidal/Tor.lean` line 44, `CategoryTheory.Tor`.
- Mathlib `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` line 423, `Module.End.eigenspace`.
- Tau Ceti `Monoidal/Homology/Cross.lean` line 153, `homologyCross`, for any `c : ComplexShape I` with `[c.TensorSigns]` (line 54).
- Tau Ceti `Monoidal/Homology/Kunneth/Sequence.lean` lines 729 and 793, `homologyKunnethShortComplex_shortExact` and its splitting, on `ChainComplex (ModuleCat R) ℕ`, with `Tor₁` meaning Mathlib's `CategoryTheory.Tor` (docstring lines 29–34).
- Tau Ceti `PrincipalIdealRing.lean` lines 60, 68 and 83, the free-cycles instances on any shape.
- Tau Ceti `Split.lean` line 357, `exists_homotopyEquiv_d_eq_zero`, on any shape.
- Tau Ceti `UniversalCoefficient/Basic.lean` line 180, `exact_extToHomology_kronecker` (see R02).
- Tau Ceti has no `TensorSigns` instance on any `ZMod` shape: grep over `TauCeti/` finds no instance. Its periodic library `TauCeti/Algebra/Homology/Periodic/` has `ZMod n` cochain complexes, shifts and unfolding, but no tensor product. So "constructed here for `Z/8`" duplicates nothing.

**Ownership.** Searching all open roadmap pull requests and main for "Künneth" found no owner of a cyclically graded Künneth sequence for chain complexes. The hits are ℕ- or ℤ-graded chain complexes (AlgebraicTopology, DGFloer, KhovanovHomology K5) or K-theory of C*-algebras (OperatorKTheory K8.5), which is a different object. `scratch/overlaps.md`: no other open pull request changes this roadmap, none drops an id it cites, and none of its ids is defined only by an open revision. The resolver found no unresolved citation.

**Sources: every locator in the changed lines, opened in the cached texts** (14):

| Target | Source, locator | Lines | Result |
|---|---|---|---|
| cylinder functions: thickened loops `S¹×D²→Y`, averaged holonomy trace `τ_γ`, `h_λ=G(τ_γ1,…)` | dfl07032 §6.1 p. 75 | 2959–2976 | as stated (the source allows immersions; embeddings are a subclass) |
| small generic perturbation: finitely many nondegenerate critical points, `θ` the only reducible | froyshov9903 §2.1 p. 4 | 118–127 | as stated |
| admissible datum `w`, `E`, `θ`, determinant-one gauge group | km0807 §7.1 p. 52 | 1770–1782 | as stated ("admissible datum only") |
| Proposition 7.1 eigenvalue pairs; Remark `α=2µ(Σ)`, `β=−4µ(y)` | km0807 §7.2 p. 53 | 1801, 1817–1825 | as stated |
| `I(Y|R)_w` = the `(2g−2,2)` simultaneous eigenspace, positive genus | km0807 Def 7.3 pp. 54–55 | 1859–1867 | as stated (the eigenspace sentence is on p. 55) |
| `I(S¹×R|R)_w=C` | km0807 Prop 7.4 p. 55 | 1875–1877 | as stated |
| excision hypotheses, Theorem 7.7, tensor product for two components | km0807 §7.3 pp. 56–57 | 1931–1949 | as stated |
| genus one: `I(Y|Σ)` is the `+2` eigenspace of `µ(y)` | km0807 §7.3 proof of Thm 7.7 p. 57 | 1957–1959 | as stated |
| `G#` generated by `G_ev` and one degree-4 `g`; `C#(Y)=⊕ZΛ#(a)` | scaduto1401 §7.1 p. 29 | 1258–1271 | as stated |
| §2.2 heading; `dim M(Σ,F)=−3χ(Σ)` | dfl07032 §2.2 p. 7 | 224, 235–236 | as stated |
| Remark 2.2; (2.5); `J=*₂`; `π₂` | dfl07032 §2.2 p. 8 | 241–246, 257–266 | as stated |
| §5 Fredholm property; Appendix A begins p. 59 | dfl07038 pp. 40–58 | 31–36, 1921 | as stated |

**Adversarial table.** Rows 1–26, 29–40 of the previous report (PRREVIEW-InstantonFloerTheory~3, at 22d369a) cover statements this diff leaves untouched. They are carried forward with their computed values, which hold. Briefly: CS variation and gradient (1–3), ASD flow (4), `p₁`/`κ`/energies (5–6), the index and `Z/8` deck (7–8), split bundles (9), `tr₃=4tr₂` (10), reducibles (11), bubbles (12), determinant signs (13), `T³⊔T³` (14), μ degrees and `u²−64` (15–16), the dual adapter and reduced subquotient (18–22), `U(2)` lifts (23), the projector (24), `I#` of `S³` and `Σ(2,3,5)` (25), the surgery triad (26), surface moduli and framing (29–36), and Laurent lifts (37–40). The rows below are recomputed or new; the values are mine.

| # | Statement | Instances | Values on each side | Result |
|---|---|---|---|---|
| 17 | sign dictionary, now located at KM §7.2 | km0807 1824–1825 | `α=2µ(Σ)`, `β=−4µ(y)`, on p. 53 in §7.2 | holds |
| 27 | excision Check, rewritten | `S¹×T²⊔S¹×T²` along `{pt}×T²` | `[0,1]⊔[0,1]` glued crosswise is one circle, so `Ỹ` is one `S¹×T²` with two parallel tori; homologous tori give `µ(Σ̃₁)=µ(Σ̃₂)`, so `I(Ỹ|Σ̃)=I(Ỹ|Σ̃₁)=C` (Prop 7.4); left side `C⊗C=C` | holds |
| 28 | genus-one sectors, now located at KM §7.3 p. 57 | `T³`, `g=1` | `(2g−2,2)=(0,2)`; `I(T³)_w⊗C=C⊕C` with eigenvalues `±2`; `ker(µ−2)` has rank 1 | holds |
| 41 | twist on `S¹×S²`, rewritten | `H²(S¹×S²;Z/2)=Z/2` | the class dual to the `S¹` factor pairs to 1 with `[S²]`; a flat SO(3) bundle comes from `π₁=Z`, so it is pulled back from `S¹` and `w₂=0` | holds |
| 42 | Künneth and universal-coefficient attribution | pins | Tau Ceti files as listed; Mathlib has no Künneth claim left | holds except R02 |
| 43 | the tensor differential sign | `e↦f` (1→0), `g↦h` (2→1) | stated `(−1)^(|x||y|)`: `d²(e⊗g)=2f⊗h`; with `(−1)^|x|`: `d(e⊗g)=f⊗g−e⊗h`, `d²=f⊗h−f⊗h=0` | fails, R01 |
| 44 | relative grading and the sign | first factor shifted by `k` | `x⊗y↦(−1)^(k|y|)x⊗y` intertwines the two differentials; shifting the second factor changes nothing | R01 repair |
| 45 | Tor witness | `C: e↦2f` (1→0), `C⊗C` | `d(e⊗e)=2f⊗e−2e⊗f`; `d(e⊗f)=d(f⊗e)=2f⊗f`; `Z₁=Z(e⊗f−f⊗e)`, `B₁=2Z₁`, so `H₁=Z/2`; `H₀=Z/2=H₀⊗H₀`; `H₂=0`; tensor term in degree 1 is 0; `Tor₁(Z/2,Z/2)=Z/2` | holds; does not separate the two signs |
| 46 | unrolling | `C⊗C′` in degree `n` | unrolled: `⊕_(a+b≡n mod 8)`, 8 summands; tensor of the unrollings: `⊕_(p∈Z)`, infinitely many | holds |
| 47 | free-cycles Künneth | `0→Z→C→B[−1]→0` split | `H(Z⊗C′)=Z⊗H′`, `H(B[−1]⊗C′)=B⊗H′[−1]`, connecting map `±i⊗1`; `coker=H⊗H′`, `ker=Tor₁(H,H′)` (free resolution `B→Z`); uses freeness of `C` only | holds; R03 |
| 48 | tensor signs on `ZMod n` | `n=8`, `n=3` | `n` even: `(−1)^(i mod n)` is additive; `n=3`: `ε(0)=−ε(1)=ε(2)=−ε(0)` is impossible in `Z^×` | holds; R03 Check |
| 49 | empty union | `∅⊔Y` | unit `Z` in degree 0, `Z⊗C(Y)=C(Y)`; a direct-sum definition would give `0⊕C(Y)` and the unit `0` | holds |
| 50 | over `C`, homotopy equivalence to homology | `Split.lean` 357 | cycles and homology split over a field (`Semisimple`); `Tor` vanishes; `H(C⊗C′)=H⊗H′` | holds |
| 51 | universal coefficients on the dual complex | `X=C=(CF)*`, `α=ZMod 8`, Poincaré sphere | `0→Ext¹(H_(i−1)(C),Z)→H^i(CF)→Hom(H_i(C),Z)→0`; `H₀=H₄=Z` free, so the `Ext` terms vanish | holds |
| 52 | `I#` as `ker(µ−2)` | `Y=S³`, `I(T³)_w⊗C` | `C⊕C`, eigenvalues `±2`, kernel `C`, equal to `I#(S³)=C` (IF7 Check) | holds |
| 53 | the IF2 perturbation locator | dfl07032 2967–2976 | loops `S¹×D²→Y₀`, `τ_γ=∫τ_z µ`, `h_λ=G(τ_γ1,…,τ_γn)`, gauge invariant | holds |

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory*, §5.5 and §5.5.1 (pp. 134–144), now also cited in IF2's *Needs:* for the finite nondegenerate perturbed critical set. The book is not in an open repository. The homology-sphere case is checked at froyshov9903 lines 125–127; the admissible case rests on the book's locator.

## Source issues

- **Misprint** in km0807 at Proposition 7.4, p. 55: the source says `Y=S¹×R` "with Σ of positive genus", mixing the surface's two names; it should say `R` of positive genus; affects nothing.
- **Misprint** in km0807 at Definition 7.3, p. 55: the source says "the genus or R"; it should say "the genus of R"; affects nothing.
- **Misprint** in dfl07032 at §6.1, p. 75: the source says the measure on `D²` is a compactly supported "2-from"; it should say "2-form"; affects nothing.
