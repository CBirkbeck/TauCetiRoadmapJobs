# Review of ArithmeticGaloisRepresentations (pull request #856 at 3e99d0d)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` (5349 lines, read in full) and
`TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean` (451 lines; 20 sorried theorems, 13 real-bodied
definitions). No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).
The worker's gate fails on two rules (16 anchor-tag residues, 3 upward supplier edges); the targeted build passes;
my own elaboration of `Suggested.lean` gives `sorry` as the only warning (20 declarations). The mathematics of the
file and of the sampled sections is sound; the blocking findings are supplier-order and supplier-pin defects.

## R01 (P2) — Gate: three upward supplier edges, one of them not movable

Location: `README.md` lines 568–615 (supplier section for LFunctions), 2219–2220, 2247, 2298–2299, 2455 (*Needs:* lines
of §2.7); 461, 2813, 3499, 3525 (AlgebraicCurves); 3349, 4005, 4022, 4055 (ProfiniteProPGroups).

Claim: §2.7 consumes LFunctions Layers 0 and 5–6 (primitive Hecke completions, continuation and functional
equations, root numbers); Layer 3 and §5.13 consume AlgebraicCurves Layers 0, 2, 6, 8, 12; §§5.8, 6.4a consume
ProfiniteProPGroups Layers 0 and 3.

Witness: the dependency check at this head prints

```
not movable: ArithmeticGaloisRepresentations consumes LFunctions (#293) and is consumed by EllipticLegendreCharacterInterfaces (#96), which comes first: moving ArithmeticGaloisRepresentations after LFunctions would put a supplier after a consumer, a cycle through ArithmeticGaloisRepresentations
UPWARD: ArithmeticGaloisRepresentations (#46) -> AlgebraicCurves (#255) at README lines [461, 2810, 3499, 3525]
UPWARD: ArithmeticGaloisRepresentations (#46) -> LFunctions (#293) at README lines [568, 2219, 2247, 2297, 2445]
UPWARD: ArithmeticGaloisRepresentations (#46) -> ProfiniteProPGroups (#274) at README lines [3348, 4005, 4022, 4054]
depcheck: 156 roadmaps, 1083 edges, 3 problem(s)
```

The LFunctions edge is real: LFunctions is a new-roadmap pull request by another author, listed at position 294 of
the merge order, and this roadmap cannot be moved below it because EllipticLegendreCharacterInterfaces (position 97)
consumes this roadmap. The AlgebraicCurves and ProfiniteProPGroups edges look like false positives of the order file:
both roadmaps are on main (`TauCetiRoadmap/AlgebraicCurves/README.md` line 776 is Layer 8 with the function-field
ramification groups at lines 812–820, and Layers 0, 2, 6, 12 are at lines 362, 436, 653, 1085;
`Completed/ProfiniteProPGroups/README.md` has Layer 0 at line 131 and Layer 3, Frattini theory and the Burnside basis
theorem, at lines 312–497), and roadmaps on main are allowed suppliers. I flag the two lines as probable false
positives for the board; the gate nevertheless fails until they are settled.

Repair (LFunctions): break the edge by moving ownership. The LFunctions-dependent targets of §2.7, which are the
Hecke zeta-integral comparison (lines 2199–2220), the restated finite-order Hecke functional equation (2235–2247),
the identification of `W_H` with LFunctions' root numbers inside the root-number product formula (2284–2287) and
the completed Artin functional equation obtained by Brauer induction from Hecke equations (2344–2366), belong to a
roadmap placed after LFunctions (AutomorphicLFunctionsAndLocalFactors AL.1 already owns the neighbouring
`hecke-l-functional-equation`); keep here only the finite Gauss-sum constants, the standard-test-function
evaluations, the finite-idele product identity `∏_v ε_v = W_H A^(1/2−s−t)` with `W_H` defined by the finite sum,
and the Deligne–Langlands existence theorem stated against a named supplier of the Artin functional equation.
Delete LFunctions and GlobalNumberFields' Hecke completions from the supplier contracts and *Needs:* lines.

## R02 (P2) — A supplier contract cites Tau Ceti declarations that are absent at the pin

Location: `README.md` lines 362–371 ("The native point-level torsion-lifting interface is …
`WeierstrassCurve.torsionReductionAddEquiv` … The interface at `76f3600b…` is absent from the `a91d3aaf` pin") and
§6.1 lines 3628–3629 ("Use the native `WeierstrassCurve.torsionReductionAddEquiv` and its forward-reduction and
inverse-lifting laws for this point-level step").

Claim: the point-level torsion lifting in §6.1's first target is supplied by four Tau Ceti declarations.

Witness: the pinned Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (`lake-manifest.json`); at that pin the
directory `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/` has no `TorsionReduction.lean`, and
`torsionReductionAddEquiv`, `existsUnique_torsion_lift`, `coe_torsionReductionAddEquiv_apply`,
`reductionHom_torsionReductionAddEquiv_symm` occur nowhere in the pinned sources (the worker's citation check lists
all four as found nowhere). A declaration at a later commit is not a supplier; at the pin the step has no owner
other than the target's own proof sketch, and the paragraph is also process narrative (commit hashes, "pin").

Repair: delete lines 362–371. In §6.1, state the point-level step as part of the target: for `N` invertible in `k`,
each `N`-torsion point of `Ẽ(k′)` lifts uniquely to `E(K′)` for the complete unramified lift `K′/K` (Hensel lifting
on the smooth integral model, and `[N]` an automorphism of the formal-group kernel), using EllipticCurves Layer 4's
reduction map and formal-group kernel, which the supplier contract already names; mention no Tau Ceti declaration
for it.

## R03 (P3) — Gate: sixteen anchor tags

Location: `README.md` lines 963, 1164, 1449, 1482, 1504, 2049, 2136, 2197, 2233, 2257, 3617, 3653, 3713, 3868,
3893, 3924 (`<a id="…"></a>`).

Witness: the gate's residue rule (`<a id=` anchor tags) fails with these 16 lines. The anchors are used by the
in-file links `[§6.1](#elliptic-residual-representation)` and by other roadmaps' links.

Repair: remove the tags and refer to the targets by section number and bold title (the house form), replacing each
`(#anchor)` link by "§6.1, *Basis-free elliptic residual representation*".

## R04 (P3) — Process narrative in a timeless document

Location: `README.md` lines 112 and 394 ("The LocalFieldsRamification amendment's Layers 3a and 4a"), 131 and 413
("The ClassFieldTheory amendment's Layer 7"), 40–41 ("endpoints whose prerequisite objects are absent at the pins"),
99–100 ("absent from the `a91d3aaf` pin"), 1434 ("at the pin"), 2834–2835 ("At the pin Tau Ceti's
`complexConjugationAt` is defined only for finite extensions"), 4760 and the References (lines 5211–5214: "page
locators use arXiv …v3 … rather than the published article").

Claim: none; these sentences describe the state of other repositories at a moment.

Witness: the README rules forbid process words ("amendment", "pin", version notes); a reader a year from now cannot
tell what they refer to. The LocalFieldsRamification sections 3a.1–3a.3 and 4a.1–4a.3 and the ClassFieldTheory
unit-filtration target do exist at the heads of their open pull requests (see *Verified sound*), so the citations
themselves stand.

Repair: write "LocalFieldsRamification §§3a.1–3a.3 and 4a.1–4a.3" and "ClassFieldTheory Layer 7,
*Unit-filtration reciprocity*"; drop every "at the pin"/"pin" sentence (state the mathematical reason instead, for
example "Tau Ceti's `complexConjugationAt` is relative to a finite extension; the absolute predicate is defined
here"); move version notes on locators into the References entries as "(arXiv v3 pagination)".

## R05 (P3) — Pull-request URLs as citations

Location: `README.md` lines 570–576: links to pull requests 248, 446 and 286 of the roadmap repository and to a
contributor's fork at a commit.

Witness: the policy is to cite roadmaps by name and section only, never by pull-request number or URL; the gate's
`prnum` scanner does not catch URLs.

Repair: replace by "LFunctions Layers 0, 5–6", "CFSGBasicProperties T1–T2" (on main) and drop the ThetaSeries
sentence (a transitive dependency of LFunctions is not this roadmap's to record).

## R06 (P3) — Backticked names of this roadmap's own that `Suggested.lean` does not declare

Location: 67 names, for example `README.md` line 64 `WeilDeligneRep.IsWeilNumber`, 627–628
`ContinuousRep.endTrace`, `LinearMap.projectiveTrace_eq_categoricalTrace` (an AdicSpacesPartIII target name),
1083 `ContinuousRep.IsAbsolutelyIrreducible`, 1730–1762 `fundamentalCharacter_pow_p`,
`cyclotomic_restrict_tameInertia`, 3081 `index_ge_of_ne_top_PSL2`, 4959–4964 `ResidualImage.GSp4.IsEnormous`,
`IsTidy`, `IsVast`, 5058–5059 `ResidualImage.TaylorWilesImageConditions`.

Claim: lines 34–38 declare a convention: "Other names inside targets are proposed library interfaces".

Witness: the house rule is that a backticked name of the roadmap's own claims that `Suggested.lean` declares it; the
worker's citation check lists these 67 as declared nowhere. `fundamentalCharacter_pow_p` and
`cyclotomic_restrict_tameInertia` are also absent from PadicLocalLanglandsForGL2Qp §0.3 (they are this roadmap's
abbreviations, line 1733), and `index_ge_of_ne_top_PSL2` is in neither Mathlib nor Tau Ceti at the pin.

Repair: keep the *Lean:* notes for the 20 declared statements; write the other names in prose (or italics as
proposed names without backticks) and delete the convention sentence in lines 34–38.

## R07 (P3) — BLGG is cited for a statement that the cited version contradicts

Location: `README.md` lines 4860–4863: "for `p > 2` a finite irreducible `G ⊆ GL₂(F̄_p)` is adequate unless `p = 3`
with projective image `PSL₂(F_3)` or `p = 5` with `PSL₂(F_5)`, while `PGL₂(F_5)` is adequate (BLGG, Prop. A.2.1,
p. 30 …)".

Claim: PGL₂(F₅)-type images are adequate, attributed to BLGG arXiv:1106.5586v1, Proposition A.2.1.

Witness: in the cited version, Proposition A.2.1 (page 30) lists "`l = 5` and projective image conjugate to
`PGL₂(F_5)` or `PSL₂(F_5)`" among the non-adequate cases. The roadmap's claim is nevertheless correct: with
`U` the upper unipotent group of `SL₂(F_5)` and `M = ad⁰`, `H¹(U, M) = M/(u−1)M` is the line of `E₂₁`, on which
`diag(a, d)` acts by `(d/a)²`, that is by `det²`; so `H¹(GL₂(F_5), ad⁰) ↪ H¹(U, ad⁰)^{T′} = 0`, while
`H¹(SL₂(F_5), ad⁰)` is one-dimensional. GN Lemma 3.2.3 (page 15) states the same exceptions as the roadmap.

Repair: cite the published BLGG (Math. Ann. 356) or GN Lemma 3.2.3 for this sentence, and record the arXiv v1
statement as an erratum (see *Source issues*).

## R08 (P3) — Locator slips

Location and witness, one bullet each:

- `README.md` line 3749 cites "DDT, §2.2, Thm 2.9, p. 56" for "`E[ℓ]` is reducible iff `E` has a `K`-rational cyclic
  `ℓ`-isogeny, with character `ψ` on the line and `χ̄_ℓψ⁻¹` on the quotient". DDT Theorem 2.9 (page 56) is Mazur's
  irreducibility theorem for `E/ℚ`; the isogeny criterion is only alluded to in the preceding paragraph. Cite
  Silverman AEC III.4 and III.8 (isogenies with given finite kernel) and Prop 2.8(a) for the determinant.
- Line 152: `completionAlgHom` is NumberFieldArithmetic §5.2 (`Completed/NumberFieldArithmetic/README.md` line
  1351), not §5.6; `decompositionHom` is §5.6 (line 1501).
- Line 1301: "SchemeAndStackFoundations layer 1 for affine schemes": Layer 1 is descent, algebraic spaces and
  stacks (line 2044 of that README); affine schemes are Layer 0 (line 463).
- Line 1300: "ReductiveGroupsPartII RG2.5 for reductive group schemes": RG2.5 is integral dual data; reductive
  models over `O` are RG2.3.1 (*reductive-model*).
- Line 1125: "Mathlib `PadicAlgCl.valued`": no such declaration at the pin; Mathlib has
  `PadicAlgCl.normedField` and `PadicAlgCl.normedAlgebra` (`Mathlib/NumberTheory/Padics/Complex.lean`, lines 67,
  74).
- Line 2999: "(DP, Lemma 1.13, p. 8)" for the structure of irreducible `G ⊂ GL₂(k)` with abelian projective image;
  Lemma 1.13 is the `ℚ(√p*)`/`ℚ(ζ_p)` irreducibility criterion, the structure statement is inside its proof. Write
  "proof of Lemma 1.13".

Repair: as stated per bullet.

## R09 (P3) — "No small subgroups" is stated beyond its source and its route is unnamed

Location: `README.md` lines 983–986: "in a normed ring which is a normed `ℝ`-algebra a subgroup of the units with
`sup_{g∈G} ‖g − 1‖ < 1` is trivial … (DDT, §2.1, p. 53). *Needs:* Mathlib `NormedAlgebra`."

Claim: the statement holds in every normed real algebra.

Witness: it is true, but for an infinite-dimensional algebra the proof needs the spectrum of a doubly power-bounded
element with spectrum `{1}` (Gelfand's theorem on the completion), which neither DDT (finite-dimensional, continuous
homomorphisms into `GL_n(ℂ)`) nor the *Needs:* line supplies. Instance: in `M_n(ℂ)` the eigenvalue argument
suffices; in a Banach algebra with a quasinilpotent `N ≠ 0`, excluding `g = 1 + N` needs the power-boundedness
theorem.

Repair: either state it for finite-dimensional normed `ℝ`-algebras (what every consumer in §1.4 uses), or name the
route (completion, spectrum in the unit circle, Gelfand's theorem) in the *Needs:* line as a target.

## Verified sound

**Build and form.** `lake env lean TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean` from the
worktree: 20 `declaration uses 'sorry'` warnings, no other output (8.5 s). Imports: `import Mathlib` plus five
`TauCeti.*` modules, all with object files at the pin. No `set_option`, no `lemma`, no `#eval`, no sorried data, one
module docstring naming the unstated headlines (Weil–Deligne adapter and local constants, conductors on the
perfect-residue filtration, abelian Tate-module adapters, function-field recognition, `Ĝ`-valued models). Namespace
`TauCetiRoadmap.ArithmeticGaloisRepresentations`.

**Signature check.** One scratch file with `#check @name` for all 33 declarations imported the compiled module and
elaborated with no error (3.1 s). Each elaborated type was compared with its README statement: the context binders
are all present in the declarations themselves (`CompactSpace`/`T2Space` on `baire_descent` and
`exists_integral_conj_GL`; `IsModuleTopology` and `FiniteDimensional` on `grothendieck_quasiUnipotent`,
`iso_of_frobenius_charpoly_eq`, `compact_matrix_frattini_isOpen`; `IsAdicComplete`, finite residue field and the
adic-neighbourhood hypothesis on `carayol_conj_of_trace_eq`; `[Finite k]` on both enormous-image criteria;
`[Finite H]` on the adequacy criteria). The `ResidualImage` section uses `Type` throughout, as the Conventions
announce for `Rep`-based cohomology. Nothing changed.

**Padding probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | infer_instance | simp |
fail`. Result: 20 errors for the 20 theorems (11 where all tactics fail, 9 where `simp` rewrites coercions and
leaves the goal open). No declaration closes; no declaration restates a definition, mirrors a Check or computes a
value.

**Headlines.** The README's end theorems: recognition by Frobenius polynomials (stated,
`iso_of_frobenius_charpoly_eq`), the Tate-module adapters (not statable: `AbelianTate` is a supplier target; the
docstring says so), the residual-image criteria (stated: `isAbsolutelyIrreducible_of_isOddAt`,
`isAdequate_of_coprime_or_large`, `isAdequate_tensor`, `isEnormous_iff_isAdequate_rankTwo`,
`isEnormous_of_contains_SL`, `isEnormous_symPower`). Also stated: coefficient and integral descent, Brauer–Nesbitt,
Grothendieck monodromy, Dickson, the image algebra and the descent obstruction, finite-field and trace-field
realization, Carayol, Tate's projective lifting, the Frattini criterion, the Tate-curve unramifiedness criterion.
Not statable and named: Weil–Deligne purity and local constants (Weil group), Artin and Swan conductors over perfect
residue fields (supplier filtration), Serre's wild bound, function-field recognition, `Ĝ`-valued integral models.
No statable headline is absent and none is forced through a stand-in.

**Adversarial table.** One row per statement checked; the values are mine, computed from the definitions.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions: `ContRepresentation` asks only for continuity of each operator | Mathlib pin, `RepresentationTheory/Continuous/Basic.lean` L54–57 | `structure ContRepresentation` is a bare `G →* V →L[R] V`; `a ↦ (1+ℓ)^a` on discrete `ℚ_ℓ` is such a hom, its kernel `{0}` is not open | sound |
| Conventions: Weil–Deligne sign witness on `Sp(2)` | `N e₀ = e₁`, `r(Φ)e₀ = e₀`, `r(Φ)e₁ = q e₁` | `r(Φ)Nr(Φ)⁻¹e₀ = r(Φ)e₁ = q e₁ = q N e₀`; supplier SmoothRepresentationsOfLocalGroups `wd-raw-parameters` states `r(w)Nr(w)⁻¹ = q^{deg w}N`, arithmetic degree 1 | agree |
| Conventions: Euler factor of `ℤ_ℓ(1)` | `F = ℚ`, `p ≠ ℓ` | `χ_ℓ(Frob_p) = p`; geometric lift gives `1 − p^{−1−s}`; `L(ℚ_ℓ(1), s) = ζ(s+1)` | sound |
| Conventions: conductor of `Sp(2)` | `V^I = V` (dim 2), `ker N` dim 1 | `0 + 0 + (2 − 1) = 1` | sound |
| §1.1 determinant on a non-free projective module | `A = ℚ×ℚ`, `M = (1,0)A`, `u = 2` | completed operator on `A` is `(2,1)`; raw `LinearMap.det` on `M` is `1` (no finite basis) | sound |
| §1.1 nonprincipal determinant line | `A = ℤ[√−5]`, `I = (2, 1+√−5)` | `I² = (2)`; norm of a generator would solve `a² + 5b² = 2`, impossible | sound |
| §1.2 lattice conjugacy Check | `(1 a;0 1)` vs `(1 ℓa;0 1)` | conjugate by `diag(ℓ,1)` over `ℚ_ℓ`; image of `ρ(1)−1` saturated vs `ℓ`-divisible, not conjugate over `ℤ_ℓ` | sound |
| §1.2 Tate twist signs | `c` complex conjugation, Frobenius above `p ≠ ℓ` | `χ_ℓ(c) = −1 = χ_ℓ(c)⁻¹`; at Frobenius `p` vs `p⁻¹` | sound |
| §1.5 `baire_descent` | `n = 0`; `Γ` compact Hausdorff | countably many closed subgroups `ρ⁻¹(GL_n(E))` cover `Γ`; Baire gives an open one, finite index, finite extension | sound (BHKT p. 17 proof) |
| §1.8 `iso_of_charpoly_eq` for a monoid, any field | `Γ = ℤ`, `k = F_p(t)`, operator with minimal polynomial `X^p − t` | semisimple over `k`, not after base change; charpolys still determine the semisimple module by irreducible factors; Amitsur's formula extends charpolys from `Γ` to `k[Γ]` (Chenevier Lemma 1.12(ii)) | sound |
| §1.8 traces over `F₂`, `d = 2` | `Γ ⊂ GL₂(F₂) = S₃` | `det ≡ 1`, so charpoly `X² + tX + 1` is determined by the trace | sound |
| §1.8 Check: trace needs `n!` invertible | `Γ = ℤ/3`, `E = F₄`, `1⊕1` vs `χ⊕χ` | traces `0 = 0`; charpolys `(X−1)²` vs `(X−ω)²` | sound |
| §1.9 `S₃` sum-zero plane mod 2 | transposition on `{(1,1,0),(0,1,1),(1,0,1)}` | fixes one, swaps two: `J₂(1)`; `residual(Res) = 1⊕1`; `(J₂(1))^{ss} = 1⊕1` | sound |
| §1.12 induction semisimplicity | `[Γ:N]` invertible, `U` semisimple over `H` | `Res_N Ind U = ⊕` conjugates of `Res_N U`, semisimple as `[H:N]` invertible; averaging over `Γ/N` | sound |
| §2.1 `IsArithFrobAt` exponent | Mathlib `RingTheory/Frobenius.lean` L54–55 | exponent `Nat.card (R ⧸ Q.under R)` with `R = 𝓞 F`: `q_v`, finite, as required | sound |
| §2.1 `S₃` local-restriction Check | `A = (0 1;1 0)`, `B = (0 −1;1 −1)` | `B⁻¹ = (−1 1;−1 0)`, `B⁻¹AB = (−1 0;−1 1) = A′`; `BA = A′`, `A′B = A`, so `BA ≠ A′B` | sound |
| §2.2 twist formula | `P(ρ⊗χ, X)` | `det(X − χ(Φ)ρ(Φ)) = χ(Φ)^n P(ρ, χ(Φ)⁻¹X)` | sound |
| §2.3 tame-character sign | `α = π^{1/ℓⁿ}`, `w⁻¹α = ζα`, `σα = ζ_σα` | `wσw⁻¹α = ζ^{χ(w)}ζ_σ^{χ(w)}ζ^{−χ(w)}α = ζ_σ^{χ(w)}α`; Tau Ceti `inertiaPadicTameCharacter_conj` (PadicCharacter.lean L152–155) uses `galoisRepresentation g •` | agree |
| §2.3 `Ind χ` irreducibility | `χ|_I = ω₂^j` | `χ^{Frob}|_I = ω₂^{pj}`; equal iff `(p+1) | j`; extension exists since `H²(C₂, F̄_p^×) = 0` | sound |
| §2.4 `grothendieck_quasiUnipotent` uniqueness | two nilpotent `N, N′` agreeing on open `J` | `exp(tN) = exp(tN′)` for `t` in an open subgroup of `ℤ_ℓ`, some `t ≠ 0`; log gives `N = N′`; relation for all `w ∈ G_K` from `t(wσw⁻¹) = χ(w)t(σ)` | sound |
| §2.4 Check `ℓ = p` | `χ_p` on `G_{ℚ_p}` | inertia image `ℤ_p^×` infinite, not unipotent | sound |
| §2.5 local factors | `L(ω)`, `L(Sp(2))`, `L(Sp(2)^∨)` | `1 − q⁻¹X`, `1 − q⁻¹X` (on `ker N = ⟨e₁⟩`, `r(F)e₁ = q⁻¹e₁`), `1 − X` (on `ann(im N)`) | sound |
| §2.5 cyclic block | `φ = 2`, two blocks | `[[0,2],[1,0]]`, charpoly `X² − 2`, `det(1 − Xφ₂) = 1 − 2X²` | sound |
| §2.5 Check: lift dependence of Frobenius semisimplification | `F₃`, `K = ℚ₇`, `r(τ) = (1 1;0 1)`, `r(Φ) = 1` | `(1 1;0 1)^7 = (1 1;0 1)` over `F₃`; semisimplifying at `Φτ` sends `Φ ↦ r(τ)⁻¹ ≠ 1`; not isomorphic | sound |
| §2.5a dual/geometric comparison | unramified `ζ`, `ζ³ = 1` | arithmetic `1 − ζT`; geometric `1 − ζ⁻¹T`; dual with geometric lift `1 − ζT` | sound |
| §2.6 `sl₂` triple | `He_i = (d−2i)e_i`, `Ee_i = i(d−i+1)e_{i−1}`, `Ne_i = e_{i+1}` | `[H,N]e_i = −2e_{i+1}`; `[H,E]e_i = 2i(d−i+1)e_{i−1}`; `[E,N]e_i = ((i+1)(d−i) − i(d−i+1))e_i = (d−2i)e_i` | sound |
| §2.6 monodromy filtration on `Sp(2)` | `M_a = Σ_{i−j=a} ker N^{i+1} ∩ im N^j` | `M_{−2} = 0`, `M_{−1} = M_0 = ker N`, `M_1 = V` | sound |
| §2.6 char 2 tensor Check | two length-two strings | `(N⊗1 + 1⊗N)² = 2N⊗N = 0` | sound |
| §2.7 local constant, `a = 0` | `f = 1_O`, `ν = n(ψ)` | `Z(f̂, χ⁻¹|·|, 1−s) = vol(O) χ(ϖ^ν) q^{ν(1−s)} L(1−s, χ⁻¹)`, so `ε = χ(c) q^ν vol(O)` with `v(c) = ν`; self-dual: `ω(ϖ^ν) q^{(1/2−s)ν}` | sound |
| §2.7 local constant, `a ≥ 1` | `x = c⁻¹y`, cosets of `1 + ϖ^aO` | `dx = q^{a+ν} dy`, coset measure `vol(O)q^{−a}`: `χ(c) q^ν vol(O) Σ_y χ⁻¹(y)ψ(y/c)`; `|𝔤| = 1` | sound |
| §2.7 Check over `ℚ₃` | quadratic residue character, `ψ(x) = e^{−2πi{x}₃}` | `e^{−2πi/3} − e^{−4πi/3} = −i√3`; `𝔤 = −i`; `ε = −i·3^{1/2−s}` | sound |
| §2.7 root number of `χ₄` | `a = 2`, `c = 4` | `ψ(1/4) − ψ(3/4) = −i − i = −2i`; `𝔤 = −i`; `ε₂ = −i·4^{1/2−s}`; `ε_∞(sgn) = i`; product `4^{1/2−s}`, `W = 1` | sound |
| §2.7 dual identities | `ψ(−x)` vs `ψ` | additive scaling by `b = −1` multiplies by `χ(−1)`; the two forms agree since `χ(−1)² = 1` | sound |
| §2.7 `ε(Sp(2))` | `n(ψ) = 0`, `vol(O) = 1` | `ε(r) = 1`, `det(−r(F) | V/ker N) = −1` | sound |
| §3.1 eventual Herbrand formula | Artin–Schreier `y^p − y = t⁻¹` | `e = p`, `d = 2(p−1)`, `ψ(u) = pu − 2p + 2 + p − 1 = pu − p + 1`, integral `p − 1` | sound |
| §3.1 `ℚ₂(ζ₈)` | lower groups orders `4,4,2,2` | Hilbert `3+3+1+1 = 8 = d`; `φ(3) = 1 + 1/2 + 1/2 = 2`; `ψ(u) = 4u − 5`; integral `8 − 4 + 1 = 5` | sound |
| §3.1 `ℚ₃(ζ₉)` | `e = 6`, `G₁ = G₂ = C₃` | `5 + 2·2 = 9 = d`; `φ(2) = 1`; `ψ(u) = 6u − 4` | sound |
| §3.1 Swan of `χ₈` | weighted sum over `ℚ₂(ζ₈)` | `1·1 + (2/4)·1 + (2/4)·1 = 2`; unweighted `3` | sound |
| §3.2 reduction of `Sp(2)` on `Oe₁ ⊕ ℓOe₂` | `σ(ℓe₂) = ℓe₂ + ℓt e₁` | `≡ ℓe₂ mod ℓΛ′`: unramified reduction, `a = 0` vs `a = 1` | sound |
| §3.3 `a(r,N)` | `Sp(2)⊗χ`, `χ` tame | `0 + 2 − 0 = 2 = n·a(χ)`; replacing `(ker N)^I` by `ker N` gives `1` | sound |
| §3.3 Check `N(ρ̄)` | `χ̄_{−4}⊕1` over `F₃` and `F₂` | `4` (exponent 2 at 2); over `F₂` trivial, `1` | sound |
| §3.5 induced invariants | `D` normal, Mackey | `H\Γ/D = Γ/HD`, each summand's `D`-invariants `U^{H∩D}`: `[Γ:HD]·dim U^{H∩D}`; `[G_K : G_L I_K] = f` | sound |
| §3.5 induction formula (b) from (a),(c) | general `L/K` | `Sw = δ dim V + f a_L − ([L:K]−f)dim V − f codim V^{I_L} = f Sw_L + (δ − [L:K] + f) dim V`; `Ind 1`: `f(d − e + 1)` | sound |
| §3.5 Check `ℚ₂(i)/ℚ₂` | `Ind 1 = 1 ⊕ χ_{−4}` | `0 + 2 = 2 = v₂(−4)` | sound |
| §3.7 quadratic conductors over `ℚ₂` | discriminants `−4, 12, 8, −8, 24, −24` | exponents `2, 2, 3, 3, 3, 3` | sound |
| §3.7 Artin–Schreier over `F₃((t))`, `m = 2` | `a = m+1`, `d = (p−1)(m+1)` | `3`, `6` | sound |
| §4.1 `isAbsolutelyIrreducible_of_isOddAt` | irreducible, not absolutely: `End_Γ V = D`, `[D:k] = 2` | `ρ(c) ∈ D`, `ρ(c)² = 1` so `ρ(c) = ±1`, `det = N_{D/k}(±1) = 1 ≠ −1`; char 2: `ρ(c) = 1` | sound |
| §4.1 Checks | `χ̄_p⊕1`; `χ_{−3}⊕χ_{−4}` over `F₅`; `ℚ(i)` | `det c = −1`; `ρ(c) = −1`, `det = 1`; no real place, vacuous | sound |
| §4.4 `dickson_projectiveImage`: dihedral orders | `D_n` with `p | n` | `p` odd: `C_n` would contain a unipotent commuting with a semisimple, impossible, `n = p` forces a Borel; `p = 2`, `n` even: central unipotent, Borel; so `p ∤ n`, `n ≥ 2` (`D₂` = Klein occurs for `Q₈`) | sound |
| §4.4 trace-ratio field | `πG` conjugate to `PSL₂(F_q)` or `PGL₂(F_q)` | `tr²/det` is a projective class function; squares generate `F_q` (`(q+1)/2 > √q`); so `F₀ = F_q` | sound |
| §4.5 Checks | `F₇`, `F₁₁`, `F₉` | `60 ∤ 336`; `11 ≡ 1 mod 5`; `⟨(1 1;0 1),(1 0;1 1)⟩ = SL₂(F₃) ⊊ SL₂(F₉)` | sound |
| §4.6 bad dihedral Check | `x³ − x − 1`, `p = 23` | disc `−23`, `p* = −23`; `F₂₃` has no cube roots of unity: `χ⊕χ²` irreducible over `F₂₃`, not absolutely | sound |
| §4.6 dihedral Check over `F = ℚ(√2,√3)`, `p = 3` | `z` of order 8 in `F₉^×` | `ℚ₃(√2) = ℚ₃(i)` (both `2`, `−1` nonresidues mod 3); `D₈` with `ρ̄(r) = diag(z,z⁻¹)`, projective order of `z²` is `4`; `det ρ̄(c) = −1` | sound |
| §4.7 index bound | `p = 5`, `a = 2` vs `a = 1` | `26 > 10`; preimage of `A₄ ⊂ A₅` has index `5 < 10` | sound |
| §5.1 `frobeniusSet Pl` nonempty and dense | `Pl` of density 1 | primes `Q | v` exist, `D_Q → Gal(k̄/k_v)` onto; Chebotarev puts a Frobenius in every open coset | sound |
| §5.3 `iso_of_frobenius_charpoly_eq` | `E` Hausdorff, `ContinuousSMul E_i E` | `algebraMap E_i E` continuous; charpoly coefficients continuous; equality on a dense set extends; Brauer–Nesbitt over `E` | sound |
| §5.4 Chenevier identity | `g = h = diag(a,b)`; wrong form at `g = diag(2,3)`, `h = 1` | `2ab − (a+b)² + a² + b² = 0`; `6(1/2+1/3) − 10 + 5 = 0` vs `30 − 10 + 5 = 25` | sound (Chenevier Lemma 1.9, p. 11) |
| §5.5 `imageAlgebra_isCentralSimple` | `n ≥ 1`, `K` algebraically closed | Gram matrix `tr(ρ(γ_i)ρ(γ_j)) ∈ k(ρ)` invertible: `B` has `k(ρ)`-dimension `n²`, `K ⊗ B ≅ M_n(K)`; reduced charpoly in `k(ρ)[X]` by Galois descent from a Galois splitting field | sound |
| §5.5 Check `Q₈` | `k = ℝ`, `ℚ_ℓ` | `B ≅ ℍ`, `s = 2`; `(−1,−1)` ramified exactly at `2, ∞`: `s = 1` for odd `ℓ` | sound |
| §5.6 `realizable_iff_imageAlgebra_split` | `L ⊗ B ≅ M_n(L)` | forward: `L`-algebra hom from a simple algebra of dimension `n²` onto `M_n(L)`; backward: two `K`-isomorphisms differ by an inner automorphism | sound |
| §5.7 `conj_into_of_trace_mem_of_distinct_eigenvalues` | semisimple `r = ⊕ r_i` | `r^σ ≅ r`; conjugate constituents share no eigenvalue of `r(γ₀)`, so each `r_i^σ ≅ r_i`, traces in `M`; `r_i(γ₀)` spans a split étale maximal subalgebra `M^{n_i}` of `B_i`, so `B_i` splits; multiplicities `1` | sound (stronger than BLGGT A.1.5) |
| §5.7 `realizable_of_charpoly_mem` | DS Lemme 6.13 (p. 523) | same hypotheses (any group `Φ`, `k′` finite, semisimple, charpoly coefficients in `k`), same conclusion | agree |
| §5.8 Haar measure of `GL_n(O_E)` | `n = 0`, `n = 1` | `∏ (1 − q^{−i})`: `1`, `1 − q⁻¹` | sound |
| §5.8 zero sets in compact domains | `A = F_q` vs no isolated points | `X^q − X` vanishes everywhere; otherwise finitely many roots per variable, null by Fubini | sound |
| §5.10 `carayol_conj_of_trace_eq` without `d!` | `r(A[Γ]) = M_d(R)` by Nakayama | `tr(r′(x)z) = 0` for all `z` when `r(x) = 0` (perfect trace form), so `ker r = ker r′`; `r′ = φ∘r`, `φ` inner (local ring); `ḡ` scalar, normalise to `1` | sound |
| §5.11 annihilation identity | `s = ρ`; `ρ = 1^{⊕4}`, `s` unipotent | Cayley–Hamilton; `(s(g)−1)⁴ = 0` | sound |
| §5.13 function-field Chebotarev | constant cover of degree `a` | classes occur only in degrees `n ≡ b mod a`; `Σ_{n≡b} z^n/n = (1/a)log(1/(1−z)) + O(1)`; density `#B/#H` | sound |
| §6.1 `y² = x³ + 1` over `ℚ₅`, `N = 7` | `#E(F₅)` | `x = 0,2,4` give `2,2,1` points plus `∞`: `6`; `a₅ = 0`, polynomial `X² + 5`, determinants `5` and `5⁻¹ = 3` in `F₇` | sound |
| §6.1 supersingularity | `p ≡ 2 mod 3` for `y² = x³+1`; `p ≡ 3 mod 4` for `y² = x³ − x` | `a_p = 0` at `5, 11, 17, 23`; CM by `ℤ[i]` | sound |
| §6.2 `det = χ_ℓ^g`, conjugation eigenspaces | `μ = −1` | `±1`-eigenspaces isotropic, each `≤ g`, sum `2g`: Lagrangian; `tr = 0`, `det = (−1)^g` | sound |
| §6.2 eigensum Checks | swap on `ℤ²` | `{(x,y) : x ≡ y mod 2}` contains `(1,1)`, `2ℤ²`, not `(1,0)` | sound |
| §6.3 `multiplicative_residual_unramified_iff` | split: `q^{1/p}`; nonsplit: twist by `δ_W` | `K(q^{1/p})/K` unramified iff `p | v(q) = −v(j)` (`p ≠` residue char, `ζ_p` unramified); `δ_W` trivial on inertia; `p = 2` same | sound; Mathlib `HasMultiplicativeReduction` is on the given minimal model (Reduction.lean L345–347) |
| §6.3 node quadratic Check | `T² + T + 1` over `ℚ₂` | discriminant `−3`, unit; `ℚ₂(ζ₃)` unramified | sound |
| §6.4a Frattini | `P = ∏_ℓ ℤ/ℓ` | `Φ(P) = ∩ pP = 0`, not open; not a closed subgroup of any `GL_n(E)` (no open pro-`ℓ` subgroup) | sound |
| §6.4a `compact_matrix_frattini_isOpen` | `M` maximal open, `M ⊉ U` | `MΦ(U) = P ⇒ (M∩U)Φ(U) = U ⇒ M∩U = U`, contradiction; so `Φ(U) ≤ Φ(P)`, `Φ(U) = U^ℓ[U,U]` open (`U` finitely generated pro-`ℓ`); `P = 1`: no coatoms, infimum `⊤` | sound |
| §6.6 wild bound | `ℚ_p`, order-`p` character of conductor `p²`; `ℚ₂(√2)` | `Sw = 1 ≤ 1·(1 + 1/(p−1))`; `Sw = 2 ≤ 1·(1+1) = 2` | consistent |
| §7.1 Asai polynomial | `l = 2`, `B = diag(2,3)` | orbits `(1,1),(2,2),{(1,2),(2,1)}`: `(X−2)(X−3)(X²−6) = X⁴ − 5X³ + 30X − 36` | sound |
| §7.1 `Sym²⊕∧²` over `F₂` | `GL₂(F₂) = S₃` on `V` | `V⊗V = V ⊕ P(1)` projective; `Sym²V = V ⊕ 1`, `∧² = 1`: not projective | sound |
| §7.2 `ad/A·1 ≅ Sym²⊗D^∨` in rank 2 | `M^∨ ≅ M ⊗ D^∨` | `M⊗M⊗D^∨` has sub `∧²M ⊗ D^∨ = A·1`, quotient `Sym²M ⊗ D^∨` | sound |
| §7.3 `gsp₄` dimensions | `ℚ` | `sp₄` dim 10, scalars dim 1, `gsp₄` dim 11 in `M₄` dim 16 | sound |
| §7.4 CHT triples | `((a,μ₀)j)²` for `n = 1` | `(a,μ₀)(μ₀a⁻¹,μ₀) = (μ₀, μ₀²)`, so `μ₀ = 1`, `ν = −1`; CHT Lemma 2.1.1 (p. 7) states the same pairing laws | agree |
| §7.4 balance bound | trivial plane in char 3 | `tr = 2 = −1` but `a − b = 2`; `ℓ > n+1` sharp | sound |
| §7.4 `B_d` on `Sym^d` | `d = 2`, normalised `h` | `B₂(x², y²) = 1`, `B₂(xy,xy) = −1/2 = (−1)¹/binom(2,1)` | sound |
| §7.5 odd `GSp₄` element | `ν(c) = −1` | eigenspaces Lagrangian, `1,1,−1,−1`; on `sp₄ ≅ Sym²V ⊗ ν⁻¹`: `Sym²` gives `+1` six times, `−1` four times, twist flips: `H⁰ = 4` | sound |
| §7.5 `ad⁰(Ind ρ)|_{G_K}` | `Sym²(V⊕σV)⊗χ⁻¹` | `ad⁰ρ ⊕ ad⁰ρ^σ ⊕ (ρ⊗ρ^σ)χ⁻¹`, dims `3+3+4 = 10` | sound |
| §7.5 `GSp₄`-conjugacy (BCGP21 Lemma 2.1.3, p. 17) | `r = ρ⊕ρ`, two invariant alternating forms | invariant forms `↔` symmetric `2×2` matrices over `End_Γ(V⊕V) = M₂(L)`; all nondegenerate ones congruent over algebraically closed `L`, char `≠ 2` | sound |
| §7.6 `exists_linear_lift` | Patrikis Prop 2.1.4 (p. 17), kernel `G_m` central torus | gives a continuous lift to `GL_n(ℚ̄_ℓ)` after enlarging coefficients; the statement is over `PadicAlgCl` | agree |
| §7.6 Jordan blocks on `Sym^pV` | transvection, `p > 2` | `x·Sym^{p−1}V` is a block of size `p`, fixed space dim 2: type `(p,1)`; a complement would give `(2, p−1)` | sound |
| §7.7 resonances | `GL₂(F_p)`, `k = 2`, `j = −1` | `(a/d)^{1−i} = (a/d)` iff `i = 0`; `i = 2` needs `p − 1 | 2` | sound |
| §7.7 `H¹(GL₂(F_5), ad⁰) = 0`, `H¹(SL₂(F_5), ad⁰) ≠ 0` | `U = ⟨(1 1;0 1)⟩`, `M = ad⁰` | `H¹(U,M) = M/(u−1)M = ⟨E₂₁⟩`; `diag(a,d)` acts by `(d/a)·(d/a) = det²`; trivial on `SL₂`, `−1` on `diag(2,1)` | sound (basis of R07) |
| §7.9 `isAdequate_of_coprime_or_large` conclusion `p ∤ n` | `n = d·t·e` (Clifford) | `p ∤ t` (`G/G⁺` has no `p`-elements), `p ∤ e` (projective degree of a `p′`-group), `d ≤ (p−3)/2 < p` | consistent with `H⁰(ad⁰) = 0` |
| §7.9 `2(d+1) ≤ p` vs GHT `dim W ≤ (p−3)/2` | `p` odd prime | `p ≥ 2d+2 ⇔ p ≥ 2d+3` | agree (GHT17 Thm 1.1, p. 3; Thorne12 Lemma 2.4(ii), p. 7) |
| §7.9 `isAdequate_tensor` over any `k` | BLGG13 Lemma A.3.1 (p. 35) over `F̄_l` | `H¹(H, M⊗k̄) = H¹(H,M)⊗k̄`, spanning and absolute irreducibility invariant under `k ⊂ k̄` | sound |
| §7.9 Check: non-absolutely-irreducible `r₂` | `A = (0 4;1 4)` over `F₅` | `A³ = 1`; `A + 3I = (3 4;1 2)` traceless, commutes with `A` | sound |
| §7.10 `isEnormous_iff_isAdequate_rankTwo` | `W ⊂ sl₂` simple, `h` regular semisimple | diagonal projection is a polynomial in `ad(h)`, so `W^h ≠ 0 ⇔ tr(hW) ≠ 0`; scalars pair to `0` with `sl₂`; perfect trace form: spanning `⇔` enormous (3), over any `k`; GN Lemma 3.2.3 (p. 15) | sound |
| §7.10 `isEnormous_of_contains_SL`, `isEnormous_symPower` | GN Lemmas 3.2.4–3.2.5 (p. 15) | same hypotheses `n > 2, p > n` and `p > 2n+1`; `ad⁰` irreducible, `W^h ∋ h − tr(h)/n` for regular `h ∈ SL_n(k′)` | agree |
| §7.11 `Sp₄(F₃)` data | `|Sp₄(F₃)|`, `|Q₈ ≀ C₂|` | `51840 = 2⁷·3⁴·5`; `2⁷ = 128` is in the enormous order list of BCGP21 §7.5.20 (p. 203) | agree |
| §7.11 stabilisation | `F = ℚ(ζ_{p²})` | cyclotomic image `1 + p²ℤ_p`, `δ = 2`; `N ≥ 3` (`p ≥ 5`), `N ≥ 4` (`p = 3`) per BCGP21 Lemma 7.5.5 (p. 199) | agree |
| §7.11 big image Check `p = 3` | scalar `λ = ±1` | `ν = λ² = 1`, so `ε̄ = 1` on `ker ad⁰`: (H1) fails; `p ≥ 5`: `ν(2) = 4 ≠ 1` | sound |
| §7.12 `PSU₃(F₄)` | `|SU₃(F₄)| = 216` | centre order 3, projective quotient order 72, not simple | sound |

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `ContRepresentation`
(`RepresentationTheory/Continuous/Basic.lean` L54), `Representation.coindV`/`coind` (`Coinduced.lean`),
`Rep.indCoindIso` (`FiniteIndex.lean` L178), `Representation.IsSemisimpleRepresentation` (`Semisimple.lean` L34,
`ComplementedLattice (Subrepresentation ρ)`), `Representation.IsIrreducible` (`Irreducible.lean` L29),
`AlgHom.IsArithFrobAt` (`RingTheory/Frobenius.lean` L54), `absoluteGaloisGroup.mapOfAlgebra`
(`FieldTheory/AbsoluteGaloisGroup.lean` L59, direction `G_L → G_K`), `NumberField.Set.HasDirichletDensity`
(`NumberTheory/NumberField/DirichletDensity.lean` L82), `WeierstrassCurve.HasMultiplicativeReduction`
(`AlgebraicGeometry/EllipticCurve/Reduction.lean` L345), `PadicAlgCl.normedField` (`NumberTheory/Padics/Complex.lean`
L67), `distribHaarChar_mul` (`MeasureTheory/Measure/Haar/DistribChar.lean` L84), `ProfiniteCompletion.lift`
(`Topology/Algebra/Category/ProfiniteGrp/Completion.lean`), `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`
and `SL2.commutator_eq_top`, `Subgroup.goursat`, `jacobson_density`, `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`,
`WeierstrassCurve.LFunction`, `IsKrasner.krasner`, `Module.Invertible`, `complexConj`, `det_restrictScalars`,
`charpoly_fin_two`, `mem_range_scalar_of_commute_single`, `free_of_flat_of_isLocalRing`,
`le_of_le_smul_of_le_jacobson_bot`, `exists_algEquiv_pi_matrix_divisionRing`, `char_orthonormal`,
`mem_bot_iff_fixed` (all present). Tau Ceti: `inertiaPadicTameCharacter_conj` and
`IsArithFrobeniusLift.inertiaPadicTameCharacter_conj` (`NumberTheory/LocalField/Tame/PadicCharacter.lean` L152, L162),
`torsionGaloisAction` (`AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` L64), `PadicTateTwist`,
`teichmullerLift`, `absoluteGaloisGroupRestrictEquiv`, `symmetricPower`, `tensorInducedRepresentation`,
`IsMinuscule.exists_weylGroup_smul_eq`, `GroupExtension.continuous_sectionDiff`,
`Algebra.IsQuadraticExtension.quadraticCharacter`, `exists_quadraticTwist_hasSplitMultiplicativeReduction`,
`quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, `exteriorPower.equivBaseChange_symm_tmul_ιMulti`,
`multiplicity_differentIdeal_tower`, `weilPairing_torsionGaloisAction`, `nonempty_basis_torsionBy`,
`gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`, `det_eq_of_transpose_mul_J_mul_eq_smul`,
`IsArithFrobAt.restrictNormal`, `ContCohomology.cochainsCor1`, `GL2Borel`, `conjClassesGLFinTwoEquiv`,
`Chebotarev.frobeniusPrimeSet`, `isArithFrobAt_apply_sqrt`, `haarProb`, `det_tateModuleGaloisRepresentation`,
`complexConjugationAt` (all present). Absent at the pin: the four torsion-reduction names (R02),
`PadicAlgCl.valued` (R08), and the roadmap's own 67 proposed names (R06).

**Cross-roadmap citations resolved** (on main unless stated): EtaleCohomologyFoundations §F.4.0 (L850:
`ContinuousRep`, `Iso`, compact-closure criterion L874, `GaloisLattice.IntegralModel` L885), §F.3a (L776), §F.10.3
(L1295, `End(det P) ≅ R` L1328), §F.0.2 (L200), §F.0.A1 (L284); PadicMeasuresIwasawaAlgebras §5.1 (L3172,
`projectiveDeterminant` L3196); AdicSpacesPartIII §R3.8 (L11858, `LinearMap.projectiveTrace*` L11929); PivotalSpherical
Layer 2 (L318, `leftTrace`/`rightTrace` L329–330); SchemeAndStackFoundations §5.11 (L7273) and §0.14
`henselian_finiteEtale_equivalence` (L1068, L1080); ClassFieldTheory Layers 7, 9, 10, 13 (L1312, L1505, L1552, L1799;
`artinMap`, `normResidue`, `characterConductorExp`, `WeilGroup`, `weilDegree`, `localWeilArtinEquiv`,
`eq_zero_of_localInv_eq_zero`, `sumLocalInv_eq_zero`, `kroneckerWeber`); LocalFieldsRamification Layers 0–4 (L59–L1132,
`IsUnramified` L563, `Gal(K^ur/K) ≅ Ẑ` L649, Hasse–Arf L1001); NumberFieldArithmetic §§2.1–2.3, 2.6, 5.1, 5.2, 5.6,
5.9, 5.10, 6.3 (Completed); Chebotarev Layers 10, 14 and ArithmeticDirichletSeries Layer 7 (Completed);
RepresentationTheory/InductionRestriction Layers 0, 1, 5, 6, 7 and `cliffordObstruction`, SemisimpleAlgebras Layer 2,
CompactGroups; EllipticCurves Layers 0.5–5 (L398–L1154, Vélu L548, Tate curve L887); JacobianChallenge Layer E (L332);
ProfiniteCohomology Layers 2, 10, 13 (L725, L1549, L2163, wreath product L2345); ReductiveGroups Layers 0, 2, 3, 6, 7,
9; CFSGBasicProperties T1–T2 (L180) and CFSGStatement L1–L3 (L489–L626); AlgebraicCurves Layers 0, 2, 6, 8, 12;
ModularCurves 1C–1D (L486, L563); RestrictedPowerSeries §2.4 (L364, Strassmann L366); LieHighestWeight Layer 0 (L319,
`V(n)` L331, Clebsch–Gordan L348); Completed/ProfiniteProPGroups Layers 0, 3 (L131, L312, Frattini L477, Burnside
L497). At open heads: SmoothRepresentationsOfLocalGroups SR.5.2 `wd-linear-substrate`, `nilpotent-exp-log`,
`wd-parameter-operations`, `grothendieck-monodromy` (anchor only), `full-wd-construction`,
`wd-frobenius-semisimplification`, `classical-llc-normalization` (heading, no anchor), SR.4, SR.6, and the relation
`r(w)Nr(w)⁻¹ = q^{deg w}N` with arithmetic degree one; IntegralHeckeAndGaloisDeterminants Layer 0 (two-dimensional
determinants and `(T, D)`), §0.6 target *Determinant of a finite projective representation*, §§1.1, 1.2, 1.3 *Inner
conjugacy of local matrix algebras*, 1.4 *Classical Ribet lattice*, 1.7; ReductiveGroupsPartII RG2.2.1
(`Building.exists_fixedPoint_of_bounded`, `Building.gl1_translation`), RG2.2.2 `ReducedBuilding`, RG2.2.3
*building-field-extension-embedding*, RG2.2.4 *gl-building-lattice-chains*, RG2.3 (`reductive-model`, parahoric,
hyperspecial); AbelianSchemesAndArithmeticModuli A0.2, A1.6, A3.1–A3.5, A3.7, A3.9, A4.1 `AbelianTate`, A6.10–A6.12;
PadicLocalLanglandsForGL2Qp §0.3 `fundamentalCharacter` with the niveau-one comparison `ω₁^(e_K) = ω|_(I_K)` and
Frobenius conjugation by the `q`-power map; LocalFieldsRamification §§3a.1–3a.3, 4a.1–4a.3 and
`perfectResidueHerbrand`, `ψ_(L/K) = φ_(M/L)∘ψ_(M/K)`, `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))`, `G_(K′) ≅ I_K`;
ClassFieldTheory *Unit-filtration reciprocity* (`map_unitFiltration_normResidue`, every `n ≥ 0`, equal or mixed
characteristic, absolute form); LFunctions Layers 0, 5, 6 with the displayed functional equation
`Λ(χ,s) = W(χ)Λ(χ⁻¹,1−s)`; AdelicAlgebraicGroups 2.4 *convergence-factors*. Ownership against the open pull requests
whose files the brief lists was checked by object (continuous representations, conductors, Weil–Deligne data,
adequacy, Tate modules): no second owner found; open pull requests not listed in the brief were not searched.

**Sources read at their locators** (all fetched from arXiv, Numdam or author pages): DDT Thm 2.3 (p. 52), Prop 2.6
(pp. 53–54), Lemma 2.7 (pp. 54–55), Prop 2.8 (p. 56), Thm 2.9 (p. 56), Props 2.11–2.12 (pp. 57–58), Thm 2.47
(p. 81), Lemma 2.48 (p. 82); BHKT Thm 4.8 (p. 16), Def 4.9 (p. 17), Props 3.2, 3.6, 3.7, 3.10, Thm 3.4 (pp. 8–10);
Chenevier Lemmas 1.9, 1.12, Thm 2.12, Def.-Prop. 2.18, Thm 2.22, Examples 2.31, 2.34, Theorem B; DS74 Lemme 3.2
(p. 513), 6.12 and Lemme 6.13 (p. 523); CHT Lemmas 2.1.1, 2.1.2, 2.1.4, 2.1.8, 2.5.2, 2.5.6, Cor 2.5.4, Def 2.5.1,
§2.4.4 (p. 41); NT26 §1.2 (p. 7), (1.1) (p. 3), Lemmas 2.3 (p. 11), 4.7, 5.7, 5.8; GN22 Def 3.2.1, Rem 3.2.2, Lemmas
3.2.3–3.2.5 (pp. 14–15); BLGGT Lemmas A.1.5 (p. 85), 5.3.1 (p. 70); Thorne12 Def 2.3, Lemma 2.4 (p. 7); GHT17 Thm
1.1, 1.2 (p. 3), Rem 6.1 (p. 28), Cor 9.4 (p. 50), Cor 9.5 proof (p. 51); BLGG13 Def A.1.1, Rem A.1.2, Lemma A.1.3,
Prop A.2.1, Lemma A.3.1; Patrikis Thm 2.1.1 (p. 15), Prop 2.1.4, Rem 2.1.5 (p. 17), Lemma 2.7.4; Ulmer §§4–10 and
Prop 1 (p. 8); BCGP21 Lemma 2.1.3 (p. 17), §7.5 (Defs 7.5.6, Lemmas 7.5.3, 7.5.5, 7.5.9, 7.5.12–7.5.15, 7.5.21,
7.5.22, §§7.5.16, 7.5.20), Lemma 8.3.1 (p. 246); BCGP25 Props 4.11.1–4.11.2 (pp. 109–111), Lemma 10.2.3 (p. 212);
Serre 1961 Thm 2 and (31) (p. 138); Serre 1981 Thm 1 (p. 131), Prop 13 (p. 168), Thm 15 (p. 174); Brumer–Kramer
Lemma 2.4 (p. 229), Lemma 2.7 (p. 230); FSY (5.33) (p. 54), Lemma 5.40 (p. 58); Saha Def 2.1, Lemma 2.3; Dieulefait–
Pacetti Remarks 2, 4, Lemmas 1.13, 1.14; Gan–Takeda Lemma 6.1; Kisin–Zhou Prop 5.3.5; CGH Thm 1.1; Serre
*N_X(p)* Thm 4.6 (p. 42); Deligne Weil II Prop 1.6.1. Every statement sampled agrees with the roadmap's wording at
the generality the roadmap claims, except the three items recorded under *Source issues* and the locator slips of
R07–R08.

**Declared gaps.** None declared, none needed: the only candidates (LocalFieldsRamification §§3a/4a,
ClassFieldTheory unit-filtration reciprocity) are cited sections of open pull requests, which count as stated
contracts.

## Not verifiable

- Serre 1972 (Invent. Math. 15), Props 15–18 and §§1.3–1.8, 2.1–2.6, 5.2: Springer paywall; the DOI did not
  resolve to a legal copy. Cited by §§2.3, 4.2–4.6, 6.2.
- Serre 1987 (Duke Math. J. 54), §§1.2–1.3, 2.1–2.2, 3.3, 4.9: Duke paywall (DOI tried). Cited by §§3.2–3.3, 3.7,
  4.1, 6.6; the §4.1 and §6.6 sampled claims were checked mathematically instead (table).
- Ribet 1976 (Invent. Math. 34) §2 and Prop 2.1: Springer paywall. Cited by §§1.2, 1.6, 1.8–1.11.
- Deligne 1973 (LNM 349) §§2–5, 8: Springer paywall. Cited throughout Layers 2–3; the conventions it anchors were
  recomputed (table).
- Khare–Wintenberger 2009 (I) §1.5, §6, Lemma 6.1: Springer paywall; an author-page URL guess found nothing.
- Masser–Zannier 2020 (Ann. of Math. 191) §5.1, Lemma 5.1: Project Euclid landing page has no open PDF and the
  arXiv search was rate-limited; the arXiv number I tried was a different paper.
- Cline–Parshall–Scott 1975, Serre 1970 (Delange–Pisot–Poitou), Deligne Weil I, Liu 1994, Saito 1988, Noot 1995,
  Serre–Tate 1968, Nekovář 2018, ACC+ 2023, Caraiani–Newton, BCGNT, Qian, Khare–Thorne, NT23, Richard–Yafaev,
  Boxer–Calegari–Gee 2025, Bennett–Siksek: not fetched in this round (time); their citations are outside the sample.
- Books and proceedings: Silverman AEC and ATAEC, Serre *Local Fields*, Neukirch, Mumford, Milne *Elliptic Curves*
  2021, Tate Corvallis and Durham, Bushnell–Henniart, Isaacs, Jantzen, Borel, Steinberg, Dickson 1901, DDMS,
  Schneider, Kudla, Artin–Tate.
- Published paginations cited where I read the arXiv text: Calegari–Geraghty 2020 (Duke pp. 807, 812–813, 839,
  842–843, 890), Calegari–Geraghty 2018 (Invent. pp. 306; arXiv pp. 7–8, 80–81), Gan–Takeda (Ann. pp. 1859–1860),
  Milne *Abelian Varieties* v2.00 (2008) pages (the 2022 article was fetched instead).

## Source issues

- **Error** in BLGG13 (arXiv:1106.5586v1) at Proposition A.2.1, printed page 30: the source says that for `l = 5`
  a projective image conjugate to `PGL₂(F₅)` is a non-adequate case; it should list only `PSL₂(F₅)`, since
  `H¹(GL₂(F₅), ad⁰) = 0` (the torus acts on `H¹(U, ad⁰)` by `det²`); affects a stated result; corrected in print at
  GN22 Lemma 3.2.3 (and, as GN reads it, in the Math. Ann. version of Prop A.2.1).
- **Misprint** in CHT08 at Corollary 2.5.4, printed page 57: the source says `l > 2n − 1`; it should be
  `l > 2n + 1` (fails for `n = 2`, `l = 5`, where `H¹(SL₂(F₅), ad⁰) ≠ 0`); affects a stated result; corrected in
  print at BLGGT 2014 after Prop 2.1.2 and GN22 Lemma 3.2.5.
- **Misprint** in BCGP25 (arXiv:2502.20645v1) at the proof of Proposition 4.11.2, printed page 111: the source says
  the eigenvalues of `g ∉ G_E` on `As(ϱ) ⊗ η⁻¹` are `1, −1, λ, −λ`; it should be `1, −1, λ, λ⁻¹` (the product of
  the last two is `det ϱ(g²)/ν(g)² = 1`); affects the proof only (the needed fact, that `1` is an eigenvalue, stands).
