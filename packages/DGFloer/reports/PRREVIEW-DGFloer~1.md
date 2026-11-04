# Review of DGFloer (pull request #963 at ec50951)

**Verdict:** needs changes

Findings cover this folder at the requested head, including inherited content. No PR file was changed.

## R01 (P1) — Supply the Serre-fibration carrier and homotopy sequence at the pins

**Location:** `TauCetiRoadmap/DGFloer/README.md:92`, :403–417: “`TauCeti.TopCat.serreFibrations`”; “by the fibration homotopy sequence”.

**Claim:** The arbitrary-base construction has these prerequisites available.

**Witness:** The identifier occurs nowhere in either pinned library; `#check TauCeti.TopCat.serreFibrations` fails. `TauCetiRoadmap/AlgebraicTopology/README.md:910–923` on main consumes that native carrier and DGFloer's homotopy LES; it does not construct them.

**Repair:** Give the carrier, pullbacks, and the Serre-fibration homotopy LES precise earlier ownership/targets or a declared supplier gap; distinguish a newer implementation from the actual pin. The LES must include the component terms needed to compare total spaces. Do not refer back to AlgebraicTopology 5.5 for its own inputs. For the test fibration ℝ→S¹, the repaired LES must contain ℤ→ℤ→0 at the fundamental-group/fibre-component boundary, and its CW pullback comparison must apply. This repair needs no second ordinary Serre spectral sequence.

## R02 (P1) — Replace the two admitted data operations

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:85` and :137: “`def trans … := sorry`”; “`def gradingInvolution … := sorry`”.

**Claim:** Subsequent theorems test actual concatenation and the grading-sign operation.

**Witness:** Their types specify no values. On one-point Moore paths, an operation returning duration zero fits the first type; on an odd ℤ-graded copy of ℤ, the zero linear map fits the second, instead of sending 1 to −1.

**Repair:** Delete the Moore-path API from this acceptance file unless required by a retained headline; keep its construction in the README. Give the grading involution a real body, using the native direct-sum decomposition, if retaining the twisted-square-zero headline. Recheck duration 1+2=3 and odd-degree ε(1)=−1, and rebuild every dependent declaration. This covers both `sorry-data` gate failures. An admitted theorem cannot make admitted data a permissible definition.

## R03 (P1) — Local compactness of the source does not remove kification

**Location:** `TauCetiRoadmap/DGFloer/README.md:226–229`: “Its comparison homeomorphism for locally compact Hausdorff sources identifies the two”.

**Claim:** Ordinary compact-open mapping spaces agree homeomorphically with the compactly generated mapping objects for the general targets allowed here.

**Witness:** Let X be an uncountable set with the cocountable topology. Its compact subsets are finite. Thus every continuous S²→X is constant, C(S²,X)≅X, whereas kC(S²,X) is discrete; these spaces are not homeomorphic.

**Repair:** Use the supplier's kified mapping objects and explicit comparison maps, retaining weak comparisons for arbitrary targets. Assert a homeomorphism only under hypotheses proving this particular compact-open space is already compactly generated. The same X must remain a negative Check: the comparison has the same homotopy groups, but the two topologies differ. The ordinary exponential law with a locally compact Hausdorff source is not the disputed assertion.

## R04 (P1) — State the positive-dimension restrictions on the examples

**Location:** `TauCetiRoadmap/DGFloer/README.md:692–693`, :920 and :922: “`H_{4d+2}(Ω HPᵈ)` with `ℤ`”; “Odd spheres”.

**Claim:** These computations and abundance results have no stated lower dimension bound.

**Witness:** At d=0, HP⁰ is a point, so H₂(ΩHP⁰)=0, not ℤ. S¹ has contractible Ω²S¹, so the reduced fibre class required for abundance is zero. The source's Proposition 6.34 requires n≥3.

**Repair:** State d≥1 for the projective-space computation and abundance, n≥3 for odd-sphere abundance, n≥2 for the loop-sphere polynomial calculation, and k≥1 in S⁴ᵏ⁻¹. Retain HP⁰ and S¹ as negative Checks: 0≠ℤ and reduced H₀=0, respectively. See `bdho-floer` line 5063, printed p.116, and line 4685, printed p.108.

## R05 (P1) — The general Morse–Bott supplier citation has drifted

**Location:** `TauCetiRoadmap/DGFloer/README.md:126–131`, :173–179, :674–689: “Stage 4B items 2–5”; “for a complete Riemannian manifold”.

**Claim:** HomotopySpheres supplies the general metric, broken-geodesic, and Morse–Bott package used here.

**Witness:** `TauCetiRoadmap/HomotopySpheres/README.md:475–490` at its supplied head consumes RiemannianGeometry R1–R3 and MorseTheory M5. It supplies Bott-chain instantiations, not the claimed general theorem.

**Repair:** Cite the actual earlier owners: RiemannianGeometry R2/R3 for Jacobi fields and finite based-path approximations, and MorseTheory M5 for the abstract finite-dimensional attachment theorem. Keep the cyclic/free-loop extension here. State exact compact-band/partition hypotheses. Re-test a closed nonsymmetric Riemannian surface: R3's general finite-vertex construction applies, while a Bott-chain-only contract does not. A requested extension with no matching declared gap is not a supplied theorem.

## R06 (P2) — Separate Chern winding from the graph Maslov index

**Location:** `TauCetiRoadmap/DGFloer/README.md:238–245` and :760–764: “the Maslov index of a clutching loop”; “relative to the diagonal”.

**Claim:** The loop index obtained from the Robbin–Salamon graph construction is directly the first Chern number, normalized by c₁(TS²)[S²]=2.

**Witness:** A full positive planar rotation has determinant winding 1 and graph Maslov index 2. The TS² clutching loop winds twice, giving graph index 4, whereas its first Chern number is 2.

**Repair:** Define c₁ by determinant winding, or explicitly divide the graph-loop Maslov index by two after proving evenness. State the convention bridge separately from Conley–Zehnder indexing. Check the one-turn loop (1 versus 2) and the tangent bundle of S² (2 versus 4); the repaired Chern number is 2. No division is needed in arbitrary coefficient rings: this is an integer evenness theorem.

## R07 (P2) — Restrict evaluation to the appropriate component or orbit

**Location:** `TauCetiRoadmap/DGFloer/README.md:495–498`: “For a closed manifold `M`, evaluation at a point `Diff(M) → M` is a locally trivial fibre bundle”.

**Claim:** A fixed fibre bundle description applies over every component of an arbitrary closed manifold.

**Witness:** Take M=S² ⊔ T² and basepoint on S². The fibre over that point contains the identity; every fibre over T² is empty because the components are not diffeomorphic.

**Repair:** State the connected-manifold theorem, and supply the disconnected version over the diffeomorphism orbit of the chosen point (componentwise fibre types). For this M the base of the nonempty-fibre bundle is S²; it is not all M. Palais was resolved as paywalled, so this counterexample is independent of an unread source.

## R08 (P2) — Import the generic Hurewicz and bar constructions from their owners

**Location:** `TauCetiRoadmap/DGFloer/README.md:438–441` and :521–535: “`K(A, 1) = |B_•A|`”; “Hurewicz fibrations”.

**Claim:** This roadmap constructs the generic bar/CW/cover proof and the Hurewicz-fibration predicate and comparison.

**Witness:** Main's `TauCetiRoadmap/AlgebraicTopology/README.md:1831–1849` owns the generic bar/CW/cover proof. Main's `TauCetiRoadmap/GeneralizedCohomology/README.md:533–557` owns the Hurewicz predicate and Serre comparison, explicitly consumed by DGFloer Layer 2.

**Repair:** Cite those exact sections; keep the abelian specialization and higher K(A,n) family, and the strict Moore-concatenation replacement, here. Compare the Moore replacement with the supplied fixed-interval model, without rebuilding the latter. Tests: the abelian bar of ℤ has π₁=ℤ; for E=B=point the supplied fixed-interval replacement is a point while the Moore replacement has durations [0,∞), so their comparison is a homotopy equivalence, not an identification. This is overlap in foundational blocks, not a reason to reject the whole Floer roadmap.

## R09 (P2) — Restore the unconditional realization endpoint

**Location:** `TauCetiRoadmap/DGFloer/README.md:51–57` and :892–896: “together with a closed oriented manifold `S`, a map `φ` …”.

**Claim:** Theorem B/5.14 is delivered only when the input already includes a multiple-realization witness.

**Witness:** `bdho-floer` line 4267, printed p.98, assumes a nonzero projection in top homology; lines 4274–4276 obtain the representing multiple using Thom realization. The roadmap explicitly removes that step.

**Repair:** Make smooth-target multiple realization an owned target with the bordism/Thom prerequisites supplied in legal layer order, then state unconditional Theorem B/5.14. Do not cite a later supplier upward: move the required ownership earlier if necessary. For α=[Q] in a neighborhood of the zero section, the realization target produces N=1 and φ the zero section; arbitrary α must likewise receive a witness from the library, not from the caller. This is a route-specific weakening prohibited by the review contract.

## R10 (P2) — State the statable Hurewicz headline in Lean

**Location:** `TauCetiRoadmap/DGFloer/README.md:395–397`; `TauCetiRoadmap/DGFloer/Suggested.lean:14–22`: “Only Layer 0 … Layer 2 … Layer 4 … are prototyped”.

**Claim:** The file covers the roadmap's acceptance signatures as far as the pins permit.

**Witness:** Degree-one Hurewicz elaborates with native carriers and a single `import Mathlib`; the scratch theorem below produced only its expected `sorry` warning. No missing geometric carrier prevents this statement.

**Repair:** Add the general degree-one Hurewicz headline, including its canonical map/naturality as appropriate. Audit the remaining headlines individually; list every genuinely unavailable one and its missing carrier in the module docstring, rather than substituting elementary API. On a point both groups are zero; on S¹ both are ℤ; on BS₃ both are ℤ/2.

```lean
 theorem hurewiczOne (X : Type) [TopologicalSpace X]
     [PathConnectedSpace X] (x : X) :
     Nonempty (Additive (Abelianization (FundamentalGroup X x)) ≃+
       ((AlgebraicTopology.singularHomologyFunctor.{0, 0, 1}
         (ModuleCat.{0} ℤ) 1).obj (ModuleCat.of ℤ ℤ)).obj
           (TopCat.of X)) := by
   sorry
```

This witness establishes statability, not the canonical natural comparison.

## R11 (P2) — Replace source-number placeholders with actual theorem statements

**Location:** `TauCetiRoadmap/DGFloer/README.md:821`, :874–879, :906–925: “The spectral sequence (Theorem 3.49)”; “Theorem L”; “Theorem M”.

**Claim:** These labels specify implementable end theorems and interfaces.

**Witness:** `bdho-floer` line 2962 requires paired, uniform boundedness for convergence. Lines 735–738 and 753–755 require j!(α)≠0 and i*(α)=0. None of these quantifiers appears at the respective README target.

**Repair:** Write each target in the author's own words with all hypotheses, domains, codomains, bounds, and conclusion. In particular distinguish existence of the SH spectral sequence from convergence; state both of the source's boundedness alternatives. Spell out abundance, covering by diffeomorphisms, the capacity criteria, and the knotted-hypersurface theorem. For α=0, j!(α)=i*(α)=0: both criteria must reject the input. For Hq(𝓕) supported in q≥0 and SHp supported in p≥0, the convergence hypothesis passes; support in p=−q has no uniform lower bound and must not be certified by that branch. A locator is evidence for a statement, not the statement itself.

## R12 (P2) — Restore the omitted general application cases

**Location:** `TauCetiRoadmap/DGFloer/README.md:49–50`, :58–64 and :919–923: “The Cayley plane”; “compact connected Lie groups that are not a `K(π,1)`”.

**Claim:** The general application library can omit a source case and require the non-asphericity conclusion as an extra input to the Lie-group theorem.

**Witness:** `bdho-floer` line 5037, Proposition 6.31, p.116, covers every compact connected non-torus Lie group; line 5247, Proposition 6.39, p.121, explicitly includes the Cayley plane.

**Repair:** Restore those endpoints and own or import their missing prerequisites in supply order. The Lie-group statement must start from “not a torus” and derive non-asphericity; the rank-one symmetric-space construction must include the Cayley-plane case. Searching the roadmap index found no earlier owner of that specific Riemannian construction; cite one precisely if available, otherwise include the target here. On SU(2), the repaired bridge produces π₃=ℤ from the group hypothesis; on a torus higher π vanish and the hypothesis excludes it. The Cayley plane has real dimension 16, whereas HP² has dimension 8: retaining HP² does not cover the omitted case. The choice of a proof of the odd-sphere theorem is not itself a defect; omitting an endpoint is.

## R13 (P3) — Use the required Mathlib import

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:1–4`.

**Claim:** The import header satisfies the acceptance-file contract.

**Witness:** It contains two `Mathlib.*` subimports and no `import Mathlib`. This is exactly the gate's `imports=1`, `mathlib-subimports=2`, `no-import-mathlib=1` failure group.

**Repair:** Replace those first two lines by the single `import Mathlib`; retain only used individual Tau Ceti imports. Re-elaborate at the same pins. The scratch Hurewicz signature demonstrates that the prescribed header is usable without options.

## R14 (P3) — Supply the roadmap structure and per-definition Checks

**Location:** `TauCetiRoadmap/DGFloer/README.md:333–389` and the other layers.

**Claim:** Numbered lists plus one global acceptance list provide the required target/API/dependency structure.

**Witness:** The gate reports `target-ids=1`. There are no `### k.n` target subsections, no per-target `*Needs:*` lines, and no per-layer Examples/Dependencies endings. Singular cubes, Moore paths, Liouville domains and abundance lack three discriminating local Checks each.

**Repair:** Use the prescribed Summary, Scope and ownership, Conventions, Exact supplier contracts, and How to read the build sections; convert targets to prose subsections, retain API bullets, add at least three genuine Checks to each definition, and close layers with Examples and Dependencies. For degeneracy, use n=0 (false), a constant 1-cube (true), and the identity 1-cube (false); the plausible wrong predicate “every constant cube is degenerate” then fails at n=0. Preserve mathematical breadth while making statement-level dependencies inspectable.

## R15 (P3) — Remove process and pull-request references

**Location:** `TauCetiRoadmap/DGFloer/README.md:112–121`, :698–703, :1047–1066.

**Claim:** The roadmap is timeless.

**Witness:** Line 115 names a pull-request number, the recorded `prnum=1` failure. Lines 112 and 121 also describe proposals awaiting merge; the alternative-route and porting paragraphs describe present work status.

**Repair:** Replace these with roadmap-and-section citations and definite mathematical scope; remove status counts and instructions to later contributors to rewrite the plan. Retain only verifiable mathematical provenance. A supplier citation should resolve identically without knowing a pull-request number or the date it was written.

## R16 (P3) — Delete the API padding from Suggested.lean

**Location:** `TauCetiRoadmap/DGFloer/Suggested.lean:49–55`, :87–94, :125–131, :139–140, :178–188.

**Claim:** Cube-degeneracy closure, concatenation API, the elementary one-sidedness implication, grading evaluation, elementary-tensor evaluation and degree bookkeeping are acceptance headlines.

**Witness:** These are definition/API laws or README Checks. In particular `twistedDifferential_single` restates the evaluation formula, `gradingInvolution_of_mem` restates the intended grading-sign definition, and `length_trans` restates additive duration.

**Repair:** Delete these declarations from `Suggested.lean`; keep the mathematics and Checks in the README. Keep only definitions required by genuine headline theorems. I tried `simp` separately on all eight admitted theorems: none closed, so this is not a claim that eight library lemmas were found. The separate API/Check criterion is decisive. The actual square-zero theorem is not included in this padding finding.

## R17 (P3) — Make references and versioned locators reproducible

**Location:** `TauCetiRoadmap/DGFloer/README.md:388–389`, :509–511, :654–656, :852, :1068–1094.

**Claim:** Broad chapter lists and unversioned shorthand identify all required results exactly.

**Witness:** No `sources.toml` is present. The readable Morse preprint has Theorem 7.2.1, p.91; the readable Abouzaid preprint has Proposition 3.2.4, p.77, not the cited published 11.2.4. Many targets have no page/theorem locator at all.

**Repair:** Add one source entry per work with legal provenance and explicit version numbering; use exact theorem/section and printed-page locators at claims. Record published/preprint correspondence rather than treating different numbers as interchangeable. Do not add cached text to the repository. The Floer source is verified as arXiv v3 (May 2026); the 15 sampled numbers below match that version. Unread published versions remain uncertified, not alleged mathematical errors.

## Verified sound

The tables establish instances and source matches, not general proofs. Source-only labels are R11 defects.

**Source sample: 15 targets.** The worker supplied no concrete sampled IDs. I used a supplementary sample of unique Floer v3 numbered declarations cited in the README, excluding Conjecture 1.2 and Lemma 6.35: `random.Random(int("ec50951465223093",16)).sample(population,15)` in source order. This is the sample actually checked. No locator is explicitly flagged unverified. Printed pages/extraction lines follow; successful instance tests are not general proofs.

| Target and README location | Source locator verified | Instances and computed values | Result / change |
|---|---|---|---|
| Lemma 4.5 replacement, :847–862 | `bdho-floer` line 3137, pp.71–72 | Unit-speed circles of radius 1/(2πn), traversed n times in duration 1: speed=1, sup-distance≤1/(πn)→0; limit has geometric length 0, duration 1. Normalizing its duration gives 0. | Correctly rejects the source's continuous retraction on this carrier. For a singleton constant-loop family, sampling and geodesic reconstruction have durations 1 and 0, joined by L(t)=1−t. |
| Definition 3.15, :797–798 | `bdho-floer` line 1943, p.44; preceding Prop.3.14 | A zero-dimensional continuation component consisting of one positively oriented point has fundamental coefficient +1; the zero chain has coefficient 0. | The source requires a representing relative fundamental chain subordinated to the endpoint systems. README must write these conditions (R11). |
| Theorem 3.49, :821 | `bdho-floer` line 2956, p.67 | Supports p≥0,q≥0 give n+1 possible pairs on total degree n≥0. Support (p,q)=(−q,q), q≥0 gives infinitely many pairs on total degree 0. | Existence and convergence have different hypotheses; restore the uniform bound (R11). |
| Definition 6.26, :916 | `bdho-floer` line 4919, p.113 | For G=S¹ or SU(2), left translations give ev∘L=id and ev_*L_*[G]=[G], coefficient 1. The zero class maps to coefficient 0. | This is the missing defining law for “covered”, not merely surjectivity of evaluation (R11). |
| Proposition 6.31, :919 | `bdho-floer` line 5037, p.116 | SU(2)=S³: π₃=ℤ, H₁(Ω²S³)=ℤ. T²: higher π=0 and reduced H*(Ω²T²)=0. | Non-asphericity distinguishes the cases. The qualified variant is mathematically consistent but weakens the source endpoint (R12). |
| Theorem 5.12, :425–437 | `bdho-floer` line 4204, p.97 | Y=S², torsion class, k=2: π₂=ℤ and H₂=ℤ are both outside. Y=point: positive π and reduced H are 0, both inside. ℚ/ℤ example below tests the prohibited mod-2 class. | Source matches Hurewicz modulo a genuine class. Primary Serre text remains unread; positive indices/reduced degree zero must be explicit. |
| Proposition 5.13, :886 | `bdho-floer` line 4229, p.97 | Identity degree 1 gives shriek=id and kernel 0. Circle degree 2 has shriek id on H₁ and ×2 on H₀; each direct-after-shriek composite is ×2, kernel 0 killed by 2. | Source's degree/map hypotheses are necessary specification, absent at the terse target (R11). |
| Proposition 6.6, :878 | `bdho-floer` line 4394, p.101 | α=0 gives i*(α)=0 and j!(α)=0; the criterion rejects it. A class with j!(α)=1, i*(α)=0 and c(α)=c gives the stated numerical upper bound c. | Bound is conditional on the nonzero shriek and finite spectral value, not true for an arbitrary class (R11). No exact geometric capacity computed here. |
| Proposition 4.11, :840–841 | `bdho-floer` line 3552, pp.81–82 | On an oriented interval hybrid component, ∂[I]=[1]−[0]; when the second boundary exponent is odd the RHS is +[1]−[0]. Both sides augment to 0. | Source includes the η⁻¹ coefficient system, endpoint representing systems and signed boundary formula; make them explicit (R11). |
| Proposition 3.13, :794–795 | `bdho-floer` line 1836, p.42 | Identical data give chain maps id and inverse id; composites=id, differences=0, chain homotopy=0. A nondegenerate autonomous Morse perturbation of T² has 4 generators; H=0 has a whole T² of degenerate orbits. | Source requires admissible nondegenerate H and regular J, J′. The latter case is excluded, not a valid finite-generator complex. |
| Definition 1.7, :906 | `bdho-floer` line 415, pp.10–11 | Q=point: j!1=1 in H₀ but reduced H₀=0. For Ω²S², [degree 1]−[degree 0] has augmentation 0 and is a nonzero reduced H₀ element. | Reduced degree-zero condition excludes the spurious point example; restore the actual definition (R11, R04). |
| Proposition 5.11, :883–885 | `bdho-floer` line 4154, pp.95–97 | Q=S²: kernel of ℤ[ℤ]→ℤ contains [1]−[0], infinite order. Q=S³: H₁(Ω²S³)=ℤ maps to H₁(point)=0. Q=T²: reduced fibre homology=0. | These distinguish both source branches and the excluded aspherical case. |
| Proposition 2.6, :667 | `bdho-floer` line 1184, p.28 | Identity fibration over oriented S²: [S²] projects to E∞₂,₀=ℤ with value 1, point class projects to 0; shriek values are likewise 1 and 0. | Both directions pass. Source fixes a connected oriented compact base and relative boundary/CW data. |
| Proposition 2.12, :670 | `bdho-floer` line 1221, pp.29–30 | Product S²×S¹→S² and fibre degree-2 map: first shriek then push gives 2[S¹]; push then shriek also 2[S¹]. | Natural square has the correct direction, with a map over the same oriented base. |
| Proposition 6.18, :909–912 | `bdho-floer` line 4685, p.108 | S²: generator a has degree 1, H₂=ℤ·a² and a²≠0. S³: degree(a)=2, H₁=0,H₂=ℤ. S¹: H₀ΩS¹=ℤ[t,t⁻¹], not ℤ[a]. | Ring is associative polynomial on one generator, not graded-commutative; n≥2 matters (R04). James computation is supplied by HomotopySpheres §3B.3. |

**Adversarial table: 69 retained further rows, 84 including the sample.** Routine API rows are omitted here; sampled targets, headline tests and finding witnesses are retained. Rows with a failure refer to the repair above. “Pass on instance” means only that the displayed values agree. Differential formulas use the README's homological grading unless stated otherwise.

| Statement / locator | Instances | Values computed on the two sides, or positive/negative controls | Result / change |
|---|---|---|---|
| Singular cube, README :185; Lean :32 | n=0; X=point; X=empty | I⁰ is a singleton, so cubes are X; one cube for point, zero for empty | Pass on instance |
| Coordinate degeneracy, Lean :40 | constant cube in dimensions 0 and 1; identity I→I | ∃i:Fin 0 is false; constant 1-cube gives equality c=c; identity takes 0≠1 | Pass; R14 requires local Checks |
| Boundary/product Leibniz, :338–340 | oriented unit square | ∂(I×I)=right−left−top+bottom; (∂I)×I−I×∂I gives the same four terms | Pass; fixes degree-one sign |
| Cubical/simplicial comparison, :341 | point and S¹ | H₀(point)=A,H₁(point)=0; H₀(S¹)=H₁(S¹)=A in both models | Pass on instance; natural chain homotopies still a target |
| Serre E¹/E², :360–374 | F→F→point | E¹₀,q=Hq(F), all positive columns 0; E²=E∞=Hq(F) | Pass on instance; normalization adaptation not fully certified |
| Nontrivial Serre differential, :372 | Hopf S¹→S³→S², ℤ | E² has ℤ at (0,0),(2,0),(0,1),(2,1); d₂:ℤ→ℤ is ±1, leaving total degrees 0,3 | Pass; a blanket collapse claim would fail |
| Comparison/abutment/naturality, :370–376 | product S²×S¹; map of degree 2 on fibre | Both constructions have ranks 1 in total degrees 0,1,2,3; map is ×2 on fibre-degree-1 entries in both | Pass on instance, not a proof of the new comparison |
| Degree-one Hurewicz, :395 | point, S¹, BS₃, BQ₈ | Abelianizations and H₁ are respectively 0, ℤ, ℤ/2, (ℤ/2)² | Pass; native signature missing, R10 |
| CW approximation/weak invariance, :399–401 | point, circle and degree-2 map S¹→S¹ | Id induces 1 on homology; degree 2 induces ×2 on π₁ and H₁, and is not a weak equivalence | Correct negative control |
| Arbitrary-base pullback, :411–417 | CW approximation=id on S¹ | E′=E; comparison maps induce identity, coefficients unchanged | Pass on instance; prerequisite absent, R01 |
| Filtered complex spectral sequence, :420–423 | C₁=ℤ→C₀=ℤ by ×2; filtration 1 and 0 | E¹ entries ℤ,ℤ; d₁=×2; E²₀,₀=ℤ/2 and E²₁,₀=0; H₀=ℤ/2,H₁=0 | Pass on finite filtration; general strong convergence not certified from this test |
| Serre-class extension test, :428–430 | 0→ℤ/2→ℤ/4→ℤ/2→0 | End groups killed by 2; middle not killed by 2 but killed by 4 | Variable exponent passes; fixed exponent fails |
| Mod-2 vanishing, :434–437 | point and K(ℤ/3,2) versus S² | ×2 on 0 is bijective; on ℤ/3 is permutation 0→0,1→2,2→1; S² has H₂(−;𝔽₂)=𝔽₂ | Positive and negative controls pass |
| K(A,n) construction, :438–447 | A=0; A=ℤ,n=1 | Contractible model has all positive π=0; K(ℤ,1) has π₁=ℤ and positive homology only H₁=ℤ | Import generic bar proof, R08 |
| EM uniqueness, :448–452 | K(ℤ,1)=S¹; prescribed ±1 on π₁ | Degree ±1 maps realize ±1 and are weak equivalences; degree 2 realizes ×2 and fails | Hatcher Prop.4.30 plus Lemma4.31 supports the CW argument; arbitrary-target extension uses stated CW approximation |
| Directed union and mod-2 homology, :453–464 | ℤ[1/2]=union 2⁻ʳℤ | On H₁ with 𝔽₂, each transition is ×2=0; direct limit=0. A=ℤ instead gives H₁=𝔽₂ | Pass on instance |
| One-step connected cover, :470–477 | Z=K(ℤ[1/2],2), map to itself | Homotopy fibre contractible: π₂=0, higher π=0 and reduced mod-2 homology=0; fibre of Z′→Z is K(ℤ[1/2],1) | Pass on instance |
| Framed collapse, :489–494 | point with positive normal framing in S¹ | Collapse degree +1; reversing framing gives −1; zero map has degree 0 | Specifies the framing dependence |
| Evaluation bundle, :495 | S²⊔T², basepoint in S² | Fibre at basepoint nonempty, at T² empty | Fails without orbit/connectedness restriction, R07 |
| Moore associativity, :517; Lean :91 | constant durations 1,2,3 | (1+2)+3=6=1+(2+3); strict unit duration 0 | Intended operation passes; actual body admitted, R02 |
| Compact-open/kified comparison, :226–229 | cocountable uncountable X, source S² | C(S²,X)=X with nondiscrete topology; kC(S²,X) discrete | Fails, R03 |
| Moore replacement, :524–532 | E=B=point | Replacement durations [0,∞), fibre inclusion 0→[0,∞) a homotopy equivalence; right action is L+K | Correct strict action on this instance |
| Hurewicz/Serre and endpoint maps, :523–536 | product F×B→B; based path fibration over S¹ | Product lift (f,H(z,t)); projection recovers H. Path fibre has π₀=ℤ while total path space is contractible | Correct model; generic predicate belongs to supplier (R08) |
| One-sidedness, :601–611; Lean :113–131 | single generator over dual numbers, ε degree −1 homologically | dε=0 and ε²=0 satisfy twisting; diagonal ε≠0 violates one-sidedness. In a nonnegative algebra the required negative piece is 0 | Positive/negative controls pass |
| Noncommutative twisted square, :612–624 | free a,b degree0,c degree1, dc=−ab | Left-free d²x=ab−ab=0; erroneous right-free d²ex=ba−ab≠0 | Correct variance/sign witness |
| Grading involution, Lean :137–140 | ℤ in degrees 0,1,2 | Intended ε values 1,−1,1; zero map gives 0,0,0 | Values not determined by admitted body, R02 |
| Twisted-square-zero in zero cases, Lean :191 | P=empty; M=0; zero ring; m=0 | In first three cases D²=0=0; m=0 gives D²=dM²=0 by the DG-module hypothesis | No vacuity found in general square-zero statement |
| Continuation and homotopy, :625–628 | identical complexes with D=0, Ψ⁰=Ψ¹=id,h=0 | Ψ¹−Ψ⁰=0=D⁻h+hD⁺; composition id∘id=id | Pass on instance; source formulas/hypotheses must be stated |
| Brown/Tor comparison, :633–634 | B=point,A=ℤ, coefficient module ℤ/2 | Tor⁰_ℤ(ℤ/2,ℤ)=ℤ/2; positive Tor=0; twisted homology identical | Pass on instance; full CW support is a separate construction |
| Representing chains/Barraud–Cornea, :642–651 | oriented 1-dimensional trajectory compactification I | Boundary coefficients +1,−1 sum to 0; evaluating the boundary gives the two signed products | Correct algebraic consequence; analytic construction not proved by this test |
| Morse fibration theorem, :654–663 | path fibration; Hopf; product | Totals have H*(point), H₀=H₃=ℤ, and product Künneth ranks respectively | Matches BDHO's theorem; comparison maps remain substantive targets |
| Closed broken-geodesic carrier, :678–686 | r=1 constant tuple; short two-vertex loop | First has duration 0; second length 2d(q₀,q₁), preserved by repeating a vertex | Correct cyclic extension; supplier correction R05 |
| Projective-loop group, :692 | CP¹=S²; HP¹=S⁴; HP⁰=point | H₂ΩS²=ℤ, H₆ΩS⁴=ℤ, H₂Ωpoint=0 | First two agree, last refutes unrestricted d, R04 |
| Hamiltonian sign bridge, :264–286 | ωcan=dq∧dp,H=p²/2 | i_Xω=dH gives X=p∂q; source convention gives −p∂q; negating H changes sign | Correct at fixed form |
| Cotangent symplectic/Liouville, :267–273 | T*ℝ, basis ∂q,∂p | ωcan(∂q,∂p)=1; −d(p dq)=dq∧dp; i_(p∂p)ωcan=−p dq | Matches pinned form |
| Negation transport, :274–286 | ν(q,p)=(q,−p) | ν*ωcan=−ωcan=ωsrc; ν*(−p dq)=p dq; ν_*Xsrc,H=−p∂q | Correct combined substitution |
| Chern normalization, :238–245 | 2π and 4π planar rotations | determinant winding 1,2; graph Maslov endpoint/interior crossing sums 2,4 | Clarify factor two, R06 |
| Asphericity/atoroidality, :246–261 | standard symplectic T² | Sphere periods and Chern numbers 0; identity torus map has area 1 | Aspherical does not mean atoroidal; separation in README is correct |
| Action shift, :287–290 | reference constant loop; add constant c to H | Area term unchanged, action changes by −c in source normalization | Correct source sign; downstream substitution must remain explicit |
| Magnetic translation, :728–732 | T*ℝ², σ=q₁dq₂ | Ψ′ shifts p₂ by −q₁; pullback ωcan=ωcan+dq₁∧dq₂, equal to ωcan+π*dσ | Correct; ℝ-only example cannot detect dσ≠0 |
| HZ/almost-existence definition, :743–749 | flat Tⁿ cotangent domain | Arbitrarily steep radial Hamiltonians have nonconstant orbits only in nontrivial homotopy classes; contractible HZ capacity is ∞ | Finiteness hypothesis is substantive; source definitions must be written |
| Floer regularity hypotheses, :759–770 | autonomous H=0 versus Morse perturbation on T² | H=0: return derivative=id, det(id−return)=0; nondegenerate perturbation excludes eigenvalue 1 | Excludes degenerate case; no analytic regularity theorem certified by this test |
| Determinant gluing sign, :773 | (dim V₂,ind D₁)=(1,1),(1,2) | (−1)^1=−1; (−1)^2=+1 | Correct parity formula |
| Classical Floer recovery, :779 | small perfect Morse H on T², n=1 | Morse Betti ranks (1,2,1) in degrees 0,1,2 become Floer ranks (1,2,1) in degrees −1,0,1 | Correct grading shift |
| Floer cocycle and square-zero, :790–795 | indices 2,1,0; dc=−ab | Twisting boundary −ab; differential square ab−ab=0 | Same convention as Layer 4 |
| Continuation identity/composition, :796–804 | identical regular endpoint data | Induced homology map=id; id∘id=id; homotopy boundary=0 for identical choices | Pass on instance, not strict equality of all chain representatives |
| DG Floer closed theorem, :811–815 | T², trivial fibre ℤ in degree0 | E² has only q=0; output ranks 1,2,1 in degrees −1,0,1; shifted H*(T²) same | Correct shift; Serre/Hurewicz scope distinction noted below |
| Zero-energy SH, :817–819 | (D²,S¹), constant coefficients,n=1 | Relative H₂=ℤ, all other relative groups 0; shifted zero-energy group is ℤ in degree1 | Correct shift and relative boundary requirement |
| Viterbo transfer, :820 | identity exact embedding W→W | Restriction of coefficients=id; induced transfer=id, preserves each class | Correct direction; general construction untested |
| Classical Viterbo, :831–833 | Q=S¹, trivial local system | Each winding component LS¹≃S¹, H₀=H₁=ℤ; direct sums over ℤ; ordinary Viterbo identifies these with SH | Uses the cited ordinary Viterbo input, not an independent Floer count |
| DG Viterbo K, :834–866 | Q=S¹, regular path-loop coefficients on each component | Each pulled-back universal total space is contractible; H₀=ℤ per winding, positive homology=0; E² has q=0 after taking fibre homology with its regular action | Consistent with classical comparison; bounded-below hypothesis retained |
| Viterbo zero-energy restriction, :867 | Q=S¹ | Constant-loop inclusion selects winding0; H₀,H₁ each ℤ there, other winding components receive 0 | Correct source/target component |
| Ω²Q acyclicity iff K(π,1), :882 | S²,S³,T² | Reduced H₀Ω²S² contains ℤ; H₁Ω²S³=ℤ; all reduced homology Ω²T²=0 and higher π(T²)=0 | Both directions pass these tests |
| Theorem A/general5.10, :887–891 | Q=S², zero section; Q=T² | Degree1 and π₂S²=ℤ meet first branch; all higher π(T²)=0 excludes it | On round S² every nearby kinetic energy level has closed contractible geodesics; torus contractible counterpart fails |
| Theorem B/general5.14, :892–896 | α=[S²] near zero section | π*α=1[S²], N=1,φ=zero section realize it | Conditional special case passes; general realization removed, R09 |
| Theorem C/general5.15, :897–900 | Q=ℝP²,φ=zero section | Mod-2 degree1; π₂=ℤ and π₂⊗𝔽₂=𝔽₂; first source branch passes | The simply-connected Ω₀Q argument is used only when π₂Q=0 |
| Corollary D, :732,:890 | exact σ=q₁dq₂ locally | Pullback correction is +dq₁∧dq₂ and fibre translation is invertible with opposite translation | Sign comparison passes; global dynamics transported by a symplectomorphism |
| Corollary E, :741,:890 | round S*Sn, primitive −λcan | Radial field transverse, i_Zω=−λcan; radial flow multiplies ω by eᵗ | Contact-type flow argument has correct primitive |
| Theorem L, :874 | α=0; class with jU!α=1,i*α=0 | First input fails 0≠0; second satisfies (1≠0,0=0) | Explicit premise tests only; write full criterion, R11 |
| Theorem M, :878 | α=0; class with j!α=1,i*α=0 | Same discriminating values 0 and1 | No unconditional capacity conclusion from zero coefficients, R11 |
| Abundance/product stability H, :906–907 | point; product with a certified abundant Q | Point reduced fibre H₀=0, excluded; external product with [point] preserves shriek value a·1=a≠0 | Positive/negative controls pass once definition is stated |
| Fibre families, :908–915 | Σp=S¹ over S² with nonzero sphere-family class | total degree dimQ+dimΣp=3>2; zero class would give σp*[Σp]=0 | Positive fibre dimension and nonzero class matter |
| S⁴ᵏ⁻¹ generator, :914 | k=1,S³ | H₁Ω²S³=π₃S³=ℤ; chosen degree1 family gives ±1, zero family gives0 | Need sign/positive-k Check |
| Diffeomorphism covering/ℓ-covering, :916–920 | SU(2) translations; odd-sphere rotation | Evaluation degree1 for translations; rotation degree2 for n=3, degree0 for n=2 | Source conditions discriminate; generic bundle R07 |
| Homogeneous abundance, :921 | SO(3)/SO(2)=S² | π₂=ℤ; fibre-family reduced class nonzero; point quotient has reduced class0 | Must carry source's non-asphericity assumptions |
| Projective abundance I, :922–923 | CP¹=S²; HP¹=S⁴; CP⁰=point | Sphere-family class survives for positive-dimensional cases; point's reduced H₀ is0 | Lower bounds needed, R04 |
| Knotted hypersurface G, :924–925 | positive framed point collapse; reverse framing | Degree +1 versus −1, mod2 both1 | Checks collapse convention only. Full knot/linking and degree hypotheses absent, R11; geometric theorem not independently certified |
| Omitted compact-Lie bridge, README :60–64 | SU(2) and T² | π₃(SU(2))=ℤ; all πₖ(T²)=0 for k≥2. The non-torus and non-aspherical conditions agree on these inputs, but the bridge is missing | R12: prove the implication instead of requiring it |
| Omitted Cayley-plane case, :49–50 | HP² versus CaP² | Real dimensions 8 and 16; they cannot be the same manifold. Source Proposition 6.39 includes both | R12: no dynamical computation claimed for the omitted case |

**Pinned-library audit: 17 checks.** Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths are relative to the respective library repositories.

| Declaration opened | File and line at the pin | Verified content and limitation |
|---|---|---|
| `singularChainComplexFunctor` | `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:36` | Native simplicial singular chains, with coefficient object in a preadditive category; not normalized cubical chains. |
| `singularHomologyFunctor` | Same file, :52 | Homology of that chain complex; the module-valued specialization elaborates in R10. |
| `Abelianization` | `Mathlib/GroupTheory/Abelianization/Defs.lean:39` | Quotient by the commutator subgroup, with a commutative group instance; no commutativity assumption on the input group. |
| `SpectralObject` | `Mathlib/CategoryTheory/Triangulated/SpectralObject.lean:44` | Functor on composable arrows and distinguished-triangle data. It is not by definition a filtered-complex construction or a strong-convergence theorem. |
| `Monotone.ae_differentiableAt` | `Mathlib/Analysis/Calculus/Monotone.lean:209` | Real-valued monotone functions on ℝ are Lebesgue-almost-everywhere differentiable; it does not give continuity of the Moore arc-length operation. |
| `IsDGRightModule` | `TauCeti/Algebra/Homology/DG/Module/Right/Defs.lean:68` | Degree +1, square zero, and graded right Leibniz; ordinary opposite-ring action. This agrees with the cohomological bridge used in the explicit twisted examples. |
| `pathLoopSpaceMulEquiv` | `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:362` | Signature is π_(m+1)(ΩX)≃*π_(m+2)(X), m:ℕ. Degree zero requires the separate component equivalence at :242, not substitution m=0 into the README's abbreviated formula. |
| `IsAspherical` | `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | Includes path connectedness and trivial higher homotopy groups. It does not construct a CW model. |
| `IsEilenbergMacLaneSpaceOne` | Same file, :123 | Asphericity plus a fundamental-group isomorphism. It does not supply the entire K(A,n) family. |
| `LocalCoefficientSystem` | `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43` | A fundamental-groupoid functor to modules. No separation, compactness or local-contractibility assumption is silently supplied. |
| `cotangentSymplecticForm` | `TauCeti/Geometry/Symplectic/Cotangent/Basic.lean:80` | Model-space form evaluates as y₂(x₁)−x₂(y₁), so ω(∂q,∂p)=+1. |
| `cotangentLiouvilleForm` | `TauCeti/Geometry/Symplectic/Cotangent/Liouville.lean:71` | Tautological form λ=p dq; its exterior derivative has the opposite sign from the pinned symplectic form (identity at :153). This is a model-space API, not the global cotangent bundle construction. |
| `SmoothAlmostComplexStructure` | `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean:67` | Smooth tangent endomorphism with J²=−id. Tameness, compatibility and integrability are not fields. |
| `IsPseudoholomorphic` | `TauCeti/Geometry/Symplectic/Manifold/JHolomorphic.lean:103` | Pointwise existence of a manifold derivative intertwining the two structures; no moduli compactness/transversality theorem is built into the predicate. |
| `IsNondegenerateCriticalPoint.exists_morse_chart` | `TauCeti/Analysis/Calculus/Morse/NormalForm.lean:362` | A native Morse normal-form target is present. This is not the Morse–Bott attachment theorem, or a manifold-with-corners structure on compactified trajectories. |
| `addHaar_image_criticalPoints_eq_zero` | `TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:345` | Finite-dimensional real normed spaces; sufficient differentiability threshold (dim E)²+1. It does not assert the optimal classical threshold. |
| `isMeagre_image_criticalPoints_of_isFredholm` | `TauCeti/Analysis/Fredholm/SardSmale.lean:468` | Complete real normed spaces, second-countable source, open domain, Fredholm derivatives and pointwise regularity at least (dim ker)²+1. C∞ is sufficient. No unrestricted nonseparable Banach-manifold theorem was inferred. |

Object searches covered both pins, main, indexed open work and board README/plans: cubes, filtered/Serre sequences, Hurewicz/bar/Moore, DG systems, geodesics/Morse–Bott, cotangent/Viterbo and realization. Namespace hits were copies of DGFloer, not other roadmap owners. No copied passage, computational algorithm, `set_option`, admitted example or extra file was found.

**Cross-roadmap contracts: 11 groups.** Main was read at `3ec8d5f97285d3a04491f8d9662b5dad2bb4f6ff`; new open suppliers at supplied heads. Resolution is not proof certification.

| Supplier and place inspected | Resolution |
|---|---|
| `TauCetiRoadmap/AlgebraicTopology/README.md:910–923`, :1684–1701, :1831–1849, main | Stage 5.5 consumes DGFloer's Serre sequence; Stage 8 supplies higher Hurewicz/general map but expressly leaves the degree-one isomorphism to DGFloer. Generic bar construction supplied (R08); native Serre carrier absent at pin (R01). |
| `TauCetiRoadmap/DGAInfinity/README.md`, Layers 1,4,5, main | Generic DG modules, Maurer–Cartan and twisted complexes supplied. Retain only DGFloer's generator-indexed convention bridge and geometric cocycles. |
| `TauCetiRoadmap/HeegaardFloer/README.md:143–211`, M,F0–F2, supplied head | Morse/Fredholm/Cauchy–Riemann/Maslov/curve lanes resolve. Periodic Hamiltonian orbits are DGFloer's extension. F3 consumes its cotangent examples, so cannot supply them back. |
| `TauCetiRoadmap/GeometricTopology/README.md:177–288`, :357–408, :627 onward, main | Collar/tubular, diffeomorphism-group/family and metric inputs resolve; fixed-fibre evaluation still needs R07. |
| `Completed/UniversalCovers/README.md`, main | Coverings and induced homotopy maps resolve; not a general Serre LES. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275–299`, main | Closed-subgroup theorem resolves, not the omitted non-torus bridge (R12). |
| `TauCetiRoadmap/HamiltonianSystems/README.md`, Layers 1–2, indexed head | Fields, bracket, conservation and symplectomorphism transport resolve; sign bridge tested above. |
| `TauCetiRoadmap/DifferentialGeometry/README.md:256–326`, main | Generic forms/Cartan operations and two-form migration resolve as planned inputs. |
| `TauCetiRoadmap/HomotopySpheres/README.md:365–400`, :467–496 and Stage 5, supplied head | Convenient spaces, James and collapse resolve; general Morse–Bott ownership drifted (R05), comparison overclaimed (R03). |
| `TauCetiRoadmap/RiemannianGeometry/README.md:431–502`, main, and HomotopySpheres :475–490 | Based-path finite approximations supplied with energy/partition conditions; cyclic extension remains here. The named MorseTheory M5 attachment contract was not independently source-certified. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:533–557`, main | Hurewicz predicate and fixed-interval replacement supplied; strict Moore extension remains here (R08). |

No readable plan declared gaps. Main's DGFloer already records smooth-target realization and non-torus compact-Lie application ownership; R09/R12 restore endpoints at this older head. The changed spectral-sequence interface extends this existing roadmap and is consumed by AlgebraicTopology; it does not justify rejecting the entire roadmap as a re-plan.

The requested dependency check, run without changing the merge order, printed exactly:

```text
depcheck: 164 roadmaps, 1165 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No per-target `*Needs:*` lines exist; supplier lists, dependency prose, transitions and source coverage were read instead (R14). Clean order does not validate R01/R05's contracts.

**Headline inventory and Lean acceptance.** These are the README's headline families, not replacements for their absent signatures:

| Headline | Status at this pin / in Suggested.lean |
|---|---|
| Cubical/simplicial comparison; filtered-complex convergence; ordinary/cubical Serre sequences | Absent. Native cubical chains and the actual filtered/Serre constructions are missing; bare `SpectralObject` is not their substitute. |
| Degree-one Hurewicz; CW approximation/weak invariance; Serre-class Hurewicz and mod-2 connected covers | Absent. Degree-one Hurewicz is statable (R10). The other signatures require separate map/predicate audits; the module docstring gives no individual accounting. |
| K(A,n), framed collapse, mapping-space comparison, Morse–Bott/closed-geodesic extension | No headline. Retain supplied generic portions by citation; the cube/Moore API does not test these constructions. |
| Twisted square-zero; spectral/Tor comparison | Square-zero is present with its action/degree hypotheses, but depends on admitted data (R02). Comparisons absent. |
| DG Morse invariance/fibration theorem | Absent; requires enriched moduli chains, cubical DG systems and the actual Morse complex. |
| Hamiltonian Floer/SH; DG Floer J; SH sequence 3.49 | Absent; requires periodic-orbit/enriched Floer constructions. Name these missing carriers and distinguish convergence from existence (R11). |
| DG Viterbo K and zero-energy compatibility | Absent; actual DG SH and loop-space DG Morse objects/comparison are missing. |
| Almost-existence A/B/C and 5.10/5.14/5.15; D/E; criterion L | Absent; actual Hamiltonian/characteristic/almost-existence and spectral-invariant objects are missing. B is additionally weakened (R09). F and Conjecture 1.2 are expressly excluded. |
| Capacity criterion M; abundance/product H; examples I; knotted-hypersurface G | Absent; capacity, abundance, fibre-family and collapse-comparison constructions are missing. Each needs its own docstring explanation and complete prose statement (R11/R12). |

All 20 explicit declarations were copied to one scratch file and inspected with `#check @name`; every signature printed. The final extra check for `TauCeti.TopCat.serreFibrations` failed (R01). `twistedDifferential` retains the right action and `SMulCommClass`; square-zero/degree theorems retain DG-module, scalar-tower and graded-action premises. No additional dropped-binder defect was found; no PR signature changed.

After building the two imported Tau Ceti modules, `lake env lean` on the original acceptance file succeeded: ten `sorry` warnings, no others. All eight single-`simp` theorem probes failed; the separate padding criterion still applies (R16). The Hurewicz witness compiled with one `sorry` warning and no options. No review Lean process remains running.

The worker's gate at the requested head reports FAIL. Its nonzero fields were `prnum=1`, `sorry-data=2`, `imports=1`, `mathlib-subimports=2`, `no-import-mathlib=1`, and `target-ids=1`: addressed by R15, R02, R13 and R14 respectively. Its build, depcheck, outside-folder, stray-files, set_option, source-material and remaining scanner fields were zero. I confirmed the head and empty outside-folder diff; the only changed PR file is this roadmap's README. A successful elaboration does not override the failing gate.

## Not verifiable

The review is finished, not parked. Unread texts were not treated as verification. All source requests used the prescribed service. No manifest was edited. The scratch request list retains original keys, removing the initial Abouzaid failure after retrieval.

- **Seed:** no concrete worker sample IDs were supplied. The 15 supplementary targets above are the sample actually verified.
- **Serre normalization:** the institutional extraction supports Chapter II §4's filtration (`serre-1951` line 825), E¹ (line 901) and E² (line 974), with its own normalization/connectivity assumptions. Damaged symbols and an empty page prevented complete certification of the adaptation to Massey normalization and disconnected fibres. The point/Hopf/product tests do not prove it.
- **Version matching:** read Floer arXiv:2404.07953v3; Morse arXiv:2308.06104v3, Theorem 7.2.1 (`bdho-morse` line 3101, p.91); Abouzaid arXiv:1312.3354v2, Proposition 3.2.4 (`abouzaid` line 2902, p.77). Published numbering 7.2 and 11.2.4 remains uncertified, not alleged wrong (R17).
- **Paywalled/uncertified:** `massey` (cubes), `palais` (evaluation bundles), `ziller` (loop energy), `hofer-zehnder` (capacity), `struwe` (almost existence). The service resolved DOI citations to paywalled publications; none was bypassed or added to missing-text requests.
- **Service bibliographic searches found no readable legal text:** `mccleary` Chapter 2; `serre-1953` Theorem 1; `milnor-stasheff` Chapter 5; `whitehead` Chapter I; `audin-damian` Chapters 6–11; `albers-frauenfelder-oancea` (incomplete Math. Ann. 367 (2017) citation). The last needs a title/DOI.
- **Access/extraction failures:** `bott`, DOI 10.2307/1970106, led to a JSTOR landing page without accessible licensed text. `mcduff-salamon`, DOI 10.1093/oso/9780198794899.001.0001, returned publisher HTTP 403. `robbin-salamon`, ETH author-page Maslov PDF, returned HTTP 403. `salamon` was fetched from a Toronto institutional copy, but extraction is unreadable and OCR unavailable. R06 uses a direct crossing/winding computation.
- **Fetched background is not blanket certification:** Barraud–Cornea (math/0401094v2, math/0701625v1), Seidel (0704.2055v6), Abbondandolo–Schwarz (math/0408280v2), corrigendum (1309.0148v1), and Irie (1110.2244v1) were obtained legally. Possession does not certify every broad chapter citation, analytic gluing claim or all-dimensional corner structure. These were not independently verified in full.
- **External formalization:** size, remaining admissions and portability of `t4v1/damian_formalizare` were not checked against a pinned checkout. They cannot replace native hypotheses (R15/R17). The library table gives the exact declarations inspected, not certification of every broad absence claim.
- **Open work:** ownership searches used provided/indexed heads and readable main/board files. Unprovided/unindexed changes were not checked; existing-roadmap revision hits were not substituted for main as suppliers.

## Source issues

- **Error** in bdho-floer at Lemma 4.5(1), printed p.71: the source says bounded-length Moore loops continuously retract onto unit-speed loops; it should use compact-family approximation for the compact-open topology, since the unit-speed subspace is not closed; affects the proof.
- **Error** in bdho-floer at proof of Theorem 5.15, printed p.99: the source says groups with zero tensor product with 𝔽₂ form a Serre class; it should replace that step with the mod-2 acyclicity/uniquely-2-divisible argument, since ℤ⊂ℚ violates subgroup closure; affects the proof.
- **Misprint** in bdho-floer at Theorem 3.49(ii), printed p.67: the source says the spectral sequence converges to coefficient-free symplectic homology; it should retain the DG coefficient system in the abutment SH(W;𝓕); affects a stated result.
