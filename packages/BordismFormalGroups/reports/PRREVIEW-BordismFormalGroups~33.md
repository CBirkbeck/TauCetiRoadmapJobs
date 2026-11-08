# Review of BordismFormalGroups (pull request #1808 at 6931121)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since d1a45bf: `TauCetiRoadmap/BordismFormalGroups/README.md` and `Suggested.lean` are byte-identical to the head the previous review read (same md5 at both heads; `git diff --stat d1a45bf HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty). The only change since then is in `TauCetiRoadmap/ComplexKahlerGeometry/`, which this folder does not cite. Against main the folder still differs by the F6.5 cut (44 insertions, 854 deletions in the README; `Suggested.lean` as on main). The gate at this head still fails with the same counts (`depcheck=2 imports=1 mathlib-subimports=4 no-import-mathlib=1 blob=1 prnum=1 tex=11 dropped=4 outside-folder=2`, `build=0`), so every failing check is again a finding, and none of the twelve findings of the previous report is repaired in the folder. One (R11) is partly repaired on the board side only. Each is written again below, with its witness re-verified at this head.

## R01 (P1) — Supply cycle BordismFormalGroups → TangentialBordism → StringOrientation → BordismFormalGroups

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` line 31 ("TangentialBordism supplies geometric cycles and the Pontryagin–Thom comparison, and owns the integral unoriented/oriented/Spin coefficient calculations"), with the consuming clauses at lines 173, 189, 206, 242, 273, 464, 748, 1007, 1952 and 1966.

Claim: TangentialBordism is a supplier of F2, F4 and F6.2–F6.3.

Witness: the dependency check on this head prints `UPWARD: BordismFormalGroups (on main) -> TangentialBordism (#14) at README lines [31]` and `CYCLE among: BordismFormalGroups, StringOrientation, TangentialBordism` (`depcheck: 230 roadmaps, 2329 edges, 2 problem(s)`). TangentialBordism (pull request #942, `README.md` lines 35 and 310) consumes StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3; StringOrientation (pull request #948, `README.md` lines 85, 249, 1160, 1199) consumes BordismFormalGroups F3–F5. This roadmap is on main and TangentialBordism is still a pull request, so the edge is also upward.

Repair: remove every supplier edge to TangentialBordism and own the inputs here or cite them from main: the mod-p Steenrod algebra and the HF_p-based Adams towers (F2 already constructs the MU instances at every prime, the Milnor primitives, the exterior change of rings and the dual Steenrod algebra comparison), the MO_* coefficient ring (F2 already proves the universal exponent-two ring is MO_*), and the geometric MU comparison, which TangentialBordism's own head (#942, lines 21 and 57) leaves to this roadmap. State at line 31 that TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient rings. Tested in the previous round: on a copy of the README with the TangentialBordism edges rewritten to F2, the same dependency check printed `0 problem(s)`. The head of pull request #1854 for this folder already makes this ownership move (its lines 28–44, re-read at this round: "This roadmap owns the mod-p Steenrod algebras and HF_p-based Adams towers, the unoriented coefficient ring MO_*, … TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient rings"); carry that version rather than restating it (see R10).

## R02 (P2) — The acceptance test states nothing the finished roadmap is tested against, and omits a statable headline

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 6–10 (module docstring), 17–66.

Claim: `Suggested.lean` states the roadmap's headline theorems against the pins and names the unstatable ones.

Witness: every `sorry`'d statement is a theorem of the pinned Tau Ceti (2fd255d9), restated on a duplicate carrier. Re-run this round on a scratch copy of the file with the header replaced by `import Mathlib` plus the NSMul and Logarithm modules, and every `sorry` replaced by one pinned term, it elaborates with no error and no warning: `formalNSeries_constantCoeff` by `rw [formalNSeries_eq_nsmul]; exact F.constantCoeff_nsmulSeries n`, `formalNSeries_one` by `exact F.nsmulSeries_one`, `formalNSeries_coeff_one` by `rw [formalNSeries_eq_nsmul]; exact F.coeff_one_nsmulSeries n`, `exists_unique_normalized_exponentTwo_logarithm` by `rw [formalNSeries_eq_nsmul] at hexponent; exact F.existsUnique_logarithm_of_nsmulSeries_eq_zero Nat.prime_two hexponent` (`TauCeti/RingTheory/FormalGroup/Logarithm/InfiniteHeight.lean` line 249), and in addition `formalVariable F = F.tautologicalPoint` by `rfl` and `formalNSeries F n = F.nsmulSeries n` by the file's own `formalNSeries_eq_nsmul` (`nsmulSeries` is `(n • F.tautologicalPoint).val`, `TauCeti/RingTheory/FormalGroup/NSMul/Basic.lean` line 93). Meanwhile the F1 headline "two one-dimensional commutative formal groups over a separably closed field of characteristic p are isomorphic precisely when their heights agree" (README lines 139–142) is statable at the pins (`@FormalGroup.height : {K : Type} → [Field K] → FormalGroup K → ℕ → ℕ∞` and `@TauCeti.FormalGroupIso.height_eq : … (e : TauCeti.FormalGroupIso F G) (p : ℕ), F.height p = G.height p`, both `#check`ed this round at the pin, `Height/Basic.lean` lines 205 and 346; the string `IsSepClosed` occurs in no file of the pinned `TauCeti/RingTheory/FormalGroup/` tree) and is absent. The docstring names no unstatable headline.

Repair: delete the eight declarations (R05); state the height classification over a separably closed field of characteristic p as the one statable headline (hypotheses `[Field K] [IsSepClosed K] [CharP K p] [Fact p.Prime]`, `[F.IsComm] [G.IsComm]`, conclusion an isomorphism exists exactly when `F.height p = G.height p`, in a form the statement-hygiene scanner accepts rather than a bare `Nonempty` of an isomorphism type); write the module docstring in the required form, listing each unstatable headline and the carrier it lacks (MU and the stable category from GeneralizedCohomology G2, BP, K(n), the Lubin–Tate deformation functor).

## R03 (P2) — F1 plans, and F2 partly plans, what the pinned Tau Ceti already proves, and cites the library by stale pinned links

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 18–25 (Mathlib pull requests #38213, #36167, #41710 as "proposed designs"), 50 and 93 (links into the Tau Ceti repository at commit 1844920e), 70–83, 99–125, 128–134, 201–206.

Claim: the Lazard ring with its graded universal property and polynomial theorem, the any-ring cocycle lemma, the indecomposables, the coordinate-change Hopf algebroid, the exponent-two logarithm with its bundled strict isomorphism, height and its coordinate independence are targets to construct.

Witness, at the pin 2fd255d9 (unchanged since the previous round): `TauCeti.LazardRing` and `LazardRing.gradedLift` (`LazardRing/Basic.lean` lines 232, 463), `LazardRing.mvPolynomialEquiv` (`LazardRing/Polynomial.lean` line 112), `existsUnique_eq_smul_lazardCocycle` (`SymmetricCocycle/Classification.lean` line 420), `LazardRing.cotangentBasis` (`LazardRing/Indecomposable.lean`), `LazardRing.coordinateChangeLift` (`CoordinateChange/Lazard.lean`), `exponentTwoLog`, `eq_exponentTwoLog`, `exponentTwoLogHom`, `exponentTwoExpHom` (`ExponentTwo/Basic.lean` lines 64–120, `ExponentTwo/Iso.lean` lines 72–119), the graded form (`ExponentTwo/Graded.lean` lines 73, 130), the universal exponent-two ring (`ExponentTwo/Lazard.lean`, `ExponentTwo/CoordinateChange.lean`), `FormalGroup.height`, `FormalGroupIso.height_eq` (`Height/Basic.lean` lines 205, 346), `TauCeti.FormalGroupHom`, `TauCeti.FormalGroupIso`, `FormalGroupIso.IsStrict` (`Hom.lean` line 433), `FormalGroup.addInvX`, `FormalGroup.TopNilpotentPoint`. The README cites only the NSMul and Logarithm modules, by links pinned to an older Tau Ceti commit.

Repair: in the carriers paragraph and F1, cite these declarations by module and name as consumed, and keep as targets only what is not at the pin (the separably-closed height classification, base-change naturality of the exponent-two isomorphism if absent, F2's identification of the universal exponent-two ring with MO_*). Replace the three Mathlib pull-request links and the two commit-pinned Tau Ceti links by module names. The head of pull request #1807 for this folder (its lines 14–25, re-read this round) already names this tree and says "nothing it provides is planned again"; carry that version rather than restating it (R10).

## R04 (P2) — HomotopySpheres, a roadmap on the never-cite list, supplies the James construction and the Toda brackets

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 14–16 ("HomotopySpheres section references use the §3C/§9 specification at 34167306… in PR284"), 332 ("Consume HomotopySpheres Stage3C's three-fold Toda brackets on pointed spaces"), 669 ("HomotopySpheres 3B's actual James stages J_jS^(2r)"), 708, 1961.

Claim: HomotopySpheres 3B/3C supply the James stages, the James–Hopf length-two map and the pointed three-fold Toda brackets that F4 and F6.2's nilpotence proof use.

Witness: the brief forbids citing HomotopySpheres; the gate prints four `dropped` hits (lines 14, 15, 332, 669). Within the permitted supply graph these inputs have no owner. Lines 14–16 are also the gate's `blob` hit (a link into the roadmap repository pinned to a commit) and its `prnum` hit ("PR284").

Repair: delete lines 14–16; own the James construction J(Y) with its stages J_jS^(2r), the James–Hopf maps H_j (F6.2 item 3 already constructs them "for every j ≥ 1") and the three-fold Toda brackets of pointed spaces in F4, or cite them from AlgebraicTopology where that roadmap states them. The head of pull request #1854 for this folder already owns "the three-fold Toda brackets of pointed spaces and the James construction" and says "HomotopySpheres consumes F4's Toda brackets and F6.2's James construction" (its lines 35–42); carry that version (R10).

## R05 (P3) — Padding: every declaration of `Suggested.lean` is deletable

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 17–81.

Claim: the eight declarations are the roadmap's acceptance test.

Witness: `formalNSeries`, `formalVariable` duplicate pinned carriers (R02); `formalNSeries_eq_nsmul` (line 26) is proved in place and restates the pinned definition of `nsmulSeries`; `formalNSeries_constantCoeff`, `formalNSeries_one`, `formalNSeries_coeff_one` (lines 36–47) and `exists_unique_normalized_exponentTwo_logarithm` (line 53) each close by one pinned term (the probe of R02, elaborated this round); `isSMulRegular_sub_of_pow_eq_zero` (line 72) is a proved lemma about free variables of a ring and a module with no object of the roadmap in it (its README form is the F6.6 identity `eν · Σ_(i=1)^q Π^(q−i) n^(i−1) = Π^q`, line 1843, which the README keeps).

Repair: delete all eight from `Suggested.lean`; the README keeps the n-series facts as consumed pinned declarations and the nilpotent-perturbation identity as the F6.6 Check it already is.

## R06 (P3) — README and Lean disagree on names

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 592 (`muSmashNilpotence`), 596 (`muSelfMapNilpotence`), 600 (`muHurewiczNilpotence`), 497 (`gradedComoduleFilteredPresentation`), 902 (`muPtypicalRingComparison`), 1251 (`muPtypicalPolynomialCoefficientIso`), 1421 (`moravaStabilizer_cohomology_vanishing`), 1787 (`torusFiniteCellMappingEulerComparison`), 1796 (`momentNormalMU_eulerPrecomposition_injective`), 1825 (`finiteProductCircleCharacters`), 1872 (`muPtypicalFiniteCohomologyComparison`), 1912 (`momentStratumExtension_nullhomotopy`).

Claim: a backticked Lean-style name of this roadmap's own is declared in `Suggested.lean`.

Witness: none of the twelve is declared there, and none of the eight names `Suggested.lean` declares appears in the README (unchanged files, `grep` count 0 for each).

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

Witness: `git diff --stat origin/main...HEAD` outside the fifteen named folders lists these two one-line rewordings at this head ("`LFunctions` consumes this package and supplies its own character-specific continuation"; "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer"); the gate prints `outside-folder (2)`.

Repair: revert both lines here (and move them to a pull request on those roadmaps if wanted; the second reads "consumed by … and consumed by").

## R10 (P3) — Two other open pull requests rewrite this README differently; the order with #1854 is not stated and the description omits this folder

Location: the pull request description (merge-order paragraph, re-read this round: "#1101 (ModularCurves) → #1807 (the other loops) → this pull request"); `TauCetiRoadmap/BordismFormalGroups/README.md` lines 14–44 and 1541–1558.

Claim: the change to this folder is consistent with the other open pull requests that change it.

Witness: against main (2824 lines) this head changes lines 30 and 1541–2824 (the F6.5 cut). The head of #1807 makes the same F6.5 cut and in addition rewrites lines 14–25 (the Tau Ceti tree, R03), 30–36, 48–143 (F2) and more; the head of #1854 makes the same cut, deletes the HomotopySpheres lines 14–17 (R04) and rewrites lines 28–44 to own the Steenrod/Adams carriers and MO_* and to make TangentialBordism a consumer (R01). `scratch/overlaps.md` lists both as conflicting with this pull request. #1854 is not named in the merge-order paragraph, and the description does not mention BordismFormalGroups.

Repair: name the order relative to #1854 in the merge-order paragraph, and carry this folder as the predecessor leaves it instead of restating the F6.5 cut (if #1807 merges first, this pull request's version of the folder adds nothing; if it merges first, #1807 and #1854 must be rebased over it). Say in the description what this pull request does to this folder.

## R11 (P3) — Cited works not recorded in the manifest, and claims without locators

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1994–2014 (references: Adams; Landweber–Ravenel–Stong; Wilson; Hovey, MString; Hopkins–Smith; Hovey–Strickland), 385, 428–432, 778, 1419, 1726.

Claim: every cited work is recorded in `sources.toml` and every theorem has an exact locator.

Witness: the board's manifest now records twenty-four works (fifteen added since the previous round: Lubin–Tate, Toda, Ravenel's orange book, Greenlees–Sadofsky, Kuhn, Würgler, Clausen–Mathew, Nikolaus–Scholze, Lurie HTT and HA, Carrick–Davies–van Nigtevecht, Bauer, Hovey–Sadofsky, Johnson–Wilson, Symonds), so that part is repaired. Six works of the reference list still have no key: Adams, Landweber–Ravenel–Stong, Wilson, Hovey (MString), Hopkins–Smith, Hovey–Strickland (compared author by author against the manifest's `authors` fields). The README is unchanged: apart from the handful at lines 385, 428–432 and 1726, the theorems of F1–F6 carry no theorem or page locator (Lazard's theorem, Quillen's theorem, Landweber's exact functor theorem, the smashing theorem, the Johnson–Wilson comparison at line 778, the Morava stabilizer dimension at line 1419).

Repair: record the six remaining works with one key each and `cited_for`; add a locator (theorem number and page, into a legally readable text or `uncertified` by DOI) at each theorem.

## R12 (P3) — README shape: no supplier contracts, no Checks, no per-target Needs lines

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` throughout; the definitions at lines 470 (invariant ideal), 579 (Bousfield class), 983 (type), 992 (v_n self-map), 1017 (strong and partial type), 1375 (E-nilpotent spectra).

Claim: the README has the TauCetiRoadmap form.

Witness: there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build` section; no definition has a `**Checks.**` list (the only negative controls are prose remarks such as the Moore-boundary test at line 641 and the ungraded prime (p, v₁−1) at line 477); no target has a `*Needs:*` line, so one supplier paragraph ("Order and references", lines 1936–1992) covers hundreds of theorems with different needs. This predates the pull request.

Repair: add the four sections (the supplier contracts naming the pinned declarations of R03 and the sections of GeneralizedCohomology G2–G5 and G2.11, EllipticCurves, ProfiniteCohomology, SchurWeyl, DGAInfinity, DGFloer, CompactGroups, ConvexityToric, GeometricTopology, AlgebraicTopology, CharacteristicClasses, TopologicalKTheory consumed); give each definition three discriminating Checks (for the Bousfield class: ⟨Hℚ⟩ versus ⟨S⟩, ⟨K(n)⟩ ∧ ⟨K(m)⟩ = 0 for n ≠ m, ⟨B(n)⟩ = ⟨K(n)⟩; for type: S_(p), S/p, 0; for strong type n at p = 2 versus odd p); give each theorem a `*Needs:*` line.

## Previous findings

- R01 — not repaired: line 31 still reads "TangentialBordism supplies geometric cycles and the Pontryagin–Thom comparison"; the dependency check still prints the UPWARD and CYCLE lines.
- R02 — not repaired: `Suggested.lean` is unchanged; the four sorried theorems still close by one pinned term each; the height classification is still absent.
- R03 — not repaired: lines 18–25 still cite the three Mathlib pull requests and lines 50, 93 the commit-pinned Tau Ceti links.
- R04 — not repaired: lines 14–16, 332, 669 still cite HomotopySpheres; the gate still prints `dropped (4)`, `blob (1)`, `prnum (1)`.
- R05 — not repaired: the eight declarations are still in the file.
- R06 — not repaired: the twelve backticked names are still at the same lines and still undeclared.
- R07 — not repaired: lines 1–4 are still the four `Mathlib.<submodule>` imports.
- R08 — not repaired: the eleven `tex` hits are still at lines 1534–1911.
- R09 — not repaired: the two outside-folder one-line edits are still in the diff against main.
- R10 — not repaired: the merge-order paragraph still reads "#1101 → #1807 → this pull request" and names neither #1854 nor this folder.
- R11 — partly repaired: the board manifest grew from nine to twenty-four keys; six works of the reference list still lack a key, and the README's locator-less theorems are unchanged.
- R12 — not repaired: the README still has none of the four sections, no Checks lists and no Needs lines.

## Verified sound

**Scope of this round.** The folder changed by 0 lines since d1a45bf (md5 of both files equal at d1a45bf and 6931121); the files changed outside it since then are `TauCetiRoadmap/ComplexKahlerGeometry/README.md` and `Suggested.lean`, which this README does not cite (grep count 0 for ComplexKahlerGeometry). Nothing in the folder was re-reviewed beyond re-verifying each previous witness; the full review of the unchanged text stands as the previous report left it.

**Gate and build.** The worker's gate at this head: `build=0 sorry-data=0 set_option=0 statement-hygiene=0 stray-files=0 readme-ids-missing=0`, failing on `depcheck=2 imports=1 mathlib-subimports=4 no-import-mathlib=1 blob=1 prnum=1 tex=11 dropped=4 outside-folder=2`. `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at the pins: four `declaration uses sorry` warnings (lines 36, 41, 46, 53), nothing else. Dependency check this round: `UPWARD: BordismFormalGroups (on main) -> TangentialBordism (#14) at README lines [31]`, `CYCLE among: BordismFormalGroups, StringOrientation, TangentialBordism`, `depcheck: 230 roadmaps, 2329 edges, 2 problem(s)`. The eight elaborated signatures in the worker's list match the file; no section binder is dropped.

**Probes elaborated this round at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), `sorry` nowhere, no error, no warning:** the scratch copy of `Suggested.lean` described in R02 (every `sorry` replaced by one pinned term after the file's own `formalNSeries_eq_nsmul` rewrite), plus `formalVariable F = F.tautologicalPoint` by `rfl` and `formalNSeries F n = F.nsmulSeries n`. `#check @FormalGroup.height` and `#check @TauCeti.FormalGroupIso.height_eq` print the types quoted in R02.

**Seeded sample.** "The smoothing-and-triangulation comparison", item 1 "Smooth implies PL", is GeometricTopology's section on main (`TauCetiRoadmap/GeometricTopology/README.md` lines 930 and 938–943): every smooth manifold has an essentially unique PL structure by a smooth triangulation (Whitehead 1940; Munkres 1966). F6.6 (README lines 1772–1775) uses it only to obtain a finite CW model of a compact smooth manifold, "using the locally finite smooth triangulation and compactness, followed by AlgebraicTopology's manifold-to-abstract-CW comparison", which a finite smooth triangulation gives. Supported as written; unchanged since the previous round.

**Cross-roadmap citations re-resolved this round (8).** GeneralizedCohomology G2.11 at this head's `GeneralizedCohomology/README.md` line 669 (G2 item 11, "Enriched, quasicategorical and monoidal foundations"), absent on main (0 mentions); cited by this README at lines 30, 1543, 1560, 1571, 1581, 1585, 1605, 1610, 1943, 1979. TangentialBordism (#942) lines 21, 35, 53, 57 (BordismFormalGroups as owner of the formal laws and the geometric MU comparison) and 310 (supplier-table row consuming StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3); StringOrientation (#948) lines 85, 249, 1160, 1199 consuming F3–F5; the #1854 head of this folder lines 26–46 and the #1807 head lines 12–26 (quoted in R01, R03, R04). The twenty-five citations resolved in the previous report are in unchanged text and were not re-resolved.

**Overlaps.** `scratch/overlaps.md`: no id this README cites is dropped by an open pull request; no id this pull request drops is cited elsewhere; G2.11 is "defined only by an open revision" (#1807, #1854), but this pull request's own head defines it (line 669 above), so it is not a finding; the two conflicting pull requests #1807 and #1854 are R10.

**Ownership against open pull requests.** As in the previous report: ChromaticHomotopyTheory (#1643) and GeneralAlgebraicKTheoryPartII (#1742) consume this roadmap and own nothing it states; unchanged text, not re-read. Pull requests without files here were not checked.

**Adversarial table.** The folder's statements are unchanged; the rows below are carried from the previous report (PRREVIEW-BordismFormalGroups~30) and the three Lean rows were recomputed by the probe this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| F1 cocycle lemma: d_n, C_n integral (r30) | n = 2, 3, 4, 6 | d_2 = d_4 = 2, d_3 = 3, d_6 = 1; C_2 = XY, C_4 = 2X³Y + 3X²Y² + 2XY³, C_6 = (X+Y)⁶ − X⁶ − Y⁶ | integral, matches "p at prime powers, 1 otherwise" | none |
| F1 "C_(2^k)(X,X) has odd coefficient" (r30) | n = 2, 4, 8 | C_n(X,X) = (2^(n−1) − 1)Xⁿ: 1, 7, 127 | odd | none |
| F1 exponent-two normalization a_(2^k−1) = 0 ⇔ coeff X^(2^k) = 0 (r30) | k = 1, 2 | coefficients of X², X⁴ vanish; Lean `coeff (2^k) g = 0` | agree with pin's `coeff_two_pow_exponentTwoLog` | none |
| F1 additive series over 2 = 0 (r30) | h = X², X³, X + X² | (X+Y)² − X² − Y² = 2XY = 0; (X+Y)³ − X³ − Y³ = X²Y + XY² ≠ 0; constant term forced 0 | iff holds on these | none |
| F2 K-theory law x_K(L) = u⁻¹([L⁻¹] − 1) (r30) | L, M lines | F_K = x + y + uxy; degrees 2 = 2 = −2 + 4 | consistent | none |
| F2 Milnor primitive degrees (r30) | p = 2: i = 0, 1; odd p: i = 0, 1 | 2^(i+1) − 1 = 1, 3; 2p^i − 1 = 1, 2p − 1 | correct | none |
| F4 triple bracket degree and indeterminacy (r30) | r = 3 vs general | Σ|a_i| + 1 both ways | r = 3 case recovered | none |
| F5 ungraded invariant prime (p, v₁ − 1) (r30) | η_R(v₁) = v₁ + p t₁ | v₁ − 1 ↦ v₁ − 1 + p t₁ ∈ (p, v₁ − 1)Γ; not homogeneous | correct negative control | none |
| F6.2 Moore-boundary test (r30) | S →p S → M(p) →δ ΣS | MU_*δ = 0; H_1(M(p);𝔽_p) → H_0(S;𝔽_p) iso; δ^(∧r) ≠ 0 | MU∧f is the right hypothesis | none |
| F6.2 vanishing-line slopes equal at p = 2 (r30) | r, k arbitrary | 2r·2^k − 1 = r·2^(k+1) − 1 | equal | none |
| F6.3 degree bookkeeping |σ^nE| = c_E d_n + a_E (r30) | n = 1, E = (e₂ = 1) | |v₂| = (p+1)(2p−2), b_E = p+1, a_E = 0, c_E = p; |t₁^p| = p(2p−2) | equal | none |
| F6.3 diagonal r_(σ^nE)(v^E) ≡ v_n^(Σe_i) mod I_n (r30) | n = 1, E = (e₂ = 1) | η_R(v₂) ≡ v₂ + v₁t₁^p − v₁^p t₁ mod p; coefficient of t₁^p is v₁ | matches | none |
| F6.3 Adams v₁ degrees (r30) | p = 2, 3 | 8, 4 | correct | none |
| F6.3 Smith staircase size k_V (r30) | a = 1, 2 | p − 1, 3(p − 1) = |λ| | matches | none |
| F6.3 T_t parity count at p = 2 (r30) | t = 1, 2 | |x| = 2^t − 1 odd; even/odd degrees 1/1, 2/2 | as stated | none |
| F6.3 seed B_2^(2p^n) operations (r30) | k = 1, i = 0, odd p | Q₀(yx) = x²; P_1^0(x) = x^p | nontrivial | none |
| F6.5 K(n)^*(BC_p) (r30) | [p](x) = v_n x^(p^n) | x^(p^n) = 0 since v_n is a unit; Euler inversion ⇒ 0 | Tate vanishing for K(n) | none |
| F6.6 telescoping identity (r30) | q = 2, 3 | (Π − n)(Π + n) = Π²; (Π − n)(Π² + Πn + n²) = Π³ when n^q = 0 | holds; Lean line 72 is its module form | R05 |
| F6.6 nilpotency bound q = 1 + dim C (r30) | d = 0, 1 | q = 1 on a point; n² has filtration ≥ 2 > 1 on a 1-complex | correct | none |
| `exists_unique_normalized_exponentTwo_logarithm` (recomputed) | F = 𝔾ₐ over 𝔽₂; general F with 2 = 0 | g = X satisfies all four conditions; one pinned term closes the general statement (probe, no warning) | true, and a pinned theorem | R02/R05 |
| `formalNSeries` (recomputed) | n = 0, 1, 2; general n | 0, X, F(X,X); `formalNSeries F n = F.nsmulSeries n` by the file's own lemma (probe) | duplicate carrier | R02 |
| `isSMulRegular_sub_of_pow_eq_zero` (recomputed from r30) | a = 1, b = 0 (q = 1); a = 0, b nilpotent; a = 2, b = 0 over ℤ/4 | 1 − 0 regular; 0 not regular, hypothesis fails; 2 not regular, hypothesis fails | true, no roadmap object | R05 |
| README line 31 supply direction (recomputed) | depcheck on this head | 2 problems (UPWARD, CYCLE) | cycle is the TB edge | R01 |

## Not verifiable

- Devinatz–Hopkins–Smith §§1–3 (`dhs-nilpotence-i`, uncertified), Propositions 3.27, 3.33, Lemma 3.35 cited at README lines 724–740: cited by locator only.
- Quillen, Elementary proofs (`quillen-elementary`, uncertified): cited by locator only.
- Johnson–Wilson Proposition 4.14 (`johnson-wilson-1975`, uncertified) and Würgler Theorem 2.16, Remark 6.19 (`wurgler-1976`, uncertified): cited by locator only.
- Hovey–Strickland, Memoirs AMS 666, Proposition 7.10(e) (README line 1726): paywalled, not in the manifest (R11); not read.
- Greenlees–Sadofsky (`greenlees-sadofsky`, uncertified), Toda (`toda-1962`, uncertified), Symonds (`symonds-permutation`, uncertified): cited by locator only.
- The works now cached since the previous round (Lubin–Tate, Ravenel's orange book, Kuhn, Clausen–Mathew, Nikolaus–Scholze, Lurie HTT and HA, Carrick–Davies–van Nigtevecht, Bauer, Hovey–Sadofsky): their numbered locators are in text the previous review passed and were not checked in this incremental round.
- The books cited without locators (Adams; Wilson; Landweber–Ravenel–Stong; Hovey, MString; Hopkins–Smith): nothing specific to check (R11).

## Source issues

- none
