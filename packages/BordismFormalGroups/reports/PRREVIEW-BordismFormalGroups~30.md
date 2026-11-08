# Review of BordismFormalGroups (pull request #1808 at d1a45bf)

**Verdict:** needs changes

This pull request changes one file of the folder, `TauCetiRoadmap/BordismFormalGroups/README.md` (44 insertions, 854 deletions): the simplicial, quasicategorical and operadic foundations of F6.5 item 1 are cut and consumed from GeneralizedCohomology G2.11, which this pull request adds to `TauCetiRoadmap/GeneralizedCohomology/README.md` (item 11 of G2, line 669). `Suggested.lean` is unchanged from main. The gate fails (`depcheck=2 imports=1 mathlib-subimports=4 no-import-mathlib=1 blob=1 prnum=1 tex=11 dropped=4 outside-folder=2`), so every failing check below is a finding, and the full-review checks on the unchanged parts of the folder are reported as well.

## R01 (P1) — Supply cycle BordismFormalGroups → TangentialBordism → StringOrientation → BordismFormalGroups

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` line 31 ("TangentialBordism supplies geometric cycles and the Pontryagin–Thom comparison, and owns the integral unoriented/oriented/Spin coefficient calculations"), with the consuming clauses at lines 173 ("Consume TB B4.2's mod-2 Adams tower and, only at odd primes, B4.8's tower"), 189, 206, 242, 273, 464, 748, 1007, 1952 and 1966.

Claim: TangentialBordism is a supplier of F2, F4 and F6.2–F6.3.

Witness: the dependency check on this head prints `UPWARD: BordismFormalGroups (on main) -> TangentialBordism (#14) at README lines [31]` and `CYCLE among: BordismFormalGroups, StringOrientation, TangentialBordism`. TangentialBordism (pull request #942, `README.md` line 264) consumes StringOrientation S1.3–S5.3; StringOrientation (pull request #948, `README.md` lines 85, 249, 1160, 1199) consumes BordismFormalGroups F3–F5. This roadmap is on main and TangentialBordism is still a pull request, so the edge is also upward.

Repair: remove every supplier edge to TangentialBordism and own the inputs here or cite them from main: the mod-p Steenrod algebra and the HF_p-based Adams towers (F2 already constructs the MU instances at every prime, the Milnor primitives, the exterior change of rings and the dual Steenrod algebra comparison), the MO_* coefficient ring (F2 already proves the universal exponent-two ring is MO_*), and the geometric MU comparison, which TangentialBordism's own head (#942, line 1504) says remains this roadmap's. State at line 31 that TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient rings. Tested: on a copy of the README with the TangentialBordism edges rewritten to F2, the same dependency check prints `depcheck: 240 roadmaps, 2443 edges, 0 problem(s)`. The head of pull request #1854 for this folder already makes this ownership move (its lines 28–44); carry that version rather than restating it (see R10).

## R02 (P2) — The acceptance test states nothing the finished roadmap is tested against, and omits a statable headline

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 6–10 (module docstring), 17–66.

Claim: `Suggested.lean` states the roadmap's headline theorems against the pins and names the unstatable ones.

Witness: every `sorry`'d statement is a theorem of the pinned Tau Ceti (2fd255d9), restated on a duplicate carrier. `formalNSeries` (line 17) is `FormalGroup.nsmulSeries` (`TauCeti/RingTheory/FormalGroup/NSMul/Basic.lean` line 93, defined as `(n • F.tautologicalPoint).val`); `formalVariable` (line 22) is `F.tautologicalPoint` by `rfl`; the probe `formalNSeries F n = F.nsmulSeries n` elaborates. `formalNSeries_constantCoeff`, `formalNSeries_one`, `formalNSeries_coeff_one` are `constantCoeff_nsmulSeries` (line 117), `nsmulSeries_one` (line 112) and `coeff_one_nsmulSeries` (line 274) of that file; `exists_unique_normalized_exponentTwo_logarithm` (line 53) closes by one term, `F.existsUnique_logarithm_of_nsmulSeries_eq_zero Nat.prime_two hexponent` (`TauCeti/RingTheory/FormalGroup/Logarithm/InfiniteHeight.lean` line 249), elaborated on a scratch copy with `sorry` nowhere. Meanwhile the F1 headline "two one-dimensional commutative formal groups over a separably closed field of characteristic p are isomorphic precisely when their heights agree, including the infinite-height additive class" (README lines 139–142) is statable at the pins (`FormalGroup.height`, `TauCeti.FormalGroupIso` and `FormalGroupIso.height_eq` in `TauCeti/RingTheory/FormalGroup/Height/Basic.lean` lines 205–346; no `IsSepClosed` statement exists in the formal-group tree) and is absent. The docstring names no unstatable headline (Quillen's theorem L ≅ MU_*, Landweber exactness, nilpotence, thick subcategories, Hopkins–Ravenel smashing, Greenlees–Sadofsky, the Lubin–Tate universal deformation: none has a carrier at the pins).

Repair: delete the eight declarations (R05); state the height classification over a separably closed field of characteristic p as the one statable headline (hypotheses `[Field K] [IsSepClosed K] [CharP K p] [Fact p.Prime]`, `[F.IsComm] [G.IsComm]`, conclusion an isomorphism exists exactly when `F.height p = G.height p`, in a form the statement-hygiene scanner accepts rather than a bare `Nonempty` of an isomorphism type); write the module docstring in the required form, listing each unstatable headline and the carrier it lacks (MU and the stable category from GeneralizedCohomology G2, BP, K(n), the Lubin–Tate deformation functor).

## R03 (P2) — F1 plans, and F2 partly plans, what the pinned Tau Ceti already proves, and cites the library by stale pinned links

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 18–25 (Mathlib pull requests #38213, #36167, #41710 as "proposed designs"), 50 and 93 (links into the Tau Ceti repository at commit 1844920e), 70–83, 99–125, 128–134, 201–206.

Claim: the Lazard ring with its graded universal property and polynomial theorem, the any-ring cocycle lemma, the indecomposables, the coordinate-change Hopf algebroid, the exponent-two logarithm with its bundled strict isomorphism, height and its coordinate independence are targets to construct.

Witness, at the pin 2fd255d9: `TauCeti.LazardRing` and `LazardRing.gradedLift` (`LazardRing/Basic.lean` lines 232, 463), `LazardRing.mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] LazardRing` (`LazardRing/Polynomial.lean` line 112), `existsUnique_eq_smul_lazardCocycle` (`SymmetricCocycle/Classification.lean` line 420), `LazardRing.cotangentBasis` (`LazardRing/Indecomposable.lean`), `LazardRing.coordinateChangeLift` (`CoordinateChange/Lazard.lean`), `exponentTwoLog`, `eq_exponentTwoLog`, `exponentTwoLogHom`, `exponentTwoExpHom` (`ExponentTwo/Basic.lean` lines 64–120, `ExponentTwo/Iso.lean` lines 72–119), the graded form (`ExponentTwo/Graded.lean` lines 73, 130) and the universal exponent-two ring (`ExponentTwo/Lazard.lean`, `ExponentTwo/CoordinateChange.lean`), `FormalGroup.height`, `FormalGroupIso.height_eq` (`Height/Basic.lean` lines 205, 346), `TauCeti.FormalGroupHom`, `TauCeti.FormalGroupIso`, `FormalGroupIso.IsStrict` (`Hom.lean` line 433), `FormalGroup.addInvX`, `FormalGroup.TopNilpotentPoint`. The README cites only the NSMul and Logarithm modules, by links pinned to an older Tau Ceti commit.

Repair: in the carriers paragraph and F1, cite these declarations by module and name as consumed, and keep as targets only what is not at the pin (the separably-closed height classification, base-change naturality of the exponent-two isomorphism if absent, F2's identification of the universal exponent-two ring with MO_*). Replace the three Mathlib pull-request links and the two commit-pinned Tau Ceti links by module names. The head of pull request #1807 for this folder (its lines 14–25) already names this tree and says "nothing it provides is planned again"; carry that version rather than restating it (R10).

## R04 (P2) — HomotopySpheres, a roadmap on the never-cite list, supplies the James construction and the Toda brackets

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 14–16 ("HomotopySpheres section references use the §3C/§9 specification at 34167306… in PR284"), 332 ("Consume HomotopySpheres Stage3C's three-fold Toda brackets on pointed spaces"), 669, 708, 1961.

Claim: HomotopySpheres 3B/3C supply the James stages, the James–Hopf length-two map and the pointed three-fold Toda brackets that F4 and F6.2's nilpotence proof use.

Witness: `dropped-names.txt` lists HomotopySpheres; the gate prints four `dropped` hits (lines 14, 15, 332, 669) and the brief forbids citing it. Within the permitted supply graph these inputs have no owner. Lines 14–16 are also the gate's `blob` hit (a link into the roadmap repository pinned to a commit) and its `prnum` hit ("PR284").

Repair: delete lines 14–16; own the James construction J(Y) with its stages J_jS^(2r), the James–Hopf maps H_j (F6.2 item 3 already constructs them "for every j ≥ 1") and the three-fold Toda brackets of pointed spaces in F4, or cite them from AlgebraicTopology where that roadmap states them. The head of pull request #1854 for this folder already owns "the three-fold Toda brackets of pointed spaces and the James construction" (its lines 28–44); carry that version (R10).

## R05 (P3) — Padding: every declaration of `Suggested.lean` is deletable

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 17–81.

Claim: the eight declarations are the roadmap's acceptance test.

Witness: `formalNSeries`, `formalVariable` duplicate pinned carriers (R02); `formalNSeries_eq_nsmul` (line 26) is proved in place and restates the pinned definition of `nsmulSeries`; `formalNSeries_constantCoeff`, `formalNSeries_one`, `formalNSeries_coeff_one` (lines 36–47) are pinned lemmas, two of them one `exact` after rewriting along `formalNSeries_eq_nsmul`, one (`nsmulSeries_one`) a direct `exact`; `isSMulRegular_sub_of_pow_eq_zero` (line 72) is a proved lemma about free variables of a ring and a module with no object of the roadmap in it (its README form is the F6.6 identity `eν · Σ_(i=1)^q Π^(q−i) n^(i−1) = Π^q`, line 1843, which the README keeps).

Repair: delete all eight from `Suggested.lean`; the README keeps the n-series facts as consumed pinned declarations and the nilpotent-perturbation identity as the F6.6 Check it already is.

## R06 (P3) — README and Lean disagree on names

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 592 (`muSmashNilpotence`), 596 (`muSelfMapNilpotence`), 600 (`muHurewiczNilpotence`), 497 (`gradedComoduleFilteredPresentation`), 902 (`muPtypicalRingComparison`), 1251 (`muPtypicalPolynomialCoefficientIso`), 1421 (`moravaStabilizer_cohomology_vanishing`), 1787 (`torusFiniteCellMappingEulerComparison`), 1796 (`momentNormalMU_eulerPrecomposition_injective`), 1825 (`finiteProductCircleCharacters`), 1872 (`muPtypicalFiniteCohomologyComparison`), 1912 (`momentStratumExtension_nullhomotopy`).

Claim: a backticked Lean-style name of this roadmap's own is declared in `Suggested.lean`.

Witness: none of the twelve is declared there, and none of the eight names `Suggested.lean` declares appears in the README (`grep` count 0 for each).

Repair: write the twelve as prose names of targets (no backticks), and make the README name whatever `Suggested.lean` declares after R02.

## R07 (P3) — Imports violate the Lean form

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 1–4.

Claim: the file imports the pinned libraries as the form requires.

Witness: the gate prints `no-import-mathlib`, `mathlib-subimports` (4) and `imports`: the header is `import Mathlib.RingTheory.FormalGroup.Basic`, `Mathlib.Algebra.Ring.GeomSum`, `Mathlib.Algebra.Regular.SMul`, `Mathlib.Algebra.Module.Basic`; the docstring (lines 6–10) is not of the form "<title>: target signatures" and does not say which headlines are unstatable.

Repair: the single line `import Mathlib`, followed only by the `TauCeti.*` modules the statements use (after R02, `TauCeti.RingTheory.FormalGroup.Height.Basic` and `TauCeti.RingTheory.FormalGroup.Hom`), and the module docstring in the required form.

## R08 (P3) — TeX-only syntax outside code spans

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1534 (`E^{tG}`), 1779 (`Σ^{d_j}`, `Σ^{e_k}`), 1786 (`Σ^{2r}`), 1812 (`⊕_{0≤α_i≤n}`, `MU^{k−2|α|}`), 1815 (`∏_{α∈N^ℓ}`), 1852 (`BP_{−k}`), 1908 (`Σ^{b_D}`), 1911 (`Σ^{2r_C}`).

Claim: house style, Unicode mathematics outside code spans.

Witness: the gate prints eleven `tex` hits at these lines.

Repair: put each formula in a code span or write the sub/superscripts with parentheses as the rest of the README does (`Σ^(d_j)`, `MU^(k−2|α|)`, `BP_(−k)`).

## R09 (P3) — Edits outside the roadmap folders the pull request owns

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.

Claim: the pull request changes only its own roadmap folders.

Witness: `git diff --stat origin/main...HEAD` outside the fifteen named folders lists these two one-line rewordings ("`LFunctions` consumes this package and supplies its own character-specific continuation"; "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer"); the gate prints `outside-folder (2)`.

Repair: revert both lines here (and move them to a pull request on those roadmaps if wanted; the second reads "consumed by … and consumed by").

## R10 (P3) — Two other open pull requests rewrite this README differently; the order with #1854 is not stated and the description omits this folder

Location: the pull request description (merge-order paragraph: "#1101 → #1807 → this pull request"); `TauCetiRoadmap/BordismFormalGroups/README.md` lines 14–44 and 1541–1558.

Claim: the change to this folder is consistent with the other open pull requests that change it.

Witness: against main (2824 lines) this head changes lines 30 and 1541–2824 (the F6.5 cut). The head of #1807 (2379 lines) makes the same F6.5 cut and in addition rewrites lines 14–25 (the Tau Ceti tree, R03), 30–36, 48–143 (F2) and more; the head of #1854 (2248 lines) makes the same cut, deletes the HomotopySpheres lines 14–17 (R04) and rewrites lines 28–44 to own the Steenrod/Adams carriers and MO_* and to make TangentialBordism a consumer (R01). #1854 is not named in the merge-order paragraph, and the description does not mention BordismFormalGroups.

Repair: name the order relative to #1854 in the merge-order paragraph, and carry this folder as the predecessor leaves it instead of restating the F6.5 cut (if #1807 merges first, this pull request's version of the folder adds nothing; if it merges first, #1807 and #1854 must be rebased over it). Say in the description what this pull request does to this folder.

## R11 (P3) — Cited works not recorded in the manifest, and claims without locators

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 428–432 (Carrick–Davies–van Nigtevecht Definitions 3.3/3.7, Lemma 3.9, Propositions 3.14–15, Theorem 3.16), 385 (Bauer Lemma 8.6, Corollary 8.7), 1726 (Hovey–Strickland Proposition 7.10(e)), 1994–2014 (references).

Claim: every cited work is recorded in `sources.toml` and every theorem has an exact locator.

Witness: the manifest records nine works (ravenel-green, miller-cobordism, hatcher-at, quillen-elementary, quillen-fgl-bulletin, dhs-nilpotence-i, guillou-weibel, thom-1954, bousfield-1979). The README's reference list names twenty-one works (Adams, Landweber–Ravenel–Stong, Wilson, Hovey, Lubin–Tate, Hopkins–Smith, Ravenel's orange book, Hovey–Strickland, Greenlees–Sadofsky, Kuhn, Hovey–Sadofsky, Johnson–Wilson, Würgler, Clausen–Mathew, Symonds, Nikolaus–Scholze, Lurie HTT and HA, Carrick–Davies–van Nigtevecht, Bauer, …) of which only Quillen, Ravenel's green book and Devinatz–Hopkins–Smith have manifest keys; conversely miller-cobordism, hatcher-at, guillou-weibel, thom-1954 and bousfield-1979 are recorded but never cited. Apart from the handful listed above, the theorems of F1–F6 carry no theorem or page locator (Lazard's theorem, Quillen's theorem, Landweber's exact functor theorem, the smashing theorem, the Johnson–Wilson comparison at line 778, the Morava stabilizer dimension at line 1419).

Repair: record each cited work in the manifest with one key each and `cited_for`; add a locator (theorem number and page, into a legally readable text or `uncertified` by DOI) at each theorem.

## R12 (P3) — README shape: no supplier contracts, no Checks, no per-target Needs lines

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` throughout; the definitions at lines 470 (invariant ideal), 579 (Bousfield class), 983 (type), 992 (v_n self-map), 1017 (strong and partial type), 1375 (E-nilpotent spectra).

Claim: the README has the TauCetiRoadmap form.

Witness: there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build` section; no definition has a `**Checks.**` list (the only negative controls are prose remarks such as the Moore-boundary test at line 641 and the ungraded prime (p, v₁−1) at line 477); no target has a `*Needs:*` line, so one supplier paragraph ("Order and references", lines 1936–1992) covers hundreds of theorems with different needs; several layer-sized sections (F6.2, F6.3) are single paragraphs of three to five pages. This predates the pull request.

Repair: add the four sections (the supplier contracts naming the pinned declarations of R03 and the sections of GeneralizedCohomology G2–G5 and G2.11, EllipticCurves, ProfiniteCohomology, SchurWeyl, DGAInfinity, DGFloer, CompactGroups, ConvexityToric, GeometricTopology, AlgebraicTopology, CharacteristicClasses, TopologicalKTheory consumed); give each definition three discriminating Checks (for the Bousfield class: ⟨Hℚ⟩ versus ⟨S⟩, ⟨K(n)⟩ ∧ ⟨K(m)⟩ = 0 for n ≠ m, ⟨B(n)⟩ = ⟨K(n)⟩; for type: S_(p), S/p, 0; for strong type n at p = 2 versus odd p); give each theorem a `*Needs:*` line.

## Verified sound

**Gate and build.** The targeted build of `TauCetiRoadmap.BordismFormalGroups.Suggested` passes (`build=0`, `sorry-data=0`, `set_option=0`, `statement-hygiene=0`); the eight elaborated signatures in the worker's list match the file, with no dropped section binder. Dependency check on this head: `UPWARD … TangentialBordism`, `CYCLE among: BordismFormalGroups, StringOrientation, TangentialBordism` (R01); on the scratch copy without the TangentialBordism edges: `0 problem(s)`.

**Probes elaborated at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), `sorry` nowhere:** `formalVariable F = F.tautologicalPoint` by `rfl`; `formalNSeries F n = F.nsmulSeries n`; `formalNSeries F 1 = X` by `exact F.nsmulSeries_one`; constant and linear coefficients by `rw [formalNSeries_eq_nsmulSeries]; exact F.constantCoeff_nsmulSeries n` and `… F.coeff_one_nsmulSeries n`; the exponent-two headline by `exact F.existsUnique_logarithm_of_nsmulSeries_eq_zero Nat.prime_two hexponent`, both with `hexponent` on `formalNSeries` directly and after rewriting.

**Library declarations opened at the pin.** Mathlib: `FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean` line 57), `FormalGroup.Point` (line 127), `AddMonoid (F.Point σ)` (line 334), `PowerSeries.HasSubst.X` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`), `AddCircle.homeomorphCircle`, `toCircle_zsmul` (`Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean`), `toCircle_addChar` (`…/CircleAddChar.lean`), `IsSMulRegular.of_mul`, `IsSMulRegular.pow` (`Mathlib/Algebra/Regular/SMul.lean`); Mathlib has no lemma on regularity of a commuting nilpotent perturbation (`Mathlib/Algebra/Regular/*.lean` do not mention `IsNilpotent`). Tau Ceti: the files and lines listed in R02–R03, plus `nsmulSeries_add`, `nsmulSeries_mul`, `natCast_dvd_coeff_nsmulSeries` (`NSMul/Basic.lean`), `constantCoeff_log`, `coeff_one_log`, `subst_toPowerSeries_log`, `subst_toPowerSeries_eq_add_iff`, `subst_exp_log` (`Logarithm/Basic.lean`), `FormalGroup.TopNilpotentPoint` (`TopNilpotentPoint/Basic.lean` line 85), `TauCeti.TopCat.serreFibrations` (`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean`).

**Seeded sample.** "The smoothing-and-triangulation comparison", item 1 "Smooth implies PL", is GeometricTopology's section on main (`TauCetiRoadmap/GeometricTopology/README.md` lines 930 and 938–943): every smooth manifold has an essentially unique PL structure by a smooth triangulation (Whitehead 1940; Munkres 1966). F6.6 (README line 1772) uses it only to obtain a finite CW model of a compact smooth manifold, which a finite smooth triangulation gives; AlgebraicTopology's manifold-to-CW comparison (this pull request's `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2089–2095, `finiteCWType_of_compactSpace_of_isManifold`) consumes the same item. Supported as written.

**Cross-roadmap citations resolved (25).** GeneralizedCohomology G2.11 at this head's `GeneralizedCohomology/README.md` line 669 (G2 item 11), absent on main, present at the head of #1807 (13 mentions); its text carries the Bergner model, coherent nerve, straightening, Joyal model, Cat∞, Sp∞, `Fun(BG,Sp∞)`, Ind, relative adjunctions, the universal exact lax-monoidal approximation and the two-colored operad that F6.5 consumes, with the same keyword counts as the cut text. G2.4/G2.6/G2.7/G2.9 (lines 274, 399, 408, 470), G3 (1506), G4 (1779), G5.3/G5.4/G5.5/G5.7 (2365, 2388, 2516, 3074). TangentialBordism B4.2 (#942 `README.md` line 1009) and B4.8 (line 1745, "6.4 Odd-primary SO and Spin comparison (B4.8)"). StringOrientation consumes F3–F5 (#948 lines 85, 249, 1160, 1199). EllipticCohomology E2/E4/E5 on main (lines 486, 885, 1527; 21 mentions of this roadmap, all as consumer). ProfiniteCohomology main (continuous cohomology functor, cohomological dimension, line 6–10). SchurWeyl Layers 0, 2, 5 (main lines 309, 340, 522). DGAInfinity Layer 8 (main line 520, matric and higher Massey products line 534). DGFloer Layer 1 item 2 Serre spectral sequence (main line 226). CompactGroups unitarizability and complete reducibility (main line 168). ConvexityToric T2 "Morse–Bott and moment-map topology" (main line 73). EllipticCurves Layer 1 (ii) formal logarithm and exponential (main line 640). TopologicalKTheory β = [L] − 1 with L = O(−1) (main lines 148–150), consistent with F2's `u = β = [O(−1)] − 1`. CharacteristicClasses C1.1b (main line 271) and `c₁(O(−1)) = −h` (line 190), consistent with F6.6's "ordinary coefficient image is −h_i". AlgebraicTopology 8.8 nonabelian classifying spaces (this head, line 2099).

**Ownership against open pull requests.** ChromaticHomotopyTheory (#1643) consumes F1–F3, F5, F6.1–F6.4 (its lines 12, 79–81, 183, 241, 291) and its Layer 2 is "supplied interfaces". GeneralAlgebraicKTheoryPartII (#1742) names F1–F3 and F6.1–F6.4 as already stated here (its line 11); its §4.24 is Kuhn's T(n)-local Tate vanishing and its §4.8 a general fracture lemma for two spectra E, F under a hypothesis, distinct from F6.5's K(n)-local Greenlees–Sadofsky statement and F6.4's L_n/L_(K(n)) square. Pull requests without files here were not checked.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| F1 cocycle lemma: d_n, C_n integral | n = 2, 3, 4, 6 | d_2 = d_4 = 2, d_3 = 3, d_6 = 1; C_2 = XY, C_4 = 2X³Y + 3X²Y² + 2XY³, C_6 = (X+Y)⁶ − X⁶ − Y⁶ | integral, matches "p at prime powers, 1 otherwise" | none |
| F1 "C_(2^k)(X,X) has odd coefficient" | n = 2, 4, 8 | C_n(X,X) = (2^(n−1) − 1)Xⁿ: 1, 7, 127 | odd | none |
| F1 exponent-two normalization a_(2^k−1) = 0 ⇔ coeff X^(2^k) = 0 | k = 1, 2 | coefficients of X², X⁴ vanish; Lean `coeff (2^k) g = 0` | agree with pin's `coeff_two_pow_exponentTwoLog` | none |
| F1 additive series over 2 = 0 | h = X², h = X³, h = X + X² | (X+Y)² − X² − Y² = 2XY = 0 ✓; (X+Y)³ − X³ − Y³ = X²Y + XY² ≠ 0 ✓; constant term forced 0 | iff holds on these | none |
| F2 K-theory law x_K(L) = u⁻¹([L⁻¹] − 1) | L, M lines | u·x(LM) = u²x(L)x(M) + u x(L) + u x(M) ⇒ F_K = x + y + uxy; degrees 2 = 2 = −2 + 4 | consistent, u x satisfies 𝔾ₘ | none |
| F2 Milnor primitive degrees | p = 2: i = 0, 1; odd p: i = 0, 1 | 2^(i+1) − 1 = 1, 3 (Sq¹, [Sq²,Sq¹]); 2p^i − 1 = 1, 2p − 1 (β, P¹β − βP¹) | correct | none |
| F4 triple bracket degree and indeterminacy | r = 3 vs general Σ|a_i| + r − 2 | Σ|a_i| + 1 both ways; indeterminacy a·π_(|b|+|c|+1) + π_(|a|+|b|+1)·c | r = 3 case recovered | none |
| F5 ungraded invariant prime (p, v₁ − 1) | η_R(v₁) = v₁ + p t₁ | v₁ − 1 ↦ v₁ − 1 + p t₁ ∈ (p, v₁ − 1)Γ, so invariant; not homogeneous | correct negative control for "homogeneous" | none |
| F6.2 Moore-boundary test | S →p S → M(p) →δ ΣS | MU_*: p injective on MU_* ⇒ MU_*δ = 0; H_1(M(p);𝔽_p) → H_0(S;𝔽_p) iso; δ^(∧r) ≠ 0 by Künneth | MU∧f (not MU_*f) is the right hypothesis | none |
| F6.2 vanishing-line slopes equal at p = 2 | r, k arbitrary | 2r·2^k − 1 = r·2^(k+1) − 1 | equal | none |
| F6.3 degree bookkeeping |σ^nE| = c_E d_n + a_E | n = 1, E = (e₂ = 1) | |v₂| = (p+1)(2p−2), b_E = p+1, a_E = 0, c_E = p; |t₁^p| = p(2p−2) | equal | none |
| F6.3 diagonal r_(σ^nE)(v^E) ≡ v_n^(Σe_i) mod I_n | n = 1, E = (e₂ = 1) | η_R(v₂) ≡ v₂ + v₁t₁^p − v₁^p t₁ mod p; coefficient of t₁^p is v₁; |t₁| < |t₁^p| excludes the other term | matches triangular range | none |
| F6.3 Adams v₁ degrees | p = 2, 3 | 8 (p = 2), 2p − 2 = 4 (p = 3) | correct | none |
| F6.3 Smith staircase size k_V | a = 1, 2 | (p−1)·binom(a+1,2) = p − 1, 3(p − 1) = |λ| | matches λ_i = (a+1−i)(p−1) | none |
| F6.3 T_t parity count at p = 2 | t = 1, 2 | |x| = 2^t − 1 odd; x^j, j < 2^t: 2^(t−1) even and odd degrees each: 1/1, 2/2 | as stated | none |
| F6.3 seed B_2^(2p^n) operations | k = 1, i = 0, odd p | Q₀(yx) = x^2; P_t^0(x^k) = k x^(k+p^t−1): P_1^0(x) = x^p | nontrivial on yx and x | none |
| F6.5 K(n)^*(BC_p) | [p](x) = v_n x^(p^n) | x^(p^n) = 0 in K(n)^*[[x]]/([p](x)) since v_n is a unit; Euler inversion ⇒ 0 | Tate vanishing for K(n) | none |
| F6.6 telescoping identity | q = 2, 3 | (Π − n)(Π + n) = Π² − n² = Π²; (Π − n)(Π² + Πn + n²) = Π³ − n³ = Π³ when n^q = 0 | identity holds; Lean lemma (line 72) is its module form | R05 (delete from Lean, keep in README) |
| F6.6 nilpotency bound q = 1 + dim C | d = 0, 1 | filtration ≥ 1 classes on a 0-dimensional C are 0 (q = 1); on a 1-dimensional C, n² has filtration ≥ 2 > 1 | correct | none |
| `exists_unique_normalized_exponentTwo_logarithm` | F = 𝔾ₐ over 𝔽₂ (nsmulSeries 2 = 2X = 0) | g = X satisfies all four conditions; pin's theorem gives uniqueness | true, and a pinned theorem | R02/R05 |
| `formalNSeries` | n = 0, 1, 2 | 0, F(0,X) = X, F(X,X); equal to `nsmulSeries` for all n (probe) | duplicate carrier | R02 |
| `isSMulRegular_sub_of_pow_eq_zero` | a = 1, b = 0 (q = 1); a = 0, b nilpotent | 1 − 0 regular ✓; 0 not regular so hypothesis fails ✓; a = 2, b = 0 over ℤ/4: 2 not regular, hypothesis fails ✓ | true, no roadmap object | R05 |
| README line 31 supply direction | depcheck on head and on scratch copy without TB edges | 2 problems → 0 problems | cycle is the TB edge | R01 |

## Not verifiable

- Devinatz–Hopkins–Smith §§1–3 (`dhs-nilpotence-i`, uncertified, JSTOR), Propositions 3.27, 3.33, Lemma 3.35 cited at README lines 724–740: cited by locator only.
- Quillen, Elementary proofs (`quillen-elementary`, uncertified, Elsevier): cited by locator only.
- Johnson–Wilson, Math. Z. 144 (1975), Proposition 4.14 (README line 2009) and Würgler, Theorem 2.16 and Remark 6.19: Springer, paywalled, not in the manifest; not read.
- Hovey–Strickland, Memoirs AMS 666, Proposition 7.10(e) (README line 1726): paywalled, not in the manifest; not read.
- Carrick–Davies–van Nigtevecht arXiv 2412.01640v2 §3, Nikolaus–Scholze arXiv 1707.01799 §I.3 and Appendix A, Kuhn arXiv math/0307173, Clausen–Mathew arXiv 1608.02063 §2, Symonds (EMS), Lurie HTT and HA (author page), Ravenel's orange book and Hopkins–Smith (author page): legal copies exist but are not in the manifest and were not fetched in this review (R11); their numbered locators were not checked.
- The books cited without locators (Adams; Wilson; Lubin–Tate; Landweber–Ravenel–Stong; Hovey; Greenlees–Sadofsky; Hovey–Sadofsky): nothing specific to check.

## Source issues

- none
