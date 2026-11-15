# GATE-CurvesOverFiniteFields~3: answers to human review

One comment, two points: the two AxiomMath/Weil folders named, at commit `27cdb20` (the commit the
README already cites), are taken one at a time.

## H01 (mycaule) — disputed

`Weil/AlgebraicGeometry/EtaleCohomology/Curves/` (18 files) is étale cohomology of curves, and
none of it is anything this roadmap states. Its results are the divisor sequence
`0 → 𝒪^* → 𝓡^* → 𝒟 → 0` of a smooth curve (`ClosedPointDivisorMiddleExactness.lean`), the
vanishing of `H^q(X, 𝔾_m)` for `q ≥ 2` (`SmoothCurveHIGmVanish.lean`), the Kummer computation
`H¹(C, μ_n) = Pic(C)[n]`, `H²(C, μ_n) = ℤ/n` (`RootsOfUnityAlgClosed.lean`), `H^q(X, μ_n) = 0` for
`q ≥ 2` on affine curves (`RootsOfUnityCurvesFinal.lean`), and the divisibility of `Pic⁰` and the
degree of a line bundle over an algebraically closed field (`RootsOfUnityAffineCurveRank.lean`,
`ClassGroupPicard.lean`); every one of these is over an algebraically or separably closed field
(29 `[IsAlgClosed k]`, 3 `[IsSepClosed k]`). The folder has no finite field, no Frobenius, no zeta
function, no point count and no Weil polynomial; its only genus is the rank `2g` in
`H¹(C, μ_n) ≅ (ℤ/n)^{2g}`. This roadmap works over a finite constant field, states nothing
cohomological, and takes the Riemann hypothesis from FunctionFieldArithmetic §5.4 (README
*Scope and ownership*, *Not owned here*).

While checking this point, the README's deferral turned out to be imprecise. It gave étale
cohomology itself to `WeilConjectures` and `DeligneWeightsAndPurity`. On main, that material
belongs to SchemeAndStackFoundations §2.16 (`curve_Gm_cohomology`, Tsen's theorem) with §2.11
(Kummer sequence), and to EtaleCohomologyFoundations §§F.3.0, F.3. WeilConjectures itself says
EtaleCohomologyFoundations supplies its étale inputs. README line 90 old → new: "Étale cohomology
and the cohomological route…: `WeilConjectures` and `DeligneWeightsAndPurity`" → étale cohomology,
including that of curves over an algebraically closed field, is SchemeAndStackFoundations Layer 2
(§§2.11 and 2.16) and EtaleCohomologyFoundations (§§F.3.0 and F.3). The route from it to zeta
functions and weights stays `WeilConjectures` and `DeligneWeightsAndPurity`. The References entry
for AxiomMath/Weil (line 1450) now also says that this folder and the one in H02 are étale
cohomology of curves, which this roadmap neither owns nor states.

## H02 (mycaule) — disputed

`Weil/AlgebraicGeometry/EtaleCohomology/TorsionSheavesCurves/` (10 files) proves vanishing
theorems for torsion sheaves on curves over an algebraically closed field. These are
`H^q(X, F) = 0` for `q ≥ 3` (`ReduceVanishingToGenericDirectImage.lean`, Stacks 03RT) and for
`q ≥ 2` on affine curves (`AffineVanishingAboveDegreeOne.lean`, `CurveCohomologyTheorem.lean`,
Stacks 0A54). The folder also covers constructible sheaves (`ConstructibleBoundedTorsion.lean`,
`ClosedPartFiniteness.lean`), finite pushforward (`DirectImageCohomology.lean`) and the reduction
to smooth curves (`SmoothReduction.lean`); it has no finite field, zeta function or point count.
This is the material of EtaleCohomologyFoundations §F.3.0 (`etaleCohomologicalDimension`:
`H^q = 0` for `q > 2 dim X`, torsion invertible in `k`) and §F.3 (`affineArtinVanishing`:
`q > dim X` on affine `X`, any torsion), both on main. The README now names them as owners in the
same Scope repair as H01, line 90.

## Build

`lake build TauCetiRoadmap.CurvesOverFiniteFields.Suggested`: `Build completed successfully (9076 jobs).`
The only warnings are the expected `declaration uses 'sorry'` lines. `Suggested.lean` is unchanged
this round. The elaborated types in `signatures.md` therefore still describe the file (0
declarations had lost a section binder there), and no `#check` pass was rerun.

## Gate

    gate CurvesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck … --pr 1729`):

    depcheck: 239 roadmaps, 2255 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The two newly named roadmaps, SchemeAndStackFoundations and
EtaleCohomologyFoundations, are both on main.

Commit: `408a5d80 CurvesOverFiniteFields: review repairs (étale cohomology owners named;
AxiomMath/Weil curve-cohomology folders placed)`. Not pushed.

## Adversarial pass on the changed statements

The two edits make ownership and description claims, not mathematical identities. Each row below
records what was opened and what it says.

| Statement | Checked against | Values found | Result | Change |
| --- | --- | --- | --- | --- |
| SchemeAndStackFoundations §2.11 contains the Kummer sequence | main `19ff3de`, SchemeAndStackFoundations README line 4707 | heading "2.11 Hilbert 90, the Kummer and Artin–Schreier sequences, finite pushforward"; `hilbert90`, `fppf_kummer_sequence` | holds | none |
| SchemeAndStackFoundations §2.16 contains Tsen's theorem and `𝔾_m`, `μ_n` on curves over an algebraically closed field | same, lines 4941–4955 | `tsen_theorem`; `curve_Gm_cohomology`: `H^q(X_ét, 𝔾_m) = 0` for `q ≥ 2`, `H¹ = Pic(X)`, `H⁰ = Γ(X, O)^×` for a smooth curve over an algebraically closed field; "the cohomology of `μ_n` … follows from this theorem and the Kummer sequence (§2.11)" | holds; `μ_n` is a consequence it records, not a separately named target, so the README says "through the Kummer sequence" | wording fixed to "through the Kummer sequence" |
| "Étale cohomology … is SchemeAndStackFoundations Layer 2" | same, line 4056 | heading "Layer 2: sites and scheme cohomology" | holds | none |
| EtaleCohomologyFoundations §§F.3.0, F.3 are vanishing theorems for torsion sheaves | main, EtaleCohomologyFoundations README lines 1038–1050, 1097–1107 | F.3.0: `H^q(X, F) = 0` for `q > 2 dim X`, `X` of finite type over separably closed `k`, torsion invertible in `k`. F.3: `q > dim X` for affine `X`, any torsion | holds. A first draft said "above twice the dimension in general", which F.3.0 does not state without the invertibility hypothesis; the final text says only "the vanishing theorems for torsion sheaves" | draft corrected before commit |
| WeilConjectures and DeligneWeightsAndPurity are the cohomological route, not étale cohomology itself | WeilConjectures at its open head (`roadmaps show WeilConjectures`), Scope and ownership | "Rational adic carriers, Frobenius and base change are supplied by EtaleCohomologyFoundations §§F.0–F.4" | the old README text gave them étale cohomology itself; the new text gives them only the route | repaired (H01) |
| FunctionFieldArithmetic §5.4 is the comparison with those two | README supplier contract, §5.4 `zeta_eq_schemeZeta` (WeilConjectures WC.1, DeligneWeightsAndPurity §1.6) | unchanged citation | holds | none |
| The AxiomMath/Weil folders: divisor sequence of a smooth curve | `Curves/ClosedPointDivisorMiddleExactness.lean` docstring | "smooth curve over a field `k`", `shortExact_curveDivisorSequence` | over any field, so the README lists it outside "over an algebraically or separably closed field" | worded accordingly |
| The AxiomMath/Weil folders: Kummer sequence and `𝔾_m`, `μ_n` over an algebraically closed field | `Curves/RootsOfUnityAlgClosed.lean`, `SmoothCurveHIGmVanish.lean`, `SmoothCurveHqMuNVanishQGt2.lean` | `H¹(C, μ_n) = Pic(C)[n]`, `H²(C, μ_n) = ℤ/n`, `H^q = 0` for `q ≥ 3`; `H^q(X, 𝔾_m) = 0` for `q ≥ 2`; all `[IsAlgClosed k]`, `n` invertible | holds | none |
| The AxiomMath/Weil folders: vanishing above degree two, and above one on affine curves | `TorsionSheavesCurves/ReduceVanishingToGenericDirectImage.lean` (`q ≥ 3`, torsion `F`); `AffineVanishingAboveDegreeOne.lean` (`q ≥ 2`, `n • 𝟙 F = 0`) | as stated | holds | none |
| The AxiomMath/Weil folders: constructible and torsion sheaves | `ConstructibleBoundedTorsion.lean` (qcqs `X`), `ClosedPartFiniteness.lean` (any scheme) | not restricted to closed fields | listed outside the closed-field clause | worded accordingly |
| The folders contain no finite-field material | grep of all 28 files for `[Finite k]`, `Fintype k`, `FiniteField`, `frobenius`, `zeta`, `pointCount`, `genus` | one hit family only: `genus` in `RootsOfUnityAlgClosed.lean` lines 332–387, `H¹(C, μ_n) ≅ (ℤ/n)^{2g}` over an algebraically closed field | holds | none |
| The README does not claim the folders feed the cited Weil estimate | imports of the two folders outside themselves: `Picard/DegreeExactSequence.lean`, `ComplexPoints/ComparisonCurve.lean`, `EtaleCohomology/Picard/RootsOfUnitySecondCohomology.lean` | the transitive chain to `Trace/DeligneWeilConjecture.lean` was not traced | no claim made | "an input of that proof" left out of the text |

## Ownership and citations

- Ownership against open work for the material the two folders cover:
  - SchemeAndStackFoundations and EtaleCohomologyFoundations are on main, so they come before
    every open roadmap.
  - Among the open roadmaps, AnabelianGeometryAndNonabelianChabauty has a section on étale
    cohomology of curves with `μ_n` coefficients.
  - EtaleDualityAndPerverseSheaves imports the same material from SchemeAndStackFoundations
    §§2.11, 2.16 and EtaleCohomologyFoundations §§F.0–F.6, which agrees with the owners named here.
  - This roadmap names only the owners on main and states none of it.
- Every cross-roadmap citation the edit adds was resolved on main `19ff3de`: SchemeAndStackFoundations
  Layer 2, §2.11, §2.16; EtaleCohomologyFoundations §F.3.0, §F.3. `citations.md` lists no
  cross-roadmap citation found nowhere. Its Lean-name leads are of three kinds, and the edit adds
  none:
  - names in external formalisations;
  - LMFDB knowl identifiers;
  - `IsWeilSymmetric.aroots_map_div`, a README name the gate's `readme-ids-missing=0` accepts.
- AxiomMath/Weil was read at the cited commit `27cdb2049be62ee2911429b47f54774078450e32`
  (Apache-2.0), from a local checkout at that commit.
- Sources: no new source is cited, and nothing is added to `needs-references.toml`.
- No reviewed text contained instructions.
