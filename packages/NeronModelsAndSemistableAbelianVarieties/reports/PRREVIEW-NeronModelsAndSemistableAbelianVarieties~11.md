# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at 861f8ce)

**Verdict:** accepted

Incremental re-review of the 42 lines changed since f2f4bf5, all in `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` (the pins sentence, the ReductiveGroups scope bullet and contract, 2.1, 2.2, Layer 2 Dependencies); `Suggested.lean` is unchanged since 8986e52 and nothing outside the folder changed. The four findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: line 353 now reads "The library pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`", which are the two revisions `lake-manifest.json` pins at this head (`2fd255d997…`, `1b1ccf4b08…`); no line of the README still names `6b7abb3` or `a91d3aa`.
- R02 — repaired: the scope bullet (lines 112–115), the contract (lines 490–494), 2.1 (lines 1219–1220: "when `M_k` is affine over any field `k`, the identity component `G°` of ReductiveGroups Layer 3, of which `identityComponentSpec` is the Tau Ceti instance"), the 2.2 agreement bullet (lines 1282–1285), both *Needs:* lines (1226–1228, 1289–1291) and Layer 2 Dependencies (1521–1522) now cite ReductiveGroups Layer 3 for the affine case, and 2.2 says "the general non-affine construction is this target's".
- R03 — repaired: 2.1 lines 1209–1213 add the specialisation of §7.9 to `B = S` a connected Dedekind scheme and `P` the global Néron model of 1.9, giving the open identity model `M⁰ ⊂ M` over `S`, smooth and of finite type, with local base changes the local `M⁰` and generic fibre `A`, "6.4a–6.4c use this form"; 1.9 is added to 2.1's *Needs:* line.
- R04 — repaired: the pull-request description's depends-on and merge-order blocks no longer list #1522 or GroupSchemesOverABase; `grep -c GroupSchemesOverABase README.md` is 0.

## Verified sound

**Gate**, rerun on 861f8ce:

```text
gate NeronModelsAndSemistableAbelianVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

`git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

**Dependency check** (movable):

```text
depcheck: 236 roadmaps, 2277 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The one supplier the diff adds, ReductiveGroups Layer 3, is on main; AlgebraicModuliForArithmeticGeometry (§7.9, cited for the new global form) is line 34 of the merge order, this roadmap line 66. No never-cite roadmap is named.

**Elaboration.** `lake env lean` on `Suggested.lean` at the pins: exactly four `declaration uses 'sorry'` warnings (lines 68, 83, 111, 123), exit 0. The file is unchanged since 8986e52, so the previous review's signature comparison (`LocalExistence`, `DedekindExistence`, `HasGoodModel`, `GoodIsogeny`, `EquationGoodComparison`: DVR, fraction-field, integral/Noetherian/integrally-closed-stalk/dimension-one, `IsElliptic`, `IsMinimal` binders all retained; the worker's `signatures.md` at this head shows the same five types), its padding probe (no sorried theorem closes under `first | rfl | simp | infer_instance | trivial | decide`) and its headline audit (1.7, 1.9, 5.2, 6.5 stated; Grothendieck's criterion, Néron–Ogg–Shafarevich, the cokernel identification, the Raynaud extension and the compatible-system interfaces named in the docstring as not statable, with the missing carriers) carry forward unchanged.

**The changed passages, resolved.**

- *§7.9 at AlgebraicModuliForArithmeticGeometry's head (#853)*, README line 9575: base `B` locally Noetherian, `P` a quasi-separated group algebraic space locally of finite presentation, geometric identity components smooth of locally constant dimension; conclusion an open group subspace `P⁰` of finite type, smooth over reduced `B`, formation commuting with arbitrary base change. A connected Dedekind scheme is Noetherian and reduced, and the global Néron model of 1.9 is separated of finite type over it with smooth fibres of constant dimension `g` (the same argument as 2.1's local case, via Stacks 045X), so the new sentence of 2.1 is a specialisation of §7.9 as claimed. Base change commutes, so `M⁰ ×_S Spec 𝒪_{S,s}` is `(M_{𝒪_{S,s}})⁰`, the local `M⁰` (1.9's Check: the localisation of the glued model at a closed point is the prescribed local model), and `M⁰ ×_S Spec K = A⁰ = A`.
- *6.4a–6.4c use the global form*: 6.4a lines 3987–3988 ("`S` a Dedekind scheme … `G = M⁰` its open identity model"), 6.4b lines 4026–4028 (`S` a nonempty open of `Spec 𝒪_F`, `G = M⁰`), 6.4c lines 4082–4084 (`M_A/M_A⁰` over a Dedekind `S`): each base is a connected Dedekind scheme, each uses exactly the object 2.1 now constructs. 6.4a's *Needs:* cites 1.9 and 2.1–2.2; 6.4c reaches 1.9 through 2.1's new *Needs:* line.
- *ReductiveGroups Layer 3 on main*, `TauCetiRoadmap/ReductiveGroups/README.md` lines 242–248: "Identity component `G°` and component group `π₀(G)`" for the roadmap's standing object, an affine group scheme of finite type over a field `k` (standing hypotheses, lines 14–15, with `μ_p` and `α_p` admitted, any field). Its open revisions agree: #1332 §3.2 (lines 736–769) constructs `π₀(G)` as a finite étale group without smoothness, and #1676 lines 1196–1207 states `π₀(G) = G/G°` finite étale. So "the identity component and component group of an affine group scheme of finite type over a field" (scope bullet, contract, 2.1, 2.2) describes what Layer 3 owns, and the agreement claimed in 2.1–2.2 is between objects of the same kind: 2.2's `π₀(G/k)` is finite étale for every finite-type `G` and restricts, for affine `G`, to the Layer 3 object.
- *Tau Ceti carriers at pin 2fd255d9*: `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec`, `Algebra/AlgebraicGroup/Connected/GroupScheme.lean:141`, under `variable {k : Type u} [Field k] [IsAlgClosed k]` (line 63); `componentGroupScheme`, `Connected/ComponentGroup/FiniteEtale.lean:51`, under the same binders (line 46), the constant group on `ConnectedComponents (PrimeSpectrum H)`. The README's qualification "when `M_k` is affine and `k` is algebraically closed" (lines 1217–1218, 1280–1282) and the contract's "require an affine finite-type group over an algebraically closed field" (line 390) match these binders, and the new clause "of which `identityComponentSpec` is the Tau Ceti instance" of Layer 3's `G°` is consistent with Layer 3's any-field generality.
- *Other passages naming the same carriers* (lines 250–253, 282–283, 390–391): unchanged and consistent with the new text (the component group of 2.2 "is for every group scheme of finite type over any field, not necessarily affine or smooth, and agrees with `componentGroupScheme` in the affine algebraically-closed case").
- *Build order*: 1.9 (Layer 1) precedes 2.1 (Layer 2); ReductiveGroups Layer 3 is a main-branch supplier. No process word, pull-request number or path enters the diff (gate `prnum=0`, `round-labels=0`).

**Seeded sample.** None of the fifteen sampled targets (3.8, 3.12, 4.4, 4.6, 4.13, 5.0c, 5.1a, 5.3d, 5.5, 6.1, 6.4, 6.4a, 6.4c, 6.7, 6.14) falls in the changed passages, and none of their statements or *Needs:* lines changed; 6.4a and 6.4c are touched only in that 2.1 now supplies the object they already used (checked above). Their locators were not re-opened in this incremental round; the mathematics of 6.4a and 6.4c is recomputed in the table below.

**Overlaps.** `scratch/overlaps.md`: no other pull request changes this roadmap; no cited id is dropped by an open pull request; none is defined only by an open revision. The closest roadmaps (FaltingsFinitenessAndIsogenyTheorems #1004, ArithmeticGaloisRepresentations #856, AbelianSchemesAndArithmeticModuli #849, FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, RelativeJacobiansAndIntegralCurveModels #1232) are the suppliers and consumers named in the scope section. Ownership of the non-affine `π₀(G/k)` is as the previous review settled it: the affine case is ReductiveGroups Layer 3 on main, now cited; nothing on main or earlier in the merge order owns the non-affine case; GroupSchemesOverABase (#1522) is on the never-cite list and consumes this roadmap's 2.3, so this roadmap is the owner.

**Adversarial table** (the changed statements with computed values; the rest carried from the previous report, which this head leaves untouched):

| Statement or convention | Instances tried | Computed values | Result / change |
|---|---|---|---|
| 2.1 global `M⁰ ⊂ M` over a connected Dedekind `S` (new) | §7.9 hypotheses on `B = S`, `P = M` of 1.9; `S = Spec ℤ`, `E: y² + y = x³ − x` (good outside 37, split `I₁` at 37); `dim A = 0`; `S` a field; base change to `𝒪_{S,s}` and to `K` | `S` Noetherian reduced; `M` separated of finite type with fibres smooth of dimension `g` (constant along `e(S)`, 045X); `M⁰` open, finite type, smooth over `S`; for `E`: `M⁰ = M` over `ℤ[1/37]`, special fibre at 37 `𝔾_m` while `M_{𝔽₃₇} = 𝔾_m` already (`n = 1`, `Φ = 0`), so `M⁰ = M`; `dim A = 0`: `M = M⁰ = S`; `S = Spec K`: `M = M⁰ = A`; `(M⁰)_{𝒪_{S,s}} = (M_{𝒪_{S,s}})⁰` by base change, `(M⁰)_K = A⁰ = A` | correct |
| 2.1 global form against 6.4a–6.4c | 6.4a `G = M⁰`, `[m]` on semiabelian fibres; 6.4c `𝒫_A = M_A/M_A⁰` at a split `I₅` place | `G` smooth finite-type group over `S`, semiabelian fibres where `A` is semistable, so `[m]` is fibrewise finite flat surjective and fibrewise flatness applies; `M_A/M_A⁰` has fibre `Φ = ℤ/5` at that place and `0` elsewhere, a skyscraper sum as 6.4c states | correct |
| 2.1 agreement with ReductiveGroups Layer 3 `G°` for affine `M_k` (new) | split `I₅`: `M_k = 𝔾_m × ℤ/5`; additive `𝔾_a`; `μ₂` over `𝔽₂` (affine, non-smooth, not a Néron fibre but a Layer 3 instance) | `G° = 𝔾_m` (geometrically connected Hopf quotient), index 5; `G° = 𝔾_a`; `G° = μ₂` with its nilpotent, as §7.9's Check and Layer 3's geometric-connectedness definition both give; wrong model "reduced identity component" would give `Spec 𝔽₂`, excluded by "open and closed subgroup cut out by the connected component" (not the reduced subscheme) | correct |
| 2.2 agreement with Layer 3 `π₀(G)` for affine `G` over any field (new) | nonsplit `I₅` over `k` finite; `μ₃` over `ℝ`; constant `S₃` | `π₀(G/k) = Spec k ⊔ Spec k₂ ⊔ Spec k₂`, degree 5, one `k`-point, matching Frobenius `−1` on `ℤ/5` (orbits `{0},{1,4},{2,3}`); `μ₃/ℝ`: `G° = Spec ℝ`, `π₀ = μ₃` of degree 3 with one real point (#1332 line 769 gives the same); `S₃`: `G° = 1`, `π₀ = S₃` non-commutative, so `galoisEquivalenceGrp`, not the commutative variant, is the carrier (README: commutative variant "when `G` is commutative") | correct |
| 2.2 agreement with `componentGroupScheme` (unchanged carrier, new wording) | `FiniteEtale.lean:51–55`, `k = k̄` | constant group on `ConnectedComponents (PrimeSpectrum H)` with trivial Galois action `= π₀(G_{k̄})`; over a non-closed `k` the carrier does not exist at the pin (binder `[IsAlgClosed k]`), which is why the README restricts the Tau Ceti comparison to algebraically closed `k` and the any-field comparison to Layer 3 | correct |
| README line 353 pins | `lake-manifest.json` at 861f8ce | Mathlib `1b1ccf4b088b…`, Tau Ceti `2fd255d997f…`; README `1b1ccf4b` / `2fd255d9` | correct (R01 repaired) |
| 1.7, 1.9, 1.8, 5.2, 6.5 (headlines, Lean unchanged) | as in the previous report | `Spec R` for `dim A = 0`; abelian scheme for good reduction; five components for split `I₅`; no proper smooth model for a Tate curve; `[p]` finite surjective; `valuation K (maximalIdeal R) W.Δ = 1` iff `ord(Δ) = 0` | correct, carried |
| 2.1 local, 2.2 construction and Checks, 1.3, 1.6, 1.9a, 2.3, 3.13, 4.8, 4.9, 4.14, 5.0a, 5.0b, 5.1, 6.0a, 6.4b, 6.11 and the rows carried from r8–r9 | as in the previous report | e.g. `Φ` by Kodaira type `0, ℤ/2, ℤ/5, (ℤ/2)², ℤ/4, 0, ℤ/2, ℤ/3`; `(t,a,u)` rows; `P₅ = X² + 2X + 5` for `y² = x³ − x`; `N(E[5]) = 1`; `v₂(Δ) = 14 > 10` | correct, carried |

**Declared gaps.** None declared; none needed.

## Not verifiable

- SGA 7 I, Exposé IX, §§1.1–1.2 (the locators of 2.1–2.2, pp. 321–323): the manifest records it as `uncertified`; cited by locator. The mathematics of 2.1–2.2 is checked in the table.
- Bosch–Lütkebohmert–Raynaud §1.2 Lemma 5, §1.4 Propositions 1–2 and Theorem 3 (1.9, which 2.1 now cites): paywalled; cited by locator, as in the previous reviews.
- The four admitted theorems of `Suggested.lean` are checked for elaboration, signature and non-triviality, not proved.

## Source issues

- none
