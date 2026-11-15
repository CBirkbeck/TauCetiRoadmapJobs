# Review of AlgebraicTopologyPartII (pull request #1694 at ed88288)

**Verdict:** needs changes

## R01 (P3) — The description leaves out the Layer 16 stratification strand

**Location:** Pull request description.
- The `<!-- roadmap-summary -->` block: "A third strand treats C₂-equivariant cohomology of real and complex loci, reaching … the integral trace lift and circle obstruction for ramified covers."
- The prose that follows: "Extend AlgebraicTopology with … equivariant topology of real loci and ramified covers."

**Claim:** The text describes the port head (1b3853b3), where Layer 16 had no stratified foundations. At this head the roadmap owns §§16.1a–16.1e, and StratifiedSpacesAndTameTopology consumes them from here. The description says neither.

**Witness:**
- README line 7 claims §§16.1a–16.1e.
- `Suggested.lean` lines 236–524 hold 17 of the 38 declarations. The port head had 21, none of them in Layer 16.
- StratifiedSpacesAndTameTopology README line 46 consumes §§16.1a–16.1e.

**Repair:** Three edits.
1. In the summary block, after the third strand, add: "A fourth strand owns the stratified foundations of equivariant transport (§§16.1a–16.1e). These are smooth and Whitney stratifications, Thom–Mather control data with Mather's existence theorem, controlled vector fields and their flows, and Thom's first isotopy lemma (`firstIsotopyLemma`). The strand ends in equivariant Ehresmann and stratified-pair transport (`equivariantEhresmannTransport`, `equivariantStratifiedTransport`). StratifiedSpacesAndTameTopology consumes these sections."
2. In the prose, after "ramified covers", insert ", and the Thom–Mather stratification theory behind equivariant transport".
3. In the AI-assistance sentence, after "(Fable and Astra);", insert: "Layer 16's 17 Lean declarations, together with the stratified foundations §§16.1a–16.1e previously cited from StratifiedSpacesAndTameTopology, were added in this pull request after the port;".

## R02 (P3) — The description credits this roadmap with the semialgebraic specialization

**Location:** The summary block: "The real-locus strand works on the finite-cover semialgebraic site … and specializes the generic equivariant sheaf theory of SchemeAndStackFoundations rather than building a parallel derived category."

**Claim:** At this head, three things are consumed from MotivesAndAlgebraicCycles §§7.6a–7.6b, which carries nine of the declared gaps:
- the site;
- its specialization of SchemeAndStackFoundations §2.23;
- the singular and Borel comparisons.

The description names neither that supplier nor the fact that these are consumed.

**Witness:**
- README line 13: "MotivesAndAlgebraicCycles §§7.6a–7.6b owns their semialgebraic cohomology, orientation and purity specialization; this roadmap proves the additional fixed-locus and cover formulas".
- Line 233: the comparison is "consumed directly from §7.6a".

**Repair:** Replace the sentence with: "The real-locus strand works on the finite-cover semialgebraic site over an arbitrary real closed field. It consumes that site from MotivesAndAlgebraicCycles §§7.6a–7.6b, which specializes the generic equivariant sheaf theory of SchemeAndStackFoundations §2.23 and supplies the singular and Borel comparisons, only over ℝ. This roadmap adds the fixed-locus and cover formulas and builds no parallel derived category."

## R03 (P3) — The dependency paragraph is incomplete and one of its sentences is false

**Location:** "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** Three defects:
- No list follows the heading.
- The README names no consumer roadmap. QWittVectors, which is not on main, is neither a supplier nor a consumer.
- The paragraph never mentions the 14 declared supplier gaps, three of which fall on roadmaps on main.

**Witness:**
- README line 22 names QWittVectors §1.4a only to separate its Witt coordinates.
- Downstream consumers (line 1725) names no roadmap.
- The 14 gap contracts (lines 100–417): MotivesAndAlgebraicCycles 9, five other suppliers 1 each.

**Repair:** Replace the paragraph with the following.

"Dependencies.
- On main: AlgebraicTopology Stages 2–8, DGFloer Layer 1 item 2, GeneralizedCohomology G2.10, SchemeAndStackFoundations §§2.5, 2.7, 2.19, 2.23, RealAlgebraicGeometry Layers 3 and 6, AffineMorseLefschetz A2–A3 and A4.1, RealAnalyticGeometry §R2.1, DifferentialGeometry Layers 2, 3, 10, GeometricTopology Layer 1, SmoothBundlesConnections §B1 item 5, CharacteristicClasses §§C2–C3, TangentialBordism §B4 item 3, StableHomotopyKTheory §§3.36–3.37 and 4.6, MorseNovikov N6.
- Open, merging first: ComplexComparisonPartII §C−1.1, EtaleDualityAndPerverseSheaves §§3.5–3.7 and 4.7, InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4 and IG.5.1, MotivesAndAlgebraicCycles §§7.6a–7.6b.
- Declared supplier gaps (14): nine on MotivesAndAlgebraicCycles §§7.6a–7.6b, and one each on SchemeAndStackFoundations §2.23, AffineMorseLefschetz A4.1, StableHomotopyKTheory §3.37, EtaleDualityAndPerverseSheaves §§3.5–3.7 and InverseGaloisAndArithmeticFundamentalGroups §IG.5.1.
- QWittVectors is named only to distinguish its Witt coordinates from the Euler exponents. It is not a dependency."

## Previous findings

- none: the review of ed88288 (r10) raised no finding of its own. It recorded r9's R01 as withdrawn and r9's R02 as repaired. With 0 changed lines, neither status changes.

## Verified sound

| Statement | Instances | Values, left side | Values, right side | Result |
|---|---|---|---|---|
| `configurationTraceFormula` (cited by the description) | q=2, m=2, χ≡1; χ=sign; q=3, m=2, χ≡1 | squarefree monic counts: 2 (x²+x, x²+x+1); 1−1=0; 9−3=6 | 4·1−2·1=2; 4·0−2·0=0; 9−3=6 (the swap is trivial on H¹(ℂ×ℂ*)) | holds |
| `stableConfigurationDiagonal` (cited by the description) | (s,N,j,d)=(0,2,2,2); (0,1,1,1) | m=2 term ½(4−2)=1, terms m≤1 are 0; m=1 term 1 | coefficient of t² in (1+t)²(1+t³) is 1; coefficient of t in 1+t is 1 | holds |
| `doubleLoopBetti` (cited by the description) | S³∨S³ (s=0, N=2), j=0..4 | Ω² is free on π₁⊗ℚ=2, π₃=1, π₅=2, giving 1,2,1,1,2 | (1+t)²(1+t³)(1+t⁵)² gives 1,2,1,1,2 | holds |
| `firstIsotopyLemma` (R01) | ℝ×[−1,1] with 3 strata, f=x; x²+y² with strata {0} and ℝ²∖0; x on xy=1 | h(x,y)=(x,(b,y)); `hsub` fails (rank 0<1); `hp` fails (unbounded preimage of [−1,1]) | stratum-preserving trivialization; fibres pt against S¹; fibre ∅ over 0, a point nearby | holds; `hsub` and `hp` are needed |
| `exists_controlData_isCompatible` (R01) | ℝ² with strata {0} and ℝ²∖0, N=pt; then f=x | T₀=ℝ², π₀=0, ρ₀=x²+y²; dρ₀=2(x,y)≠0 off 0; {ρ₀≤ε} compact | f=x: `hsub` fails at {0}; compatibility would force x=f(0)=0 near 0 | holds; `hsub` is needed |
| §6.1 supported values, consumed from MotivesAndAlgebraicCycles §7.6a (R02) | X=A¹, F=ℤ, q=1..4 | support sequence: H^q_G,ℝ(ℂ,ℤ)=0, 𝔽₂, 0, 𝔽₂ | purity: H^(q−1)(G,ℤ(1))=0, 𝔽₂, 0, 𝔽₂ | holds |
| Line 22: §3.1 exponents against QWittVectors' Witt coordinates (R03) | the series 1−2T | ∏(1−Tʳ)^(e_r) with Σ_(r∣n) r·e_r=2ⁿ gives e=2,1,2 | Witt coordinates of 1−2T: 2,0,0 | the transforms differ; QWittVectors is not a dependency |
| §16.1e locators (sampled; R01) | MATHER line 887 (Corollary 10.2, PDF p.31); line 969 (Proposition 11.1, PDF p.34) | a proper controlled submersion is locally trivial; f∣S proper plus stratumwise submersion gives (S,f,P) locally trivial | README controlled and embedded forms, with the same hypotheses | agree |

The rows for the other statements stand as in the previous review, of ed88288.

- **Gate**, run on this head: every check is 0, ending `outside-folder=0 source-material=0 OK`. The worker's gate also reports `build=0`.
- **Dependency check:** `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The merge order has this roadmap at line 231, after InverseGaloisAndArithmeticFundamentalGroups (54), MotivesAndAlgebraicCycles (93) and EtaleDualityAndPerverseSheaves (109).
- **Elaboration:** `lake env lean` gives 14 ``declaration uses `sorry` `` warnings, at lines 69, 108, 165, 174, 189, 215, 231, 250, 374, 403, 418, 472, 489 and 505, and no other message. The file is byte-identical to the one r10 read, so the r10 results for the 7 binder leads (all false) and the padding probe stand.
- **Outside the folder:** the diff touches 0 paths. Against the base, the folder diff is 3 files and 2278 insertions. That agrees with "README, `Suggested.lean`, `metadata.toml`".
- **Description claims checked against the head:** 14, with 3 findings. The 11 that hold:
  - AlgebraicTopology's eight stages (its README, lines 869–884);
  - `fullCycleType_eq_map_natDegree_normalizedFactors` (`FrobeniusOrbits.lean:106`);
  - `Representation.char_tensor` (`Character.lean:69`) and `card_inv_mul_sum_char_eq_finrank` (`Character.lean:114`);
  - permutation torsor with no inversion of m! (README line 180);
  - singular and Borel comparisons over ℝ only (line 233);
  - the six Validation counts, which match the gate.
- **History:** 10 commits follow the port 1b3853b3. `Suggested.lean` went from 21 declarations to 38; all 17 additions are in Layer 16.
- **Consumers resolved at their heads:**
  - StratifiedSpacesAndTameTopology, README lines 13 and 46;
  - ExponentialSumsAndCircleMethodPartII, line 93;
  - MixedHodgeModulesAndIrregularHodgeTheory, lines 30 and 116;
  - MorseNovikov (revision), line 2179.
- **Gaps:** there are 14 gap contracts, the same slugs and suppliers as in r10.
- **Remark on untouched text** (no change asked): the README Summary (line 3) also leaves out §§16.1a–16.1e, which line 7 claims.

Overlap check: I read the following roadmaps; the shared objects and their owners are:
- StratifiedSpacesAndTameTopology: §§16.1a–16.1e, owner this roadmap; consumed there at line 46.
- ExponentialSumsAndCircleMethodPartII: §§2.1 and 3.5, owner this roadmap.
- AlgebraicTopology and CharacteristicClasses (open revision): Stages 2–8 and §§C2–C3, owners themselves; no cited id is dropped.
- DGFloerPartII: Serre spectral sequences, owner DGFloer Layer 1 item 2.
- TangentialBordism: Wu classes, owner §B4 item 3.
- AffineMorseLefschetz: triangulation, owner A4.1.
- HomotopySpheres: nothing shared.

Source independence: changed passages only. The folder has 0 changed lines. I compared 2 passages with 1 source (the two forms of §16.1e against MATHER lines 887–905 and 963–976); nothing is shared beyond standard terms. The largest share of locators is BW, about 75 of 206. Contents were not compared again, because no layer was added, removed or reordered.

## Not verifiable

- Uncertified, cited by locator only: HILTON Theorem A, DIMCA Lemma 4, BRUMFIEL pp.163–169, SCHEIDERER Corollary 18.11, BCR Theorem 9.3.2.
- Waived: KRASNOV Theorem 2.1.
- MATHER page images could not be rendered (the PDF renderer is missing on this worker). The §16.1e locators were read through the cached OCR text only.

## Source issues

- none

## For the human reviewers

- **Licence:** MILNOR-STASHEFF is read from a copy on A. Ranicki's Edinburgh pages (`webhomes.maths.ed.ac.uk/~v1ranick/papers/milnstas.pdf`), recorded `institutional`. The book is Princeton University Press's, and the host is not one of its authors.
- **Licence:** MATHER (about 39 locators, the second-largest share) is read from the Princeton departmental scan of the 1970 notes, recorded `author-page`. The notes appeared in Bull. AMS 49 (2012), 475–506, which the README does not cite.
