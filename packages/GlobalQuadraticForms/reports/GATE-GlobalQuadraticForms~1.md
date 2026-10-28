# GATE-GlobalQuadraticForms~1: answers to human review

One review is answered here: roed-math, on commit `3b9021e`. The PR head was `afad811`. This round
commits `ae9b7a3`, "GlobalQuadraticForms: review repairs (state headlines on Tau Ceti carriers;
drop roadmap imports, sorry'd data)". It changes only `TauCetiRoadmap/GlobalQuadraticForms/README.md`
and `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`.

The commit fixes the five gate failures the earlier draft of this report had left in place
(`tex`, `sorry-data`, `residue`, `imports`, and the `build` warnings that came in through the
imported roadmap modules). It also completes H04.

## H01 (roed-math) — applied differently

At `afad811`, `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` lines 380–381 already had the
wording the reviewer proposed: "`d` represents the **plain** discriminant … the sign factor is
`(-1)^6 = 1`". It matched README lines 603–605. This commit then deletes the whole restated
quaternary-descent theorem, and the bullet goes with it. The theorem is proved at the pinned
Tau Ceti as `QuadraticForm.not_anisotropic_of_not_anisotropic_baseChange_quaternary`
(`TauCeti/LinearAlgebra/QuadraticForm/QuaternaryDescent.lean` line 119), so the reviewer's point
now has no counterpart in this roadmap's Lean file.

The README's corrected sentence ("since `(-1)^{n(n-1)/2} = (-1)^6 = 1`", now line 629) is
unchanged. A search of both files for `signed`, `(-1)^` and `sign factor` finds no claim of a sign
change in dimension four.

## H02 (roed-math) — answered

The verification is correct. In rank `n` the signed discriminant is `(-1)^(n(n-1)/2)·d`.
- For `n = 4` the exponent is 6, so the factor is `+1`.
- For `n = 2` the factor is `-1`. So the residual plane `P` has plain discriminant `[-1]` and signed discriminant `[1]`.

From `V ≅ ⟨ε⟩ ⊥ ⟨-dε⟩ ⊥ P` we get `[d] = [-dε²]·d(P) = [-d]·d(P)`, so `d(P) = [-1]`. A regular plane
of discriminant `[-1]` is hyperbolic.

The binary witness in the README's 5.1 rank-four discussion also holds:
- `-2` is not a square in `ℚ(i)`: `(a+bi)² = -2` forces `ab = 0` and then `b² = 2`.
- `⟨1,2⟩` is isotropic over `ℚ(i)(√2)` at `(i√2, 1)`.

## H03 (roed-math) — answered

The pinned Tau Ceti (`a91d3aa`) repeats the false sentence in the module docstring of
`TauCeti/LinearAlgebra/QuadraticForm/QuaternaryDescent.lean`, lines 28–29. The proof there uses
only the plain `RegularFormClass.discr` (hypothesis `hd`, line 123), so it is unaffected. That file
belongs to the library repository and cannot be corrected from this roadmap. A separate Tau Ceti
documentation fix is the right place.

## H04 (roed-math) — applied

The pinned Tau Ceti has more than the two results the reviewer names. It proves:
- quaternary descent (`QuadraticForm.not_anisotropic_of_not_anisotropic_baseChange_quaternary`, and its `iff` form at line 167);
- the binary hyperbolicity criterion (`RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`);
- every carrier of Layers 0–3, under `TauCeti/NumberTheory/QuadraticForm/Global/`.

`Suggested.lean` no longer restates any of these. It now imports the Tau Ceti modules and states
only the headline theorems that are not at the pin, on the Tau Ceti carriers. The old → new changes:

- **Imports.** The four roadmap modules `TauCetiRoadmap.GlobalNumberFields.Suggested`, `Completed.NumberFieldArithmetic.Suggested`, `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.QuadraticFormInvariants.Suggested` are replaced by six `TauCeti.*` modules: `NumberTheory.HilbertSymbol.Basic`, `NumberTheory.QuadraticForm.Global.{Localization, Predicates, Invariants, FormInvariants}` and `LinearAlgebra.QuadraticForm.Witt.BaseChange`.
- **Local definitions replaced by Tau Ceti's, with the same meaning:**
  - `atFinitePlace`, `atRealPlace`, `unitAtFinitePlace`, `unitAtRealPlace`, `IsLocallyIsotropic`, `LocallyEquivalent`, `LocallyRepresentsScalar`;
  - `SquareClass` → `SquareClassGroup`;
  - `realHasseSign`, `GlobalFormInvariants`, `HasseProductCompatible`, `IsAdmissible`.
- **Sorry'd data removed.**
  - `localizeSquareClass` → `GlobalFormInvariants.discrAtFinitePlace`, which is `squareClassMap`.
  - `realSquareClassSign` → the `IsAdmissible.discrAtRealPlace_eq` field, `discrAtRealPlace w = (n - p_w) • squareClass (-1)`.
  - `globalInvariants` → `QuadraticForm.globalInvariants`. Its real body is rank, `RegularFormClass.discr (formClass Q hQ)`, `finiteHasse` and `realPositiveIndex`.
- **Restated pinned results removed:**
  - `not_anisotropic_complex` → `QuadraticForm.not_anisotropic_of_isAlgClosed`;
  - `equivalent_of_finrank_eq_complex` → `QuadraticForm.equivalent_weightedSumSquares_one_iff_finrank_eq`;
  - `hilbertSymbol_real` → `TauCeti.hilbertSymbol_real`;
  - `hilbertSymbol_complex` → `TauCeti.hilbertSymbol_eq_one_of_isAlgClosed`;
  - `finite_hilbertSymbol_ne_one` → `TauCeti.hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`;
  - the quaternary descent.
- **One-tactic lemmas removed.** These are padding, and the pinned `NumberTheory/QuadraticForm/Global/CorrectionPlanes.lean` covers the correction-plane calculation:
  - the correction-plane lemmas `localHasse_pair`, `discr_correctionPlanes`, `hilbertSymbol_one`, `hilbertSymbol_neg_mul`, `hilbertSymbol_neg_mul_real`;
  - the corollary `isSquare_of_isSquare_unitAtFinitePlace`;
  - `globalInvariants_isAdmissible`, which is the forward half of the pinned `QuadraticForm.isAdmissible_globalInvariants_iff`;
  - the supplier `#check` block, the two Class Field Theory `example`s and the `ℚ` consumer `example`.
- **Headlines kept, restated on Tau Ceti carriers:** 4.2 global square theorem; 4.4 localized product formula and both sign prescriptions; 5.5 Hasse–Minkowski isotropy; 6.1; 6.2 (now `Q.IsRepresentedBy R ↔ Q.LocallyRepresents R`); 6.3; 7.3; 7.4; 8.1; 8.4.
- **Headline added:** `injective_wittRing_baseChange_places` (8.3). It was statable at the pin, on `TauCeti.WittRing` and `TauCeti.WittRing.baseChange`, but absent.

README changes:
- A new section, "What Tau Ceti supplies", lists the carriers above with their files.
- "What is missing" now names exactly the headline theorems stated in `Suggested.lean`. The old text claimed that the pin has no localization API and no invariant carrier, which is false.
- 8.3 now names `TauCeti.WittRing`, `TauCeti.WittRing.baseChange` and the new theorem. Its old Quadratic Form Invariants `wittRing` row is removed from the contract table.
- The fenced display `ker φ = Kˣ · N_{E/K}(I_E).` in the 4.4 proof is now an inline code span (gate `tex`).
- The 8.3 sentence "Do not define a `Prop`-valued stand-in for the Witt ring, and do not claim a …" is rewritten as a statement of what the milestone proves (gate `residue`).

## H05 (roed-math) — answered

The reviewer's scope and validation statements match what I found:
- The pins match: Tau Ceti `a91d3aa`, Mathlib `6b7abb3`.
- The build succeeds locally (below).
- The dependency check reports no problem.
- No other PR has to merge first.

The commit removes the roadmap-module imports, so this PR no longer pulls the four supplier
roadmaps' `Suggested` files into its build.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.2 global square | `K=ℚ`, `a=-1`: nonsquare in `ℚ_p` for every `p ≡ 3 (4)`. `a=2`: nonsquare for `p ≡ ±3 (8)`. `a=4`. `K=ℚ(i)`, `a=-1`, `S=∅` | `-1`, `2`: no finite `S` meets the hypothesis. `4 = 2²`. `-1 = i²` | true | none |
| 4.4 product formula | `ℚ`, `a=b=-1`, `S={2}` and `S=∅` | `(−1,−1)_2 = −1`, `(−1,−1)_∞ = −1`, odd `p`: `1`. Product `1`. With `S=∅`, `hS` fails at 2 | true | none |
| 4.4 prescription with `b` | `ℚ`, `b=-1`, `Tf={2}`, `Tr={∞}` | `a=-1` gives `-1` exactly at `2, ∞`. Negative controls: `Tf={3}, Tr=∅` (odd) is excluded by `hpar`. `Tf={5}, Tr={∞}` is excluded by `hbf`, since `-1 = 2²` in `ℚ_5`, so `(a,−1)_5 = 1` for every `a` | true | none |
| 4.4 prescription, pair | `T=∅` | `a=b=1`: all symbols `1` | true | none |
| 5.5 isotropy | `⟨1,1⟩/ℚ`. `x²+y²−3z²/ℚ`. Rank 0 | `⟨1,1⟩` is anisotropic at `∞`: both sides false. `x²+y²−3z²` is anisotropic over `ℚ` and over `ℚ_3` (Tau Ceti `anisotropic_sumTwoSquaresSubThreeSq_atFinitePlace`): both sides false. Rank 0: the zero space is anisotropic, so both sides false | true | none |
| 6.1 scalar | `⟨1,1⟩/ℚ`, `a=3` | `3` is not a sum of two rational squares. At `3`, norms from unramified `ℚ_3(i)` have even valuation and `v_3(3)=1`: both sides false | true | none |
| 6.2 forms | `⟨1⟩ ⊂ ⟨1,1⟩`. `⟨1,1⟩` into `⟨1⟩` | First: true on both sides. Second: no injective map at any place (dim 2 > 1): both false | true | carrier → `IsRepresentedBy` |
| 6.3, 7.4, 8.1 | `⟨1,1⟩` vs `⟨2,2⟩`, and `⟨1,1⟩` vs `⟨3,3⟩`, over `ℚ` | `d = [1] = [4]`. `(2,2)_p = (2,−1)_p = 1`, since `−1 = 1−2` is a norm from `ℚ(√2)`. Positive index `2 = 2`. So equal invariants, and indeed `2x²+2y² = (x+y)²+(x−y)²`. `(3,3)_3 = (3,−1)_3 = −1`: invariants differ, not isometric | true | carriers → Tau Ceti |
| 7.3 existence | `ℚ`, `(n,d,s,p) = (1,[2],1,1)`, and `(1,[2],1,0)` | First: real condition `[2]=0=(1−1)•[−1]`, real Hasse `(−1)^C(0,2)=1`; realized by `⟨2⟩`. Second: `0 ≠ 1•[−1]`, so not admissible, matching the fact that `⟨2⟩` is positive | true | carriers → Tau Ceti |
| 8.3 Witt injectivity (new) | `ℚ`, `⟨1,1⟩`. `ℚ(i)`, `⟨1,1⟩` and `⟨1⟩` | `⟨1,1⟩/ℚ` has signature 2 at `∞`, nonzero there. Over `ℚ(i)`, `⟨1,1⟩ = ⟨1,−1⟩ = 0` since `−1 = i²`. `⟨1⟩` has odd rank, nonzero in every `W(K_v)`. Omitting complex places: vanishing at one finite place forces even rank, which is `0` in `W(ℂ) = ℤ/2` | true | added |
| README `IsAdmissible` description vs Tau Ceti | real sign `(-1)^(n-p_w)`. Real Hasse `(-1)^((n-p)(n-p-1)/2)` | `(n−p)•[−1]` is the same condition. `C(q,2) = q(q−1)/2` | agree | none |

Signature check: `Suggested.lean` now declares no `def`, `abbrev`, `instance` or structure. The only
section variables are `K` and, in the Hasse–Minkowski section, `V` with `[AddCommGroup V] [Module K V]`;
every statement mentions them. `[FiniteDimensional K V]` and every other hypothesis are written in
each theorem's own signature. The module elaborates (below). This brief allows no separate
`#check @name` scratch elaboration, so that comparison was done by reading the signatures against
README §§4–8.

## Build

`lake build TauCetiRoadmap.GlobalQuadraticForms.Suggested`: "Build completed successfully
(9124 jobs)". The only warnings are 12 "declaration uses `sorry`" warnings, one per headline theorem.

## Gate

    gate GlobalQuadraticForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

## Depcheck

    depcheck: 148 roadmaps, 996 edges, 0 problem(s)

There is no UPWARD or CYCLE line for GlobalQuadraticForms.

## Other notes

- Ownership: the commit adds no construction. It deletes this roadmap's copies of the Layer 0–3 carriers in favour of the pinned Tau Ceti ones. No declaration of `Suggested.lean` shares a fully qualified name with a pinned or roadmap declaration.
- Every new README citation of a Tau Ceti name was checked at the pin `a91d3aa` against the file named beside it.
- The citation lead at the README's 6.3, `TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent`, is a suggested implementation name for an unproved target. It does not exist at the pin, as expected.
- The README layers 0–3 still describe the carriers as constructions to build, although they are now pinned Tau Ceti code. Rewriting those layers as supplier citations is a wider revision than this repair round and was not done.
- The review text contained no suspicious instructions. No sources were fetched and no `needs-references.toml` was written.
