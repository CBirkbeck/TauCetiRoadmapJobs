# Review of ComplexKahlerGeometry (pull request #1234 at 6456ba7)

**Verdict:** needs changes

This pull request revises the roadmap that is on main (nine commits over the merge base; no file outside `TauCetiRoadmap/ComplexKahlerGeometry/` changes). Its own content is the new K4.P (Picard groups), the K6.0 normal-coordinate paragraphs, the K7.2 Fubini–Study/projective-unitary block, K7.2.TautologicalIncidence, K7.2.RationalQuartic, K7.FlatDegreeZero, the rewritten `Suggested.lean` (14 declarations) and four companion Lean files. The previous AI review supplied to this job is the r2 review of pull request #1398 (another revision of the same roadmap, head b8db421); its findings are checked against this head below before the full review.

## Previous findings (r2 of #1398) at this head

| Finding | Status at 6456ba7 |
| --- | --- |
| R01 PDO two-way supply (K5a ↔ P1.0) | Not repaired; unchanged on-main text (`README.md:51–58, 1977–1981`). Depcheck reports no cycle because both roadmaps leave the item-level order explicit; left as the pre-existing design question for humans, not re-raised here. |
| R02 RealAnalyticGeometry two-way supply (K3/K6 ↔ R1/R5) | Not repaired; unchanged on-main text (`README.md:1446–1455, 2033–2038`). Same disposition as R01. |
| R03 DG8.4/DG9.3 relative integration contract | Not repaired; `README.md:1497, 1511` still attribute the open-pair cone and relative integration formula to DifferentialGeometry. Pre-existing on main; not re-raised as blocking here (see R09). |
| R04 VariationalMethods names | Not repaired: `CompactFormPair.operator` (`README.md:1138`) and `toRealBilin` (`README.md:1148`) still do not exist at the #1028 head (`VariationalMethods/README.md:1063` says there is no separate operator declaration). See R09. |
| R05 sorry'd data in Suggested | Repaired: `Suggested.lean` has no `def`/`instance` with a `sorry` body (gate `sorry-data=0`). |
| R06 localization tuple as Sobolev space | Repaired: the surrogate is gone; the docstring (`Suggested.lean:16–19`) names the localized scale as not statable. |
| R07 planar finite-regularity stand-ins | Repaired: `PlanarHodgeTargets.lean` is not in this pull request. Four other companion files appear instead (R04 below). |
| R08 full mixed parameter solver absent | Not repaired: still absent from `Suggested.lean` and not named in its docstring (R02 below). |
| R09 imports | Repaired in `Suggested.lean` (`import Mathlib` plus two `TauCeti.*` modules); not in the companions, which use `Mathlib.<submodule>` imports (R04 below). |
| R10 padding | Partly repaired: the evaluation wrappers are gone; `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff` and `memSobolev_iff_bundled` remain (R08 below). |
| R11 README shape | Not repaired: no `## Scope and ownership`, `## Exact supplier contracts`, `*Needs:*` lines or `**Checks.**` lists; the new blocks add one `**Needs:**` line (`README.md:1623`) and no Checks list. See R09. |
| R12 locators | Partly: Ballmann and Berwick-Evans–Tripathy are linked at the claim; "Demazure9 p1", "Knutson's BorelWeil p1" and "source page 21" are unidentified (R05 below). |
| R13 commit-pinned links and PR numbers | Partly: the commit-pinned links are now relative (gate `blob=0`); `#279`/`#280` citations remain throughout (R09 below). |
| R14 anchor residue | Not repaired: three new `<a id=` anchors (R03 below). |
| R15 docstrings and README names | Partly: `Suggested.lean` has the required module docstring and per-declaration docstrings except `dbarFunction_apply_J`, `complexBesselMultiplier`, `complexBesselDistributionMultiplier`, `complexBesselDistributionMultiplier_real`; the companion names (`period`, `normalizedGram`, `correction`, `parametrization`, …) are not in the README. |

## R01 (P1) — K7.2 now consumes ComplexComparisonPartII, which consumes this roadmap

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1664–1670` ("Use ComplexComparisonPartII C−1/C0's analytification and local coherent comparisons to identify its analytification with E over V"), `README.md:1737–1744` ("consume ComplexComparisonPartII C0 and C1.7–C1.8's analytic twists, coherent closed-embedding pushforward and analytic Serre vanishing"), and `README.md:2007–2010`.

Claim: these two new paragraphs make this roadmap, which is on main, a consumer of ComplexComparisonPartII (open pull request #848, position 39 in the merge order). ComplexComparisonPartII is itself a consumer of this roadmap: its supplier table reads "ComplexKahlerGeometry K2/K3/K4 → RealAnalyticGeometry R3.2 item 0 → C-1/C0" (ComplexComparisonPartII `README.md:160`), and C5.4's `*Needs:*` line names "ComplexKahlerGeometry K4's Chern connection" (`README.md:3330`). The pre-existing K4 paragraph (`README.md:477–483`) records the same direction: K4 supplies C−1.1, C0.4 and C5.1–C5.2. The new edges reverse it and close a roadmap-level cycle. The dependency check does not see it because neither new paragraph puts the citation on a `*Needs:*` line; an on-main roadmap citing an open pull request on a `*Needs:*` line is reported as UPWARD by the same check.

Witness: ComplexComparisonPartII C1.8 (`README.md:1618`, "Serre's analytic theorems on projective space") and C1.7 (`README.md:1574`) exist at the #848 head and are the objects cited; C-1.1 (`README.md:724`) owns scheme analytification. None of them is on main or earlier than this roadmap.

Repair: delete the two consuming passages and the "Order and references" sentence about C1.8. K7.2.TautologicalIncidence keeps the holomorphic incidence space E, its charts and transitions, b, the Hartogs descent `b*:O_hol(V)≃O_hol(E)`, the homogeneity/`H⁰(O(k))` identification and the d=1 case; the identification of StableReduction Layer 4's Rees blowup (on main; its general Rees/relative-Proj construction with affine charts is at StableReduction `README.md:531–534`) with E needs analytification and is left to ComplexComparisonPartII, recorded in a Scope sentence ("the comparison of the analytified Rees blowup of the origin with E is ComplexComparisonPartII's"). K7.2.RationalQuartic keeps the explicit embedding, `q*O(1)≃O(4)`, the restriction map `(a,b,c,d)↦(a,b,0,c,d)` and the monomial surjectivity for n≥2; the general eventual-surjectivity paragraph via the ideal sequence and analytic Serre vanishing is deleted and left to ComplexComparisonPartII C1.8 in the same Scope sentence. Test after the edit: the dependency check must still print 0 problems, and the rational quartic still refutes surjectivity at n=1 (image dimension 4 in a 5-dimensional target) and gives `h⁰(M,O(2)|_M)=9` from the nine exponent pairs listed.

## R02 (P2) — Statable headlines are absent from `Suggested.lean` and unnamed in its docstring

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean:5–27`; `README.md:211–218` (the joint parameter-dependent solver), `README.md:443–446` (Hartogs extension), used at `README.md:1676–1677`.

Claim: the module docstring lists as not statable only the K5a carriers, the density line, the imaginary-order comparison and the Dolbeault/Hodge/Frölicher objects. It says nothing about Newlander–Nirenberg (K1), the mixed smooth/holomorphic parameter solver (K2), Weierstrass preparation, Rückert, coherence and Hartogs (K3), Chern uniqueness, Koszul–Malgrange and the flat equivalences (K4), the Picard isomorphisms (K4.P) or the K7 computations. Two of these are statable at the pins with `import Mathlib` alone and are absent: the K2 solver (the r2 review of #1398 elaborated it; its statement needs only `ContMDiffOn`, `DifferentiableOn` and `fderiv ℝ`) and Hartogs extension across a point in complex dimension at least two, which the new K7.2.TautologicalIncidence uses as its main analytic input.

Witness: this scratch declaration elaborated with the pinned Mathlib and one `sorry`:

```lean
theorem hartogs_point_extension
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (hE : 2 ≤ Module.finrank ℂ E) (f : E → ℂ) (hf : DifferentiableOn ℂ f {0}ᶜ) :
    ∃ g : E → ℂ, Differentiable ℂ g ∧ Set.EqOn g f {0}ᶜ := by
  sorry
```

Repair: state the K2 solver (the r2 signature) and the point-Hartogs extension in `Suggested.lean` under `/-! ## Layer K2 -/` and `/-! ## Layer K3 -/` comments, and extend the docstring to name each remaining headline with the carrier it lacks (`(p,q)`-forms for K2/K5/K6, holomorphic bundle mixin for K4, holomorphic structure sheaf and `H¹(M,𝒪×)` for K4.P, the projective and torus carriers for K7). Test: `f(p,q,z)=pq` with real p has `u=pq z̄`, `∂̄_z u=pq`, `∂̄_q u=0`; for Hartogs, `f=1/z₁` on `ℂ²∖{0}` is excluded because it is not holomorphic off the origin, while `f(z)=z₁z₂` restricted to `ℂ²∖{0}` extends by itself, and in dimension one `1/z` has no extension, which the hypothesis `2 ≤ finrank` excludes.

## R03 (P3) — Three HTML anchors fail the residue rule

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1573, 1651, 1787` (`<a id="fubini-study-projective-unitary"></a>` and two more).

Claim: the gate reports `residue=3` and FAILs on these lines; no acceptance while it fails.

Witness: gate output at 6456ba7: `residue=3 … FAIL`, the three lines listed.

Repair: delete the three anchor lines; the bold run-in titles that follow them are the headings (or make them `###` subsections, which get generated anchors). Re-run the gate: every counter must be 0.

## R04 (P3) — The four companion Lean files break the Lean form rules; delete them

Location: `TauCetiRoadmap/ComplexKahlerGeometry/EllipticFlatLineTargets.lean:1–2`, `FubiniStudyTargets.lean:1–3`, `NormalCoordinateTargets.lean:1–4`, `RationalQuarticCoordinates.lean:1–4` (imports); `README.md:1354, 1620–1621, 1812–1813, 1846–1847` (the README links to them).

Claim: each file imports `Mathlib.<submodule>` lines and no `import Mathlib`, uses a non-standard module docstring, and is not built by the gate (only `Suggested.lean`'s module is). Their content is what the README rules keep in prose: `FubiniStudyTargets.lean` proves the Gram kernel, unitary invariance and the two values `1/π` and `4/π` (Checks and small values), `RationalQuarticCoordinates.lean` is the coefficient Check `(a,b,c,d)↦(a,b,0,c,d)` with its left inverse, `NormalCoordinateTargets.lean` pins the two-jet of a polynomial, and `EllipticFlatLineTargets.lean` states two Liouville corollaries. The README's prose then names Lean files as its witnesses, which the house style forbids for Checks. All four elaborate at the pin (`lake env lean`: exit 0; two and one `sorry` warnings in the elliptic and normal-coordinate files, none in the other two).

Witness: `FubiniStudyTargets.lean:63–73` proves `normalizedGram cp1Origin cp1Velocity cp1Velocity = 1/π` and the dilation value `4/π` by `norm_num`; `RationalQuarticCoordinates.lean:56–72` proves the range is `{b : b 2 = 0}`.

Repair: delete the four files and the four README sentences that point to them; the README keeps every statement as a target or Check (the FS homogeneous formula and its values, the restriction coefficient map, the quadratic chart change and its two-jet, the unitary-factor constancy and the exponential-gauge criterion). If the author wants the two elliptic statements tested, they belong in `Suggested.lean` under a `/-! ## Layer K7 -/` comment with `import Mathlib` only; note that the gauge criterion is the only one of the two that is more than a direct Liouville application.

## R05 (P3) — Sources cited by nickname with no reference entry

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1702` ("Knutson's BorelWeil p1"), `README.md:1840` ("Demazure9 p1's degree-zero elliptic example"), `README.md:1615` ("the source page 21's 'projective transformations' wording and transposed mixed coefficient"); `README.md:1364` and `1842` (Ballmann; Berwick-Evans–Tripathy, linked but absent from the reference list at `README.md:2032–2043`).

Claim: three locators point into texts the README never identifies (no author, title, year or URL), so they cannot be checked, and the FS paragraph records a correction to an unnamed source. Two linked sources are not in the reference list, and the pre-existing Łojasiewicz (`README.md:1455`) and Raghunathan citations are not there either.

Witness: `grep -n "Demazure\|Knutson\|MATH241" README.md` finds only the two citing lines; the reference list has six entries.

Repair: add reference-list entries for every cited text (author, title, year, legal location where one exists) and replace the nicknames by them; for the "page 21" source, name it so the recorded wording and transposed coefficient can be verified and, if confirmed, entered as an erratum. Ballmann's Theorem 4.17 is on printed pages 47–48 of the linked lectures and states the global equivalences (Kähler ⟺ `dω=0` ⟺ `∇J=0` ⟺ normal coordinates at every point); the README's pointwise form ("exactly when `dω(p)=0`") is this roadmap's own strengthening and should be marked as such at the citation.

## R06 (P3) — SchubertGeometry has no section S3P

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:652–653` ("SchubertGeometry S3P constructs the flag-specific vanishing").

Claim: the label resolves nowhere.

Witness: `grep -n S3P` is empty in `TauCetiRoadmap/SchubertGeometry/README.md` on main and at the #1224 head.

Repair: cite the actual SchubertGeometry section that proves `H^q(K/H,𝒪)=0` for `q>0` (GeometricQuantization proves it at its `README.md:643–648` by harmonic theory and isotropy weights), or drop the sentence.

## R07 (P3) — Record why K4.P owns the exponential-sequence Picard comparison

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:574–653`.

Claim: the same object is planned in three later open pull requests: ComplexComparisonPartII C5.4 (`README.md:3303–3331`: the sequence `0→ℤ→O→O^×→0`, `u↦exp(2πiu)`, the connecting map identified with the integral Chern class of the underlying smooth line, explicit cocycles, naturality, the torsion Check), K3Surfaces 1.1 (`README.md:189–236`: `Pic_hol(M)≃H¹(M,O_Mˣ)` by the frame torsor and the exact segment, composed with C5.4), and GeometricQuantization (`README.md:641–651`, consuming C5.4). K3SurfacesAndSymplecticBoundedness declares the gap `gap:integral-topology` asking ComplexKahlerGeometry for exactly K4.P's content (`README.md:202`). This roadmap is earlier than all of them, so stating the notion here is the right direction and the move is recorded in this report; the README does not say so.

Witness: the K3SurfacesAndSymplecticBoundedness contract: "construct the analytic exponential sheaf sequence … the group isomorphism from holomorphic line-bundle classes to `H¹(M,Oˣ)` … identify the connecting map … with the integral first Chern class".

Repair: add to the opening section one sentence naming K4.P as the owner of the holomorphic exponential sequence, `Pic_hol(M)≃H¹(M,𝒪×)` and the `c₁` identification, answering the K3SurfacesAndSymplecticBoundedness gap, with ComplexComparisonPartII C5.4, K3Surfaces 1.1 and GeometricQuantization as its consumers. State the normalisation once in both conventions: `c₁(O(1))·[ℂP¹]=+1` (SBC B6.2's dual-character Hopf line) and `c₁(O(−1))·[ℂP¹]=−1` (ComplexComparisonPartII's).

## R08 (P3) — Padding in `Suggested.lean`

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean:61–72, 113–123, 152–154`.

Claim: `dbarFunction_apply_J` and `dbarFunction_eq_zero_iff` are algebra on the definition `(df(v)+i·df(Jv))/2` (the first is `J²=−1` and `i·i=−1`; the second is `a+ib=0 ⟺ b=ia`); `memSobolev_iff_bundled` is proved in the file in two lines from `MemSobolev.toBesselPotentialSpace` and `memSobolev_toDistr`; `complexBesselDistributionMultiplier_real` compares the symbol `exp((s/2)log(1+‖ζ‖²))` with Mathlib's `(1+‖ζ‖²)^(s/2)` (`Mathlib/Analysis/Distribution/Sobolev.lean:73`), a definitional unfolding of `Real.rpow`. None closed with one tactic in a scratch copy (`simp [dbarFunction, …]`, `rfl`, `fun_prop`, `infer_instance` all left goals), so they are padding by content, not by triviality.

Witness: probe file results: `probe_applyJ_simp` unsolved goals; `probe_eqzero_simp` unsolved goals; `probe_bessel_rfl` "rfl failed"; `probe_temperate` `fun_prop` failed; `probe_realified` instance not found.

Repair: delete the four declarations from `Suggested.lean`; the README keeps each as an API bullet or Check. Keep `realified_isManifold_analytic`, `nijenhuisOnFields_eq_of_eq` (tensoriality) and `complexBesselSymbol_temperate`, which are genuine statements, and add docstrings to `complexBesselMultiplier` and `complexBesselDistributionMultiplier`.

## R09 (P3) — Pre-existing policy and shape items the pull request leaves in place

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:18, 28, 104, 110–114, 166, 319, 452, 470, 529, 1524–1553, 1748, 1847, 1878, 1996, 2011, 2017–2019` (`#279`, `#280`); `README.md:1138, 1148` (`CompactFormPair.operator`, `toRealBilin`); the whole file (no `*Needs:*`/`**Checks.**` structure, no Scope or supplier-contract sections).

Claim: cross-roadmap citations by pull-request number (ComplexManifolds and ComplexTori are on main and have names and milestones), two VariationalMethods names that do not exist at the #1028 head, and the house shape are unchanged from main; the new blocks follow the same prose style, so the new definitions (𝒪×, `Pic_hol`, the incidence space E, `q`, `L_ρ`, the normal chart change, `H_z`) carry their checks inside the prose rather than as three-bullet `**Checks.**` lists, and only the FS block has a Needs line.

Witness: VariationalMethods `README.md:1063` at #1028: "no separate operator declaration; UO-D06's `closedFormOperator` is the operator"; `Suggested.lean:185` there declares `CompactFormPair.operatorDomainV`, not `.operator`.

Repair: replace `#279`/`#280` by "ComplexManifolds Milestone k"/"ComplexTori Milestone 1"; cite VariationalMethods §2.3/§5.1 and `CompactFormPair.operatorDomainV` with UO-D06's `closedFormOperator`; give each new definition a `**Checks.**` list (the prose already contains the values: n=0, d=1, the n=2 exponent pairs, the square torus) and each new block a `*Needs:*` line. The author may take or leave these; they are not blocking.

## Verified sound

**Scope and principles.** Read all 2042 README lines, the 158-line `Suggested.lean` and the four companions (226 lines), and the 617-line README diff against the merge base. No file outside the folder changes. No route-specific shortcut, no copied passage, no computational algorithm, no `set_option`, no sorry'd data, no admitted `example`. The pull request builds on the on-main roadmap and does not re-plan it.

**Gate** (worker, at 6456ba7): FAIL with `residue=3` only; every other counter 0, `build=0`, `depcheck=0`. My dependency check printed exactly:

```text
depcheck: 204 roadmaps, 1648 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line (the roadmap is on main and not in the merge order, which is not a finding). R01 is a cycle the check cannot see because the citations are not on `*Needs:*` lines.

**Lean.** `lake env lean` on each of the four companion files from the worktree: exit 0, two `sorry` warnings (elliptic), one (normal coordinates), none (FS, quartic). A scratch copy of `Suggested.lean` with eight one-tactic probes appended elaborated with only the six expected `sorry` warnings from the original and errors from every probe (listed in R08). The signature file's "structure `whose`" at line 96 is a misparse of the `IsKahler` docstring; no such declaration exists and the file builds. Section-binder audit: `dbarFunction`, `nijenhuisOnFields` and `IsKahler` drop `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M] [I.Boundaryless]`, which their types do not need (pointwise total functions and a `Prop`); the theorems about them keep all four; `complexBesselMultiplier`/`DistributionMultiplier` drop `[CompleteSpace G]`, which `fourierMultiplierCLM` does not need, and the comparison theorem keeps it. README generality agrees: `IsKahler` is "Compatible, closed and N=0" (`README.md:1337`) and Tau Ceti's `Compatible` is `invariant ∧ tames` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:157–163`).

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`, the pull request's manifest; main pins newer revisions, no name used here differs):

| Declaration | File and line | What it gives / does not give |
| --- | --- | --- |
| `CommRing.Pic` | `Mathlib/RingTheory/PicardGroup.lean:429` | invertible modules over a ring; not line bundles on a space, as K4.P says |
| `CategoryTheory.Sheaf.H.δ` | `Mathlib/CategoryTheory/Sites/SheafCohomology/ExactSequences.lean:60` | connecting map of a short exact sequence of `AddCommGrpCat`-sheaves (needs `HasSheafify`, `HasExt`); `Additive 𝒪×` is the right carrier |
| `Projectivization.map` | `Mathlib/LinearAlgebra/Projectivization/Basic.lean` | induced map of an injective linear map; the unitary action is its specialisation |
| `Differentiable.exists_eq_const_of_bounded` | `Mathlib/Analysis/Complex/Liouville.lean:126` | Liouville as used by K7.FlatDegreeZero |
| `TemperedDistribution.besselPotential` | `Mathlib/Analysis/Distribution/Sobolev.lean:73` | symbol `(1+‖x‖²)^(s/2)` as a real `rpow`, hence R08 |
| `SchwartzMap.fourierMultiplierCLM`, `TemperedDistribution.fourierMultiplierCLM` | `Mathlib/Analysis/Distribution/FourierMultiplier.lean:50, 143` | need `HasTemperateGrowth` of the symbol, stated separately in the file |
| `SmoothAlmostComplexStructure.square_neg` | `TauCeti/…/AlmostComplex.lean:74` | `J²=−id` pointwise |
| `SmoothTwoForm.Compatible`, `IsClosed` | `TauCeti/…/TwoForm.lean:157, 26` | invariance plus tameness; closedness separate |
| `smoothSheafCommGroup`, `.compLeft` | `Mathlib/Geometry/Manifold/Sheaf/Smooth.lean:29–37` | the carriers SBC B6.1 and K4.P use |

**Citations resolved** (every cross-roadmap citation of the new text, at the copy named):

| Citation | Where resolved | Result |
| --- | --- | --- |
| TopologicalKTheory T1.6d smoothing clause | main `TopologicalKTheory/README.md:577–612` | exists; its last sentence is the rank-one smoothing K4.P consumes; T1.6d itself consumes "CKG K7.2's complex characteristic cells", so the mutual citation is item-disjoint as the README says (`README.md:2001–2006`) |
| SBC B6.1, B6.2, B2 | main `SmoothBundlesConnections/README.md:1375, 1668–1715, 559` | sheaf/singular comparison, circle-bundle classification by `H²(M;ℤ)` with the dual-character sign (Hopf ↦ +1), associated complex lines |
| StableReduction Layer 4 | main `StableReduction/README.md:529–534` | general Rees blowup of a finite-type ideal as relative Proj with affine charts; usable in R01's repair only through an analytification owned elsewhere |
| ComplexComparisonPartII C−1, C0, C1.7, C1.8, C5.4 | #848 head (`roadmaps show`), lines 724, 915, 1574, 1618, 3015 | exist; upward (R01); C5.4 duplicates K4.P (R07) |
| SchubertGeometry S3P | main and #1224 | absent (R06) |
| VariationalMethods V2.2, V5.1 | #1028 `README.md:452, 839` | sections exist under "Quadratic energies" and "The compact-pair specialization"; the two names cited do not (R09); the resolver's two leads are therefore half right |
| PlanarTopology surface convention, Layer 6 `Surface.Orientation`; SurfaceTopology Layers 2–3, 6, 8 | #271 (`roadmaps show --pr 271`), lines 896–978 and 375, 470, 928, 1173 | exist |
| ComplexManifolds Milestones 1–7, ComplexTori Milestone 1 | main `ComplexManifolds/README.md:172–319`, `ComplexTori/README.md:130` | exist; cited by pull-request number (R09) |
| K3SurfacesAndSymplecticBoundedness `gap:integral-topology` | #1375 `README.md:202` | names this roadmap as supplier of K4.P's content (R07) |

Ownership searches by object (`roadmaps grep` over 440 open pull requests and main) for factors of automorphy, Fubini–Study, normal coordinates, the rational quartic, `Pic_hol`/exponential sequence and the incidence blowup: the degree-zero elliptic lines, the FS unitary symmetry, Kähler normal coordinates and the rational quartic have no other owner (GeometricQuantization `README.md:1004` uses automorphy factors for positive theta lines, a different object; FourManifolds `README.md:2648–2676` builds the real incidence blowup). Open pull requests without files in the brief were not read beyond `roadmaps grep`.

**Sources.** Ballmann, *Lectures on Kähler manifolds*, fetched from the linked Oxford page (institutional copy): Theorem 4.17 at `ballmann-kahler` lines 1990–2012, printed pages 47–48, the seven global equivalences including normal coordinates at every point; supports the K6.0 citation as the global equivalence, with the pointwise refinement the roadmap's own. Berwick-Evans and Tripathy, *A de Rham model for complex analytic equivariant elliptic cohomology*, fetched from the NSF public-access copy: Remark 2.1 at `berwick-evans-tripathy` lines 287–292, printed page 6, identifies the dual elliptic curve with degree-zero lines, i.e. flat unitary lines, via `τm+n ↦ e^(2πi(mx+ny))`; supports the K7.FlatDegreeZero remark as a cross-reference (it is a remark, not a proof). The sources service recorded both fetches in the package manifest by itself; no manifest edit by hand.

**Seeded sample and the new targets.** Each row gives the instances and the values on both sides; "Pass" is about the instance, not a proof of the general statement.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: `h_T=g+iω`, conj-first | `u=1,v=i` on ℂ | `h(1,i)=conj(1)·i=i`; `g=0`, `ω(1,i)=dx∧dy(1,i)=1`; `ω=(i/2)dz∧dz̄=dx∧dy` | Pass | — |
| Conventions: `dw_i∧dw̄_j` coefficient is the transpose of `h'_ij` | general Hermitian `h'`, `ω=Im h'` | coefficient of `u_i v̄_j` forces `c_ij=conj(h'_ij)=h'_ji` | Pass | — |
| K1 `dbarFunction` | `f=z`, `f=z̄`, `J=i·` | `z`: `(v+i·iv)/2=0`; `z̄`: `(v̄+i(−i v̄))/2=v̄` | Pass | — |
| `dbarFunction_apply_J` sign | any `v`, `J²=−1` | `(df(Jv)−i df(v))/2=−i(df(v)+i df(Jv))/2` | Pass | padding (R08) |
| `dbarFunction_eq_zero_iff` | `a=df(v)`, `b=df(Jv)` | `a+ib=0 ⟺ b=−a/i=ia` | Pass | padding (R08) |
| `nijenhuisOnFields` sign | constant `J` on ℂ, coordinate fields | all brackets 0, `N=0`; on `(0,1)` fields `N=−4[X,Y]^(1,0)` as README `README.md:177` | Pass | — |
| `IsKahler` | flat ℂ with `ω=dx∧dy`, `J=i` | `dω=0`, `ω(Jv,Jw)=ω(v,w)`, `ω(v,Jv)=|v|²>0`, `N=0`; Hopf surface excluded by `b₂=0` | Pass | — |
| `complexBesselSymbol` | `ζ=1`, `z=2+2i`; `z=i` | `exp((1+i)log 2)=2e^(i log 2)`, modulus 2; `z=i` modulus 1 | Pass | — |
| `realified_isManifold_analytic` | `M=ℂ`, chart `z↦z` | holomorphic transition ⇒ analytic ⇒ `C^ω` over ℝ | Pass | not one tactic at the pin |
| K2 mixed solver (headline) | `Ω=ℂ`, `Q=ℂ×`, `f=pq` | `u=pq z̄`: `∂̄_z u=pq`, `∂̄_q u=0` | Pass; absent in Lean | R02 |
| K3 Hartogs across a point | `ℂ²`, `f=z₁z₂`; `ℂ`, `f=1/z` | extends; `1/z` unbounded at 0, excluded by `2≤finrank` | Pass | R02 |
| K4.ComponentwiseFiniteRankAssembly [sample] | `M=ℕ` discrete, `r(j)=j`; empty base; point, rank 0 | fibres `ℂ^j`, no uniform bound; unique empty family; zero space | Pass | — |
| K4.P exponential sequence exactness | stalk at a point, `f` near 0 | `exp(2πif)=1 ⟺ f∈ℤ`; local log exists on a disc | Pass | — |
| K4.P conditional isomorphism | `ℂP¹`; elliptic curve | `H¹(𝒪)=H²(𝒪)=0 ⇒ Pic=H²(ℤ)=ℤ`; elliptic `H¹(𝒪)=ℂ`, `Pic⁰≠0`, hypothesis needed (agrees with K7.FlatDegreeZero) | Pass | — |
| K4.P Chern normalisation | `O(1)` on `ℂP¹`, `h=(1+|z|²)^(−1)` | `Θ=∂∂̄log(1+|z|²)=−2πiω_FS`; `iΘ/2π=ω_FS`, `∫=1`; B6.2 Hopf `+1`; CCPII `c₁(O(−1))=−1` | Pass | R07 wording |
| K4.P units on compact connected M | `ℂP¹`; two disjoint copies | constants; `(1,2)` is a unit, not a global scalar | Pass | — |
| K5a [sample] star and Gram | `ℝ²`, `dx,dy` | `*dx=dy`, `*dy=−dx`, `*²=−1` on 1-forms, `‖dx∧dy‖²=1` | Pass | — |
| K5a.DistributionLocalStructure [sample] | `m=2,k=0,w=δ₀`; delta series `φ=1/(1+2x)` | `F=x₊`, `D²F=δ₀`; `⟨δ^(n)/n!,φ⟩=(−1)^n(−2)^n=2^n`, partial sums `1,3,7` | Pass | — |
| K5a.SmoothSectionMontel [sample] | `M=ℕ` discrete rank 1; `C⁰`-ball on ℝ | `ℂ^ℕ`, bounded boxes compact (Tychonoff); the `C⁰` ball is not compact, so all derivative seminorms are needed | Pass | — |
| K5a.ComponentwiseCompact [sample] | 3 points, ranks 0,1,2 | `L²=0⊕ℂ⊕ℂ²`, `‖(0,3,(0,4))‖²=25`; eigen-index = disjoint union | Pass | — |
| K5b.0 [sample] | standard ℂ | `ω^1/1!=dx∧dy=vol`; `|dz|²=2`; `*dz=dy−i dx=−i dz` type (1,0); `barStar dz=*dz̄=i dz̄` type (0,1) | Pass | — |
| K5b.1 [sample] | `ℂP¹`, `O(−1)`; elliptic trivial line | `h⁰=0`, `h¹=h⁰(O(1)⊗O(−2))=0`; `h^(0,0)=h^(1,0)=h^(0,1)=h^(1,1)=1` | Pass | — |
| K6.0 normal coordinates | `z^i(w)=w^i−½Γ^i_jk w^j w^k`, `H(0)=I` | `∂_c h'_ab̄(0)=∂_c h_ab̄−Γ^b_ac=∂_c h_ab̄−∂_a h_cb̄=0` by Kähler symmetry; the ½ cancels the two symmetric terms | Pass | — |
| `correction_twoJet` | `Γ` symmetric | `iteratedFDeriv 2` of `−½ΣΓ w_j w_k` at 0 on `(u,v)` is `−½Γ(u,v)−½Γ(v,u)=−Γ(u,v)`; derivative `id` | Pass | file deleted (R04) |
| K6.0 Gram–Schmidt coframe | `H=I+O(|w|²)` | `A=I+O(|w|²)`, `dA(0)=0`, `dφ_j(p)=ΣdA_jk∧dw^k=0`; `|φ_j|²=2`, `ψ=φ/√2` orthonormal | Pass | — |
| Ballmann 4.17 vs README pointwise claim | `dω(p)=0` at one point | the quadratic change uses only `∂_j h_kl̄(p)` symmetry, so pointwise holds; Ballmann states the global form | Pass | mark as own refinement (R05) |
| K7.1 [sample] | `n=0`; `[2:4]`; `t=2`, `∞` | point; `U₀` coordinate `4/2=2`, `[1:2]=[2:4]`; `[2:1]`, `[1:0]` | Pass | — |
| K7.2 [sample] FS normalisation | `ℂP¹` chart | `ω=dxdy/(π(1+r²)²)`, `∫=(1/π)·2π·½=1` | Pass | — |
| K7.2 [sample] sections, canonical | `n=1`, `k=0,1,2,−1`; `z=1/w` | `h⁰=1,2,3,0`; `dz=−w^(−2)dw`, `K≅O(−2)` | Pass | — |
| FS chart matrix | `ω=(i/2π)∂∂̄log r` | `∂_i∂̄_j log r=δ_ij/r−w̄_i w_j/r²`; `h'_ij=c_ji=(δ_ij/r−w_i w̄_j/r²)/π` | Pass | — |
| FS homogeneous form | `z=e₀,v=w=e₁`; `v=z` | `(1·1−0)/π=1/π` = chart `h'_11(0)`; `H_z(z,w)=(‖z‖²⟨z,w⟩−‖z‖²⟨z,w⟩)/…=0` | Pass | — |
| FS scaling and unitarity | `c≠0`, `U` unitary | numerator and denominator both scale by `|c|⁴`; inner products preserved | Pass | — |
| FS dilation `diag(1,2)` | chart `w↦2w` at 0 | pullback `4ω(0)`; `ω(0)=(i/2π)dw∧dw̄≠0` | Pass | — |
| FS stabilizers, `n=0` | standard line; `ℂP⁰` | `U(1)×U(n)`, descended `U(n)`; `PU(1)=U(1)/U(1)` trivial, tangent space 0 | Pass | — |
| K7.2.TautologicalIncidence charts | `ℓ_i,ℓ_k≠0` | `e_i+Σz_je_j=z_k(e_k+Σz'_je_j)` ⇒ `z'_i=1/z_k`, `z'_j=z_j/z_k`, `a'=az_k` | Pass | — |
| Incidence `b*` and homogeneity | `d=1`; `d=2`, `k=−1`; `k=1` | identity; `f(tv)=t^(−1)f(v)` forces `f(0)=lim t^(−1)f(v)` so `f=0`; `H⁰(O(1))=V*`, dim `d` | Pass | — |
| Incidence `d=1`, `k<0` | point `P(V)` | `O(k)` is a line on a point, `h⁰=1`, not a negative-homogeneity function | Pass | — |
| Blowup/analytification comparison | — | consumes ComplexComparisonPartII | Upward | R01 |
| RationalQuartic charts and immersion | `z=t/s`; `u=s/t` | `(z,z³,z⁴)` in `x₀≠0`; `(u⁴,u³,u)` in `x₃≠0`; derivative `(1,3z²,4z³)≠0`; `u=1/z` | Pass | — |
| RationalQuartic restriction | basis `s⁴,s³t,s²t²,st³,t⁴` | `(a,b,c,d)↦(a,b,0,c,d)`; image dim 4 of 5; `s²t²` missing | Pass | — |
| RationalQuartic higher twists | `n=2`; induction | pair sums `0,1,2,3,4,5,6,7,8` from the nine listed pairs; `[0,4n]+{0,4}⊇[0,4n+4]`; `h⁰=4n+1` | Pass | — |
| General eventual surjectivity | — | consumes ComplexComparisonPartII C1.8 | Upward | R01 |
| K7.FlatDegreeZero holonomy | `(z,v)~(z+λ,ρ(λ)v)` | `(λ,v)~(0,ρ(λ)^(−1)v)`: holonomy `ρ(λ)^(−1)` | Pass | — |
| Unitary sections (`unitary_automorphic_constant`) | `ρ=1`; `ρ(1)=−1` | `|f|` periodic, bounded, constant `c`; `(ρ−1)c=0` gives any `c`, resp. `c=0` | Pass | file deleted (R04) |
| Gauge `a` | `u=log|ρ(1)|`, `v=log|ρ(τ)|` | `a=u+i(uReτ−v)/Imτ`: `Re a=u`, `Re(aτ)=uReτ−(uReτ−v)=v`; `σ=e^(−aλ)ρ` unitary | Pass | — |
| Gauge criterion (`nonzero_automorphic_iff_exponential`) | `ρ=e^(aλ)`; two unitary characters | `f=e^(az)`; `|e^(aλ)|=1` for `λ=1,τ` ⇒ `a=0`, `ρ=σ` | Pass | — |
| Smooth triviality | `ρ(1)=e^(2πiα)`, `ρ(τ)=e^(2πiβ)` | `f(x+τy)=e^(2πi(αx+βy))`: `f(z+1)=ρ(1)f`, `f(z+τ)=ρ(τ)f`, nowhere 0 | Pass | — |
| Flat metric construction | `iF_h=φω`, `u=−2Gφ` | `Δ_d u=−2(φ−Hφ)=−2φ` (mean 0 by degree 0); `i∂∂̄u=−(Δ_du)ω/2=φω`; `iF_(h')=φω−φω=0` | Pass | — |
| Serre on `E_τ` | `ρ=1`; square torus `ρ=(−1)^m` | `h⁰=h¹=1` with `dz`, `dz̄`; unitary nontrivial: `h⁰=h¹=0`, `c₁=0` | Pass | — |
| K8.NilpotentCentralReduction [sample] | real Heisenberg `[X,Y]=Z`, integer lattice; `G=ℝ²`; `G={e}` | `𝔞=ℝZ`, `Γ∩A=ℤ`, base `ℝ²/ℤ²`, fibre `S¹`; torus base case; rank-one degree 0 | Pass | — |
| K8 complex central reduction [sample] | complex Heisenberg, Gaussian lattice | centre `ℂ`, lattice `ℤ[i]` rank 2, quotient dimension 2, fibre `ℂ/ℤ[i]` | Pass | — |
| Newlander–Nirenberg (headline) | standard ℂⁿ; `N≠0` | `N=0` with the standard atlas; `N≠0` excludes any atlas | Pass; not in docstring | R02 |

52 rows, covering the 15 sampled targets, the headline families, every target a finding touches and every declaration of `Suggested.lean` and of the companions.

## Not verifiable

- "Demazure9 p1", "Knutson's BorelWeil p1" and "the source page 21" (R05): no bibliographic identification, so the sources service could not be asked for them; the claimed "projective transformations" wording and transposed coefficient of that source were not checked, and no erratum is entered.
- Griffiths–Harris, Wells, Webster, Raghunathan, Łojasiewicz: pre-existing citations recorded in earlier rounds as uncertified or without legal text; not re-requested.
- Ownership against open pull requests whose files the brief does not provide was checked only by `roadmaps grep` on their READMEs and `Suggested.lean`, not by reading them.
- The finite adversarial rows are instance checks, not proofs; the tensoriality of `nijenhuisOnFields` and the temperate growth of the complex Bessel symbol were checked on instances and by reading, not elaborated.

## Source issues

- none
