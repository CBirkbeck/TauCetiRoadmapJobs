# Review of CompletedCohomologyAndLocalGlobalCompatibilityPartII (pull request #2262 at 14beba2)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 115–121 name §SR.5.2’s classical correspondence and geometric r_p. SmoothRepresentationsOfLocalGroups §SR.5.2, lines 4763–4786 at #1688, explicitly owns classical LLC and coefficient descent; the previous ownership objection does not survive that text.
- R02 — repaired: README lines 121, 272, 447, 462, 541, 565 and 603 give the corrected EP pages; line 488 also supplies EP lines 1348–1354 for the application of Proposition 6.9.
- R03 — repaired: README line 281 now says “annihilates the rational testing module”; scalar 1 annihilates neither side and scalar 0 annihilates both.
- R04 — repaired: README lines 39, 268 and 367 include Submodule.mem_iInf in the contract, §3.1 Needs and Layer 3 dependencies; the latter two also include LinearMap.mem_ker.
- R05 — repaired: The description now states that Suggested.lean has no declarations and identifies all seven unavailable headlines; it lists the 17 gaps by supplier and no longer claims a sorry warning.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Classical LLC normalization, line 115 | d=3, F=ℚ₇; diagonal uniformizer and a unit | Twist exponent −1; factors 7 and 1 respectively; inertial restriction unchanged | Consistent with geometric r_p | Owner made explicit |
| gap:crystalline-inertial-types, line 117 | d=1, order-three character χ of ℤ₇×; τ=χ or χ⁻¹ | χ(2)=ζ₃≠ζ₃⁻¹; Hom dimensions 1 or 0; parameter inertia χ, N=0 | Both directions distinguish the inverse | r_p specified |
| gap:minimal-stratum-types, line 121 | E=F=ℚ₇, m=1, n=3; π extending θ, or π=1 | H²=J²=U²; dim V=1, cardinality C=1; Hom dimensions 1 or 0, matching parameter restrictions θ or 1 | Recognition and indices agree | r_p and pages specified |
| §3.1 intersection API, lines 39, 268, 367 | Coordinate projections on O²; empty family | Intersected kernels={(0,0)}; both projections vanish exactly there; empty intersection=O² | Pinned Submodule.mem_iInf applies | Contract and dependencies completed |
| §3.2 testing construction, line 272 | H=C₂, M=O[C₂], Θ=O trivial; lattice ϖO | Integral tests O and ϖO; both rationalize to L; Hom to L has dimension 1 | Matches Schikhof construction | EP locator corrected |
| §3.2 annihilator equivalence, line 281 | Same regular-module model; a=0,1 | Test=L; scalar and precomposition maps are respectively 0, id; annihilation truth values true, false on both sides | Previous counterexample repaired | “Annihilates” replaces “acts trivially” |
| §5.3 principal-series density, line 447 | d=1, F=ℚ₃, quadratic tame character, weight 0 | N=0, inertia order 2; quadratic abelian restriction is trivial, hence crystalline; 3∤2 | Point predicates and prime range agree | Theorem 5.3 on p.365 |
| §5.4 supercuspidal density, line 462 | d=1, F=ℚ₇, unramified character with Frobenius 2 | E=F; Ind from W_F is the same one-dimensional character; N=0; 7∤2 | Induction and rank-one predicates agree | Theorem 5.3 on p.365 |
| §6.1 benign density, line 488 | d=2, f=1, Frobenius eigenvalues 1,7 | Ratios 7 and 1/7 equal p and p⁻¹; benign condition false | EP Definition 6.8 excludes both; application is EP lines 1348–1354 | Application locator added |
| §§6.2–6.3 prescribed-type consequences | Rank one, F=ℚ₃(ζ₃); three consecutive algebraic powers; zero test | Torsion values 1,ζ₃,ζ₃² exhaust three characters; zero test has Ann=R and V(R)=∅ | Nonzero type and varying weights remain essential | Uses clarified type contract |
| §6.4 minimal-stratum predicate, line 541 | E=ℚ₇(√7), α=(√7)⁻³ or (√7)⁻⁴ | gcd(2,3)=1 and normalized residue 1 generates 𝔽₇/𝔽₇; gcd(2,4)=2 rejects the second | Minimality distinguishes the two | EP §§5.3–5.4 pages corrected |
| §6.5 minimal-stratum density, line 565 | Same degree-two extension; m=1, depths 3,5 | 7∤4; e=2 prime to 7; 3,5>2; both gcds with 2 equal 1 | Tame and depth hypotheses agree | Theorem 5.3 on p.365 |

The adversarial rows for untouched statements stand as in the previous review of `1a53e38`.

- Source loci read: 19 across EP, CEGGPS and BIP; corrected EP theorem, section and lemma pages match the text, including EP lines 816–843, 1116–1125, 1185–1209 and 1348–1354.
- Pinned Mathlib declarations reopened: 5 — Submodule.mem_iInf (`Mathlib/Algebra/Module/Submodule/Lattice.lean:238`), LinearMap.ker/mem_ker (`Mathlib/Algebra/Module/Submodule/Ker.lean:59`), Module.annihilator/annihilator_eq_bot (`Mathlib/RingTheory/Ideal/Maps.lean:869`, line 901).
- Supplier audit: 0 unresolved cross-roadmap citations from the resolver; classical LLC ownership checked directly against #1688 §SR.5.2 and #999 §10.30; parent §§5.1–5.3 retain the patched objects. All 17 gap slugs agree with design/plan.json; the two clarified type gaps retain their named owner.
- Gate: every scanner passed; targeted build succeeded without warnings. Dependency output: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Direct Lean elaboration: exit 0, no warnings; 0 declarations, hence 0 signatures or one-tactic probes. The unchanged docstring names all seven headlines and their missing carriers.
- PR text: 0 contradicted claims or omitted scope changes; 0 files changed outside this folder; no headings or Lean declarations removed or renumbered.
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, HilbertModularVarietiesAndShimuraCurvesPartII, CompletedCohomologyPartII, PotentialAutomorphyInfrastructurePartII; M∞, capture and benign loci belong to the parent, completed towers/duality to their named suppliers, rank-two benign density to PadicLocalLanglandsForGL2Qp §3.6a, and general local density here; no new competing owner.
- Source independence: changed passages only; 9 passages compared with 3 sources, no copied expression or reused material found; largest share EP, 78 of 240 explicitly source-labelled locators. No layer added, removed or reordered; the previous EP contents comparison stands.

## Not verifiable

- The previous extraction ambiguity at EP lines 883 and 899 (strict versus non-strict depth inequality) remains; the changed contract retains the stricter n>2m range.

## Source issues

- **Error** in EP at Proposition 3.25, p. 358: the source says depth-n type counts grow like q_E^n at every depth; it should be restricted to depths admitting a minimal element, with zero count otherwise; affects a stated result.

## For the human reviewers

- The five departures from published sources recorded in the previous review remain at `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` lines 57, 59, 121, 375 and 592; a specialist may wish to confirm those corrections.
