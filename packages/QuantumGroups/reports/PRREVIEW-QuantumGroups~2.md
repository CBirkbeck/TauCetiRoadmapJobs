# Review of QuantumGroups (pull request #1705 at f852474)

**Verdict:** needs changes

:robot: Independent AI review. Twelve findings, seven blocking. No pull-request file was changed. The new ribbon extension needs a Part II placement and a repaired quantum-module supplier contract; inherited acceptance-test and gate failures also remain.

**Previous findings, checked first.** The supplied previous report identifies **#1649 at d7a6c54**, not this PR/head. Its classical-multiplier section is absent here. The following comparison is against the actual passages at f852474, not an assumption that the reports concern identical content. No repair report marking a finding “not actionable in this package” was supplied or found in this package's reports.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01 admitted data | `Suggested.lean:249,266`: `def quantumSL2Comul`, `def quantumSL2PBWBasis`, both ending in `sorry` | Not repaired; R01 below. |
| R02 obsolete TL sections | `README.md:47`: “TemperleyLiebOperatorAlgebras A1–A6” | Not repaired; R04. |
| R03 supplier order | `README.md:44–47`: the same four analytic/category suppliers | Not repaired; R06. The scanner's particular cycle needs the qualification below. |
| R04 missing headlines | `README.md:669`: “every finite-dimensional U_q module is semisimple” | Not repaired; R07. |
| R05 generic commutative pullback duplication | No Q1.ClassicalMultipliers section or compact-cutoff pullback construction occurs here | Inapplicable to this head, not evidence of a repair commit. Not repeated. |
| R06 shape/Checks/dependencies | `README.md:16`: “Scope, conventions and suppliers”; no `*Needs:*` or `**Checks.**` blocks | Not repaired; R08. Q9's convention paragraph is useful but does not repair the definition-by-definition requirement. |
| R07 unidentified Rieffel source | No Rieffel or archive-0210 citation occurs here | Its concrete witness is inapplicable. The separate claim-level locator deficiency persists; R09. |
| R08 imports | `Suggested.lean:6`: `import Mathlib.LinearAlgebra.Matrix.ConjTranspose` | Not repaired; R05 covers all import-related gate rules. |
| R09 process/historical links | `README.md:53`: historical PivotalSpherical blob; `:47,52`: PR links | Not repaired, with additional Q9 instances; R10. |
| R10 padding | `Suggested.lean:174`: `freeOrthogonalCup_zigzag` | Not repaired; R11. |
| R11 namespace/documentation | `Suggested.lean:31`: `namespace QuantumGroups` | Not repaired; R12. |

Locations below are in `TauCetiRoadmap/QuantumGroups/` unless another roadmap/library is named.

## R01 (P1) — Remove admitted coproduct and PBW data

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:249` and `:266`, “`def quantumSL2Comul`” and “`def quantumSL2PBWBasis`”.

**Claim:** A coproduct algebra homomorphism and a PBW basis are available as data for subsequent equations.

**Witness:** Each body is `by sorry`; the generator theorem at line 254 and basis-value theorem at line 271 depend on those admitted objects. The gate reports `sorry-data=2`.

**Repair:** Replace the admitted constructions and dependent assertions with existence theorems specifying all generator/basis values. Retain the genuine quotient and K unit. The existential PBW statement was elaborated in a scratch copy at these pins. Its monomials at (0,0,0) and (0,−1,0) are respectively 1 and K⁻¹, so the repair specifies the intended basis rather than an arbitrary vector-space basis. Put construction of the Hopf instance in the README until its genuine implementation exists.

## R02 (P1) — Move the ribbon extension after its consumers of Q8

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:829–846`, “The algebra and modules are supplied by QuantumEnvelopingAlgebras QEA0–QEA1”.

**Claim:** The existing QuantumGroups roadmap can acquire Q9 while consuming QuantumEnvelopingAlgebras as an earlier supplier.

**Witness:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:108–123` consumes QuantumGroups Q8.1 for its injective rank-one Hopf comparison. Q9 consumes QEA1 in the reverse direction. The two roadmap nodes therefore have both supply directions.

**Repair:** Preserve existing Q1–Q8 and place this extension in **QuantumGroups, Part II**, after QEA and the quantum-module supplier. Its introduction should say where the base roadmap stops. Import Q8.5 and QEA1 by section. The graph then reads QuantumGroups → QEA → QuantumGroupsPartII, with QuantumGroups → QuantumGroupsPartII for the category. The A₁ computation below still has K E K⁻¹=q²E and the same braiding; changing ownership does not change its mathematics. Q9's statement that Q1–Q8 are independent is correct at the layer level, but does not satisfy the required single direction between roadmap folders. This is repairable by splitting, so the verdict is not “rejected”.

## R03 (P1) — Replace the nonexistent KM5 supply contract

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:837–844`, “KacMoody KM5” and “reuse KM5's quasi-R coefficients and pairing identities”.

**Claim:** The cited KacMoody head supplies quantum highest modules, character comparison, complete reducibility and quasi-R inputs.

**Witness:** The supplied KacMoody head, `TauCetiRoadmap/KacMoody/README.md:52–60`, explicitly assigns quantum modules and quantum complete reducibility to KacMoody, Part II. Its Layer 5 is classical Littelmann paths; KM5 does not exist there.

**Repair:** In the extension, resolve the actual quantum-module owner and section, or declare precise individual supplier gaps in both the plan and exact contracts. The finite-type classification contract must cover the chosen X-lattice and characteristic-zero k(t), not merely complex rank one. Derive the R coefficients here from the supplied pairing, as Q9.2 already proposes, unless a real earlier quasi-R target is identified. Check the repaired contract on A₁: λ=0,ω,2ω give simple dimensions 1,2,3, while the empty datum gives finite vector spaces. None of these computations turns a classical path theorem into a quantum-module construction. The citation resolver's “None” output does not establish that a named section supplies its claimed content.

## R04 (P1) — Resolve the Temperley–Lieb supplier by its actual sections

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:47` and `:567`, “TemperleyLiebOperatorAlgebras A1–A6”.

**Claim:** A1–A6 supplies the positive quotient, positive-loop convention and unitary tensor category used in Q7.

**Witness:** The supplied owner has Layers 1–4. Its sign comparison is §2.1 at line 1108 and its unitary category is §§3.1–3.4 at lines 1225–1326; there are no A1–A6 sections.

**Repair:** Cite §§1.1–1.4 for the Hermitian/quotient/finite-model inputs, §2.1 for the sign comparison, and §§3.1–3.4 for category, positivity and fusion. Keep the algebraic diagrams/Jones–Wenzl input assigned to TemperleyLieb Layers 0–7. At q=1/2 the signed loop is −5/2 and the positive loop 5/2; the repaired §2.1 contract supplies precisely the rescaling needed by this test.

## R05 (P1) — Clear the build gate's non-sorry import warnings

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:5–19`, the import header.

**Claim:** This is an acceptance file satisfying the required build and import checks.

**Witness:** The recorded gate has `build=13`, consisting of 13 module-system import warnings, plus `imports=1`, `mathlib-subimports=13` and `no-import-mathlib=1`. It reports FAIL.

**Repair:** Start the import header with the single `import Mathlib`, followed by just the two used individual TauCeti modules. Do not introduce `set_option`. This header was tested on a scratch copy: the extra complete-reducibility/PBW signatures elaborated with only `sorry` warnings. Re-run the targeted gate on the repaired head. Severity follows the brief's failed-build-gate rule; this is **not** a Lean type error: direct elaboration of the original file exited 0 with ten `sorry` warnings. The recorded targeted-build warnings still prevent acceptance. The header repair also discharges the three overlapping style-rule failures, without counting each imported line as a separate finding.

## R06 (P2) — Resolve the four inherited upward edges

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:44–47`, the VonNeumannAlgebras, HilbertModules, CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras contracts.

**Claim:** These foundations are earlier suppliers for the roadmap on main.

**Witness:** The required dependency command reproduces four `UPWARD` lines, quoted below. It labels QuantumGroups “on main”; these four suppliers are absent from the inspected content main.

**Repair:** Resolve the base-roadmap placement/foundation contracts with the worker, or relocate new work into a Part II whose suppliers precede it. Require a clean dependency result or an explicit correction of the scanner's treatment of existing roadmaps. Do not edit the merge-order file as a content repair. The brief also lists these suppliers as permitted earlier work, so the reported gate/order discrepancy must remain explicit rather than being silently treated as mathematical circularity. H=ℂ and H=ℓ² tests still require the free-module and adjointable-operator interfaces; deleting a citation alone would leave those prerequisites unowned.

The scanner's **specific** `CYCLE among: CategoricalOperatorAlgebras, QuantumGroups, TemperleyLiebOperatorAlgebras` is a false positive on the inspected heads: CA's lines 54 and 1624 name QuantumGroups as a downstream consumer; TL §§3.3–3.4 consume CA1a/CA2a, not QuantumGroups. Its real direction is CA → TL → Q7, and CA → Q6. This does not excuse the distinct genuine QEA/QuantumGroups folder cycle in R02.

## R07 (P2) — State the available headlines and identify the unavailable ones

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:611–612,665–669`; `TauCetiRoadmap/QuantumGroups/Suggested.lean:21–27`.

**Claim:** The acceptance file tests PBW/domain, the full center theorem and finite complete reducibility, and accounts for the other end theorems.

**Witness:** It states Casimir commutation but neither center generation nor complete reducibility. The actual quotient exists. A scratch `IsSemisimpleModule (QuantumSL2 q) V` signature elaborated with the finite-dimensional and scalar-tower hypotheses retained.

**Repair:** State these headlines on the actual quotient, with q≠0 and genericity, using existential PBW as in R01. Center generation can use native polynomial evaluation/subalgebra generation; domain is a property of this same ring. For each other headline in the coverage table below, either supply its few genuine definitions and statement or name the theorem and missing carrier in the module docstring. In particular, name Q9's ribbon theorem: there is no native constructed U_q(A,X,Y)/RepUqg carrier at these pins. Do not insert scalar braiding identities in its place. The repaired complete-reducibility signature includes the zero module and L₀⁻⊕L₁⁺: dimensions 0 and 3, with semisimple decompositions 0 and 1+2.

## R08 (P3) — Give each definition its API, Checks and local dependencies

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:16,131,414,848`.

**Claim:** The nine layers provide a complete, locally traceable implementation specification.

**Witness:** There are no `*Needs:*` lines, no `**Checks.**` blocks, and no per-layer Examples/Dependencies endings. Q9.5 asks for a nonsimply-laced example without computing one.

**Repair:** Use the required Summary/scope/conventions/contracts/build/layer structure without shrinking the mathematics. Retain API facts as prose bullets; add at least three discriminating Checks for each definition, and dependencies for individual targets/routes. End each layer with Examples and Dependencies. For RepUqg use the empty datum, A₁ fundamental/singlet, and B₂ vector representation: the values below are respectively dimension 1 for the unit, braiding eigenvalues 2 and −1/8 at q=4, and dimension 4433/64 at q=2. These distinguish missing roots, inverse braiding and an ADE-only qᵢ convention.

## R09 (P3) — Attach exact sources to the claims they support

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:947–955` and `:992–999`.

**Claim:** Chapter-level pointers and a list of original developments identify the sources/inputs of all target statements.

**Witness:** Q9's supplier paragraph has no theorem/page citation; Q8's center, signed splitting and local-finiteness claims have no claim-level locator. Snyder–Tingley Theorem 3.16 is on preprint p.7; the README gives no page or version.

**Repair:** Attach theorem/section and page locators to individual claims, specifying the read version; give original targets an explicit derivation from located inputs. Record each work once in sources.toml during authoring; this read-only review made no manifest change. For Q9 cite Snyder–Tingley v3 §2 pp.3–4 and §3.4 pp.6–7, and distinguish its complex-simple setting from this roadmap's arbitrary characteristic-zero field and semisimple datum. The q=4 calculation below verifies the transported convention, but is not a source proof of that generality. Unread books remain uncertified, not guessed.

## R10 (P3) — Replace historical and process links with section citations

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:47,52,53,834,837,840–841`.

**Claim:** These are timeless supplier references.

**Witness:** The gate records three commit-pinned roadmap blobs and two PR-number failures; lines 840–841 additionally spell out #1125 and #1124. The pinned KacMoody link hides the section drift in R03.

**Repair:** Use repository-relative roadmap links and actual section names. Cite PivotalSpherical Layers 0–2,7,10, QEA0–QEA1 and the resolved quantum-module contract. Cite AmenableGroups Layer 5 for the discrete Følner criterion, in addition to Layers 1 and 7. For ℤ, the interval test gives 2/(2N+1)→0; Layer 5 is the section that actually supports it. Updating links alone does not repair the missing KM5 content.

## R11 (P3) — Delete acceptance-file padding

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:35–68,162–164,173–179`.

**Claim:** Unused category helpers and a cup-coordinate Check are headline acceptance statements or definitions needed by one.

**Witness:** No retained theorem uses FiniteHopfModuleCat or its forgetful functors, nor freeOrthogonalCupVector. `freeOrthogonalCup_zigzag` is the (j,k) entry of its hypothesis, as its proof explicitly shows.

**Repair:** Delete these from `Suggested.lean`; keep their construction/API/Checks in the README. Do not “prove the padding in place”. With F=[[0,1],[−2,0]], both the hypothesis and extracted equation give −2 on the diagonal and 0 off it. The extraction adds no theorem content. The eight admitted theorem bodies were each tested with the single tactic `simp`; none closed, so this finding does not incorrectly classify those eight as single-simp results.

## R12 (P3) — Align the acceptance-file namespace, names and documentation

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:21–31,45,229,243,271,279`.

**Claim:** The file has the required target-signature form and agrees with README declaration names.

**Witness:** Its namespace is `QuantumGroups`, not `TauCetiRoadmap.QuantumGroups`; several declarations lack docstrings; `schur_orthogonality` and `quantumSL2Casimir_commute` are not named in the README. There are no layer comments.

**Repair:** After removing padding, use the required namespace and module-docstring form, add mathematics docstrings and layer comments, and connect each retained name to its README statement. Do not create dummy declarations to satisfy backticked prose names such as RepUqg. Keep unavailable objects as prose targets and document their missing carriers. Recheck the elaborated signatures after renaming. The existing column-coaction equations and F̃-versus-F convention need no sign change.

## Verified sound

**Scope and mechanical evidence.** HEAD is f85247441a88b0853bd205ab6ff12caf19f897bd. The worktree was clean and the outside-folder diff empty. The PR adds Q9 and its introduction/references; it does not rewrite Q1–Q8. No computational algorithm target, copied source passage, admitted example, `set_option`, or stray changed file was found. I read the normative root README and CONTRIBUTING (the supplied parent-relative paths did not exist), and compared main's PivotalSpherical, RepresentationTheory/CompactGroups and Completed/OrthogonalL2Bases for shape.

The content checkout equals its origin/main, fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. Mathlib and Tau Ceti checkout hashes equal lake-manifest.json: f6090c7095e1e56b3464c1daba5f24631f1290d2 and 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. These differ from the previous review's pins, so its library assertions were not assumed to persist.

The worker gate is FAIL: blob 3; prnum 2; sorry-data 2; imports 1; mathlib-subimports 13; no-import-mathlib 1; depcheck 5; build 13; other reported counters zero. R01, R02/R06, R05 and R10 account for these failures. I reran the required dependency command and direct `lake env lean` on the original module. The latter exited 0 with ten `sorry` warnings; no missing TauCeti object needed building. The scratch corrected-header and additional-headline probe also elaborated. No source/toolchain/manifest files were changed.

**Elaborated signatures.** A scratch copy appended `#check @name` for all 31 names in the supplied signature inventory and elaborated successfully. I compared every type with its declaration and README context. The seven “dropped” leads are harmless here: two coefficient theorems explicitly omit StarModule and their inverse/adjoint argument does not use scalar-star compatibility; AlgebraicHaar, freeOrthogonalRelation, suqMatrix and SUqRelations can carry their displayed equations without it; every consuming theorem that needs it retains it. The cup vector uses classical finite summation, so DecidableEq is not a required parameter. Schur orthogonality retains StarModule, the comodule, an orthonormal finite basis and IsSimpleOrder; the basis supplies finite dimension and the simplicity condition excludes H=0. The coproduct retains Fact(q≠0); PBW/Casimir retain both parameter hypotheses. No missing-context counterexample was found. No declaration was changed in the PR.

**Headline coverage.** These are the README's end theorems and major intermediate theorems, rather than its API catalogue.

| Headline | Acceptance status at the pins |
| --- | --- |
| Q1 Haar existence and uniqueness for arbitrary compact quantum groups | No native completed-minimal-tensor CQG carrier located; name this exact obstacle in the docstring. |
| Q2 arbitrary-Hilbert decomposition and analytic Peter–Weyl | Needs the analytic free-module/coaction carrier; neither theorem is specifically identified in the docstring. |
| Q3 Hopf core, weighted Schur/Plancherel, Kac and modular comparisons | Algebraic Schur is stated. Core/completion/Tomita headlines require the missing analytic constructions. |
| Q4 compact-type characterization, universal/reduced completions, coamenability | The completion comparison needs those carriers. The algebraic characterization should be audited separately using native comodules and genuine unitarizability predicates. |
| Q5 universal SUq(2) and free orthogonal quantum groups | Relation predicates exist, but the universal analytic objects do not. The relation-iff alone is not their construction theorem. |
| Q6 Tannaka–Krein and commutative reconstruction | Missing constructed analytic CQG and C*-fiber category carriers; name both headlines. |
| Q7 classification/fusion, Haar laws, dimensions and coamenability | Needs the constructed Q5 objects; no valid replacement headline is present. |
| Q8 PBW and domain | Statable on the actual quotient; PBW uses admitted data, domain absent. |
| Q8 full center theorem and finite complete reducibility | Statable; center generation and reducibility absent. The latter was scratch-elaborated. |
| Q8 signed-simple classification, local finiteness/type-1, tensor/dual/CG and spherical theory | Classification requires the genuine ladder modules; the finite category requires its actual tensor/dual structures. Do not mark all algebraic results unavailable merely because analytic carriers are missing. |
| Q8 compact/classical comparisons | Analytic equivalence needs Q5/Q7; the classical matrix-family comparison can use native Lie modules and real-body ladder definitions. |
| Q9 RepUqg ribbon structure, standard twist and quantum Weyl dimensions/base change | No constructed full-datum quantum algebra/representation category at the pins; explicitly record these missing carriers, with no free-variable matrix stand-in. |

**Computed adversarial pass.** Each row records actual values or maps on a specified instance, not a claim that a `sorry` proof is verified. “Pass” means the displayed instance agrees with the stated target; it does not certify the general theorem. Formula/construction families share a row where the same calculation tests their compatibility. The 103 computed rows cover all nine layers, the seeded supplier target, the Lean definitions/theorems and all mathematical targets touched by findings are represented. Abstract universal statements whose full proofs were not certified are identified under Not verifiable.

| Statement / location | Instances | Computed left side / right side | Result; change |
| --- | --- | --- | --- |
| Q1 CQG nonzero/unit convention, 18–21 | A=ℂ; zero algebra | ℂ has 1≠0; in zero algebra h(1)=h(0)=0 versus required 1 | Pass; exclude zero algebra. |
| Column coefficients and tensor order, 23–28 | Two 1-dimensional characters χ,ψ | δ(e)=e⊗χ; tensor coefficient χψ; character product χψ | Pass; no reversal. |
| Morphism direction, 33–35 | C₂→{1} | Pullback ℂ→ℂ² sends z to (z,z), reversing the group arrow | Pass. |
| CQG cancellation, 84–96 | C(C₂), indicator basis | Δδ_x(1⊗δ_y)=δ_(xy⁻¹)⊗δ_y; all four basis tensors occur | Pass. |
| Cancellation negative control, 95–96 | Monoid {1,0}, 0 absorbing | At second coordinate 0, Δf(x,0)=f(0) is independent of x; the four-dimensional tensor algebra has cancellation span dimension 3 | Pass; detects a non-group. |
| Convolution and Haar, 98–108 | C(C₂), probabilities μ=(a,1−a), ν=(b,1−b) | (μ*ν)(1)=ab+(1−a)(1−b); h=(1/2,1/2) satisfies μ*h=h*μ=h | Pass. |
| Haar uniqueness/normalization, 100–113 | Trivial group; C₂ | h(z)=z; C₂ invariance forces weights (1/2,1/2), sum 1 | Pass; zero functional excluded. |
| Domination identity, 105–106 | C₂, ρ=h, ω=(1/2,0) | h*ω=ω*h=(1/4,1/4)=ω(1)h | Pass on dominated positive functional. |
| Haar tensor/transport, 112–113 | C₂×C₂ | Each point has mass (1/2)(1/2)=1/4 | Pass; not arbitrary morphism pullback. |
| Haar pullback negative control | Subgroup {1}→C₂ | Evaluation of δ₁ after restriction is 1, whereas C₂ Haar value is 1/2 | Correctly not asserted. |
| CompactGroups coefficient crosswalk, 115–118 | Circle weight 1 at z=i | This coefficient i; supplier coefficient −i; conjugation gives i | Pass. |
| Fell absorption, 122–123 | Γ=C₃, s=1,g=1,h=2 additively | W(λ₁⊗1)W* sends (1,2) to (2,0); λ₁⊗λ₁ also gives (2,0) | Pass. |
| Group coproduct order and antipode | S₃, s=(12),t=(23) | Δ(u_su_t)=u_(st)⊗u_(st); S(st)=t⁻¹s⁻¹=(132), versus wrong (123) | Pass on noncommutative control. |
| Group Haar coefficient, 125–126 | ℂ[C₃], 1 and nonidentity generator u | h(1)=1, h(u)=0; both slice equations for u give 0 | Pass. |
| Unitary coaction and density, 131–139 | Trivial group, H=ℂ²; U=0 | U=I preserves norm 1 and has full range; zero gives norm 0 and range 0 | Pass; excludes noninvertible fake. |
| Haar averaging, 156–159 | C₂ representation T⁻¹ diag(1,−1)T, T=[[1,1],[0,1]] | Average U*U=[[1,1],[1,3]], determinant 2; U*BU=B | Pass; positive invertibility, not positivity alone. |
| Irreducible decomposition, 160–167 | Trivial group, H=0,ℂ²,ℓ²(I) | Dimensions of summands 0,1+1, and one copy of ℂ for each i∈I | Pass; no countability restriction. |
| Regular coefficients/Peter–Weyl, 169–175 | C₂ | Characters 1 and sign span dimension 2=dim C(C₂); each occurs once | Pass; a sum of coefficients, not one irreducible coefficient. |
| Conjugate injection, 179–189 | One-dimensional circle character u=z | Row norm h(uu*)=1; e↦z⁻¹ has squared norm 1, kernel 0 | Pass. |
| F̃ normalization and Schur forms, 192–194 | SU_(1/2)(2), F̃=diag(2,1/2) | Tr F̃=Tr F̃⁻¹=5/2; h(a*a)=1/5, h(aa*)=4/5, h(c*c)=4/5 match both formulas | Pass; distinguishes the two forms. |
| Classical Schur form | Standard irreducible of S₃ | F̃=I₂; diagonal coefficient norm²=1/2 and distinct row/column pairings 0 | Pass; Kac normalization. |
| Algebraic Peter–Weyl/Hopf core, 197–205 | C(C₂) | Two independent characters; ε(sign)=1, S(sign)=sign, Δsign=sign⊗sign | Pass. |
| StarCompatibleHopf/counit_star | ℂ[C₃], a=i u | ε(a*)=−i=conj ε(a); Δ(a*) has coefficient −i on u⁻¹⊗u⁻¹ | Pass; actual star compatibility. |
| Antipode-star inverse, Lean 85 | Same a=i u | S(star(S(star(a))))=i u=a | Pass. |
| Antipode coefficient theorem, Lean 95,113 | Circle U=[i] at a point | Antipode value −i equals U*=−i | Pass; wrong untransposed convention fails in higher dimension. |
| AlgebraicHaar definition | ℂ[C₂], identity-coefficient functional; zero functional | h(1)=1; h((a+bu)*(a+bu))=abs(a)²+abs(b)²; zero functional has h(1)=0 | Pass; normalization excludes zero. |
| Schur irreducibility guard, Lean 135 | H=0 versus trivial H=ℂ | Subcomodule lattice has 1 versus 2 elements; simple-order condition excludes the former | Pass; no empty-trace division. |
| Plancherel, 212–215 | SU_(1/2), coefficient a+c | h((a+c)*(a+c))=1/5+4/5=1; weighted formula gives 1 | Pass. |
| Woronowicz characters, 217–241 | SU_(1/2), a,c | f_z(a)=2^z, f_z(c)=0; convolution gives 2^(z+w), and θ(a)=4a, θ(c)=c | Pass; not all f_z states. |
| Vandermonde step, 231–235 | Bases λ₁=1,λ₂=2; m=0,1 | Matrix [[1,1],[1,4]] has determinant 3; zero values force both coefficients 0 | Pass; positivity prevents squared-base collisions. |
| S² versus modular action, 274–280 | SU_(1/2), a,c | S²a=a, S²c=c/4; θa=4a, θc=c; τ_(-i)c=c/4 | Pass; these actions differ. |
| KMS identity, 280 | a and b=a* in SU_(1/2) | h(aa*)=4/5=h(a*·4a) | Pass; inverse modular convention would give 1/20. |
| Pivot, metrics and traces, 253–267 | F=diag(2,1/2) | F*F⁻²F=I; tr F=tr F⁻¹=5/2≥2 | Pass; unitary j uses changed dual metric. |
| Kac equivalences, 268–271 | C(C₂); SU_(1/2) | Classical F=1,S²=1,trace h; quantum h(aa*)=4/5≠1/5=h(a*a), S²c=c/4 | Pass in both directions on controls. |
| Tomita modular identification, 281–292 | Classical finite group functions | Haar GNS modular operator I; σ_t=id on every coefficient | Pass on finite commutative control; general proof not certified. |
| Compact type equivalences, 298–325 | ℂ[C₂] with u*=u | Coefficients 1,u span; invariant positive h(a*a)=abs(a₀)²+abs(a₁)²; both simples unitary | Pass. |
| Algebraic cancellation inverses, 325 | Group basis u_g⊗u_h | (g,h)↦(g,gh), inverse (g,k)↦(g,g⁻¹k) | Pass including S₃. |
| Universal and reduced completion, 327–356 | Finite Γ=C₂ | A_u=A_r=ℂ⊕ℂ, Haar (x,y)↦(x+y)/2 faithful | Pass; finite example does not collapse general distinction. |
| Regular unitary/pentagon, 340–345 | Group algebra basis (g,h,k) | Both U₁₂U₁₃U₂₃ and U₂₃U₁₂ give (g,gh,ghk) | Pass for nonabelian groups too. |
| Coamenability criteria, 358–386 | C₂ versus F₂ | C₂: full=reduced; F₂ adjacency reduced norm 2√3<4=full counit value | Pass; reduced faithful Haar alone is insufficient. |
| AmenableGroups criterion | ℤ, F_N=[−N,N] | Symmetric-difference size 2; ratio 2/(2N+1)→0 | Pass; cite Layer 5. |
| SUq matrix/relations iff, 400–412, Lean 181–196 | q=1, a=3/5,c=4/5; a=c=0 | First matrix is orthogonal: U*U=I; both norm equations 9/25+16/25=1. Zero tuple gives U*U=0≠I and 0≠1 | Pass positive/negative controls. |
| Totalized q=0 relation predicate | a=1,c=0 | U=I, all five algebraic relations hold at q=0; analytic CQG range excludes q=0 | Pass; different stated scopes are explicit. |
| SUq antipode, 409–410 | q=1/2 | S(c)=−c/2; S(c*)=−2c*; S²(c)=c/4 | Pass. |
| Free orthogonal relation, Lean 157 | F=I, U real orthogonal versus scalar U=i | Orthogonal U=bar U and unitary; i≠−i so wrong unitary scalar fails relation | Pass. |
| Cup orientation/invariance, 422, Lean 162,167 | F=[[0,1],[−2,0]], q=1/2 | Cup −2e₀⊗e₁+e₁⊗e₀; its e₀⊗e₀ image coefficient is ac*−(1/2)c*a=0 | Pass; transpose is necessary. |
| Signed zigzag/J², 423–427 | Same F | F bar F=−2I; normalized J²=−I; diagonal zigzag −2, off-diagonal 0 | Pass; Lean zigzag is padding, R11. |
| Dimension inequality/equality, 428–434 | Same F versus F=I₂ | Norm cup²=5, abs(c)=2, ratio 5/2>2; for I₂ ratio 2=2 | Pass; equality detects unitary proportionality. |
| Reconstruction, 441–452 | Finite Hilbert spaces with usual fiber functor | One simple object, coefficient Hopf algebra ℂ, represented unit dimension 1 | Pass; zero/trivial wrong category excluded by faithful fiber/simple unit. |
| Finite tensor coefficient algebra, 454–471 | H=ℂ before relations | Degree≤n has dimension n+1; product of top degrees n,m lands in degree n+m | Pass; truncation is not a subalgebra. |
| Zero-H reconstruction, 472 | H=0 | B(H)*=0, tensor algebra T(0)=ℂ; all positive degrees 0 | Pass; separate trivial CQG. |
| Filtered reconstruction, 483–491 | Finite subsets of circle characters | {z,z²} and their duals produce finite words; z³=z·z² lies in the same finite-generated subcategory | Pass finite-support control; no single generator asserted generally. |
| Symmetric/commutative reconstruction, 497–512 | C₂ | Spectrum has 2 points, multiplication mod 2, identity 0, inverse x↦x; h(δ_x)=1/2>0 | Pass; Haar has full support. |
| SUq Haar geometric law, 520–522 | q=±1/2, f=1,t,t² | Weighted sums 1,4/5,16/21 respectively | Pass; endpoints handled separately. |
| Endpoint Haar laws, 527–538 | q=1,−1, f=1,t,t² | Integrals 1,1/2,1/3; substituting q²=1 into individual geometric summands gives 0, not a probability measure | Pass; endpoint exclusion essential. |
| Negative endpoint model | q=−1, t=1/2,z=w=1 | a=σ₃/√2,c=σ₁/√2; ac=−ca; a*a+c*c=I; normalized trace(I)=1 | Pass. |
| SUq coamenability route, 539–553 | Character at a=1,c=0 | Both norm defects 0, c*c value 0; at endpoint t=0, σ₃'s +1 component gives a=1,c=0 | Pass; actual reduced model still needed. |
| TL sign and projection relation, 559–571 | q=1/2, F above | d=5/2, δ=−5/2, β=d²=25/4; p₁p₂p₁=(4/25)p₁ | Pass; sign changes generators, not projections. |
| Fusion and dimension recurrences, 575–583 | n=2 and n=3 | 2²=1+3; 3²=1+8; a₂=n²−1; at d=5/2 intrinsic a₂=21/4 | Pass; distinguishes Hilbert/intrinsic dimensions. |
| Character semicircle/coamenability, 584–589 | n=3 | Moments m₀,m₂,m₄=1,1,2; spectral edge 2<ε(χ)=3 | Pass; correct failure of coamenability. |
| n=1 boundary, 593–595 | F=[1] | u*=u,u²=1; two simples; m₄=1 rather than Catalan value 2 | Pass; infinite-fusion claim explicitly excluded. |
| Quantum integers, 599–603 | q=1/2, r=−2,0,1,2 | Values −5/2,0,1,5/2; q−q⁻¹=−3/2≠0 | Pass; nonzero condition on r needed. |
| QuantumSL2 quotient/generators/unit | q=0,1,−1 | q=0 forces E=F=0; at ±1 inverse denominator is 0, all generators commute; KK⁻¹=1 in each case | Pass as total definitions, not classical specialization. |
| Presentation universal relation, 605–612 | L₁⁺, q=1/2 | EF−FE=diag(1,−1)=(K−K⁻¹)/(q−q⁻¹); KE=(1/4)EK | Pass; actual generators. |
| Ore relation and general σ, 613–623 | R=k[x], σ=id, δ=d/dx; also δ=0,σ(x)=2x | Tx−xT=1; second Tx=2xT | Pass; existing zero-derivation skew ring alone cannot supply first. |
| PBW factor/order, 624–631 | a=b=c=1, q=1/2 | KFE=4FKE=q^(−2)FKE; (0,0,0) monomial 1, (0,−1,0) K⁻¹ | Pass; admitted basis data remains R01. |
| Hopf generator formulas, 635–637 | Counit and E on tensor highest/lowest pair | (ε⊗id)ΔE=E; (id⊗ε)ΔE=E; m(S⊗id)ΔE=−K⁻¹E+K⁻¹E=0 | Pass; existential repair keeps these values. |
| S²/pivot and q inverse map, 638–641 | q=1/2, E | S²E=4E=K⁻¹EK; q⁻¹ parameter and K↦K⁻¹ give commutator with numerator/denominator both negated | Pass algebra comparison; coproduct is transported. |
| Weight shifts/local nilpotence, 649–652 | L₁⁺, q=1/2 | K weights 1/2,2; E sends weight 2 to 1/2=(q²)2; F reverses; E²=F²=0 | Pass. |
| Verma module, 653–655 | Highest λ generic, basis F^jv | K(F^jv)=λq^(−2j)F^jv; at j=0, Ev=0 and Kv=λv | Pass initial relations; classification proof not certified by this calculation. |
| Signed finite simples, 656–662 | L₀⁻ and L₁⁺ | L₀⁻: K=−1,E=F=0, dimension 1; L₁⁺ dimension 2 with weights 1/2,2 | Pass; distinct highest eigenvalues. |
| Casimir definition/central action, 665–668, Lean 243,279 | q=1/2, m=0,1,2 | Scalars 10/9,17/9,65/18; signed family gives their negatives; on L₁⁺ Ω=(17/9)I | Pass; not a proof of full center generation. |
| Finite complete reducibility, 669–684 | 0 and L₀⁻⊕L₁⁺ | Dimensions 0 and 1+2=3; invariant summands have direct complement | Pass; missing statable headline R07. |
| Splitting commutator, 678–680 | L₂⁺, q=1/2, r=2 on v₀ | EF²v₀=(5/2)v₁; [2]F(q⁻¹K−qK⁻¹)/(q−q⁻¹)v₀=(5/2)v₁ | Pass; top K²=q⁴=1/16. |
| Local finite/type-1 equivalence, 686–703 | L₀⁻; direct sum of L_m⁺ | L₀⁻ cyclic dimension 1 and E=F=0, but −1≠q^k; each vector in direct sum has finite support and finite cyclic span | Pass; necessary signed distinction. |
| FiniteHopfModuleCat and forgetfuls, 705–719, Lean 37–67 | H=k[C₂], H=k[ℤ], zero module | Base dimensions retained: 1,1,0; same linear map before/after forgetting | Pass; not finiteness over H; no headline uses helpers. |
| Tensor/dual/pivot category, 720–746 | H=k[C₂], g=1 | Tensor dimensions 2·3=6; S²=1=Ad(1); evaluation φ(v), both traces dim V | Pass; group comparison's native equivalence is not automatically monoidal. |
| Clebsch–Gordan highest vector, 749–755 | m=n=j=1, ε=δ=+, q=1/2 | α₁=−1/2; ΔE(v₀⊗v₁−(1/2)v₁⊗v₀)=(1/2−1/2)v₀⊗v₀=0 | Pass; opposite coproduct changes it. |
| Quantum binomial ΔE²/ΔF², 756–760 | r=0,1,2, q=1/2 | Empty power gives 1; r=1 gives generator formula; r=2 middle coefficient q[2]=5/4=1+q² | Pass with indicated factor order. |
| Recoupling/associator, 761–765 | Four trivial L₀⁺ factors | Every normalized CG and associator matrix [1]; both pentagon composites [1] | Pass only boundary control; general 6j not proved here. |
| Signed traces/spherical dimensions, 766–777 | q=1/2, L₀⁻ and L₁⁺ | tr K⁻¹=tr K=−1 and 5/2 respectively | Pass; negative algebraic dimension not positive intrinsic dimension. |
| Compact real form/metric, 779–790 | L₁⁺, q=1/2 | h₁/h₀=2; E†=2F=KF; normalized E entry √2, F entry 1/√2 | Pass; K positive here, negative on L₀⁻. |
| Compact pairing, 791–797 | Fundamental a,c at q=1/2 | Pairing K gives diag(1/2,2); E upper entry √2; F lower entry 1/√2 | Pass; matches the orthonormal metric calculation. |
| Classical family specialization, 801–811 | m=1, v=1 | E=[[0,1],[0,0]], F=Eᵗ, H=diag(1,−1); [E,F]=H | Pass; totalized quotient at q=1 instead has [E,F]=0. |
| Seeded supplier statement, 829–846 | Q8/QEA rank-one and cited KM5 | Q8 and QEA both ΔE=E⊗1+K⊗E, exponent 2d₁=2 at d₁=1; cited KM5 supplies 0 targets at inspected head | Convention agrees; supply fails R02/R03. |
| Q9 form, lattice and empty datum, 848–855 | A₁ simply connected/adjoint; empty datum | (ω,ω)=1/2; ρ=ω, even when X=2ℤω; empty space has form 0 and ρ=0 | Pass; rational ρ retained. |
| Fractional powers, 855–858 | A₁, N=2, q=t² | q^(1/2)q^(3/2)=t·t³=t⁴=q² | Pass; all used Nr integers. |
| RepUqg weight/finite category, 861–869 | A₁ V₀,V_ω,V_(2ω); rank 0 | Dimensions 1,2,3; fundamental weights ±ω; empty datum U=k(t), End(unit)=k(t) | Pass; quantum supplier absent R03. |
| Wrong non-type-1 model | A₁ signed L₀⁻, formal parameter | K=−1 while all integral type-1 scalars are t^(2k); −1 is not one | Excluded as intended. |
| Root canonical tensor/basis independence, 871–873 | One-dimensional pairing p(x,y)=2 | x⊗(y/2)=(3x)⊗(y/6) | Pass; nondegeneracy required for dual bases. |
| R triangularity/inverse, 874–883 | A₁ q=4,s=2 | R sends +− to (1/2)+−+(15/8)−+; −+ to (1/2)−+; diagonal ++,-- entries 2; determinant 1 | Pass; lowering/raising direction fixed. |
| Intertwining/Hecke/braid, 884–887 | Same fundamental matrices | cΔE−ΔEc=cΔF−ΔFc=cΔK−ΔKc=0₄; (c−2I)(c+I/8)=0₄; braid residual 0₈ | Pass by exact rational matrix arithmetic. |
| Highest-vector/singlet braiding, 888–889,933–936 | ++ and w=+−−4(−+) | c(++)=2(++); c(w)=−w/8; inverse eigenvalues 1/2 and −8 | Pass; rules out inverse braiding. |
| Pivot integrality/S², 891–896 | A₁; B₂ long/short with q=2 | y_(2ρ)=h in A₁; B₂ y=6h₁+4h₂; Ad(g) multiplies E_long by 1/16 and E_short by 1/4 | Pass; two distinct qᵢ retained. |
| Standard θ and balancing, 897–904 | A₁ q=4; V⊗V=V₂⊕V₀ | θ_V=8; on V₂: c²θ⊗θ=4·64=256=4⁴; on V₀: (1/64)·64=1 | Pass; θ and ribbon element are inverses. |
| Dual compatibility/ribbon inverse, 902–907 | Same V self-dual | θ_(V*)=8I=(θ_V)* algebraic dual; v_V=I/8; tensor v eigenvalues 1/256,1 match v⊗v(c²)⁻¹ | Pass; star here is dual, not adjoint. |
| Pivotal traces/dimensions, 913–921 | A₁ fundamental q=4 | tr diag(1/4,4)=17/4=tr diag(4,1/4)=[2]_4 | Pass. |
| Quantum Weyl product, nonsimply-laced | B₂ vector highest weight e₁, d_long=2,d_short=1,q=2 | Character q⁶+q²+1+q⁻²+q⁻⁶=4433/64; product [3]_(q²)[5]_q/[3]_q=4433/64 | Pass; supplies missing concrete Check. |
| Source reflection convention (independent source check) | B₂, α₁=e₁−e₂ long, α₂=e₂ short | Correct s₁(α₂)=α₁+α₂=e₁ has squared length 2; the transposed pairing gives 2α₁+α₂ with squared length 10 | Source misprint; roadmap uses the correct Cartan orientation. |
| Empty/trivial quantum dimensions | Empty datum; λ=0 | Empty product 1=unit trace 1; θ=1; R=flip for vector spaces after c=flip∘id | Pass. |
| Base change/N enlargement, 922–924 | N=2→4 via t↦u² | q=t²↦u⁴; q^(1/2)=t↦u²; θ_V=t³↦u⁶ | Pass; specify field embeddings. |
| No evaluation field map, 925–928 | Attempt t↦2 from ℚ(t) | (t−2)(t−2)⁻¹=1 would map to 0·image=0≠1 | Correct exclusion. |
| Signed TL/ribbon boundary, 940–943 | A₁ q=1/2 | Standard quantum dimension 5/2 versus signed TL loop −5/2 | Pass; no silent identification. |

**Pinned declarations and ownership.** Thirteen file groups in the table below record opened pinned declarations; fourteen supplier rows record resolved cross-roadmap contracts or their precise defects. Searches used `roadmaps grep` by objects, the supplied sibling files, main, package README/plan files, and both pinned libraries. Q8's native finite Hopf-module category remains owned by QuantumGroups; HopfologicalAlgebra explicitly consumes it at `TauCetiRoadmap/HopfologicalAlgebra/README.md:134`. QEA owns the higher-rank quotient/pairings; PivotalSpherical owns abstract balanced/ribbon categories. No second owner for the quantum-group-specific ribbon assembly was identified among the permitted heads. The extension, rather than the base roadmap, should own that assembly. NoncompactQuantumSymmetry's locally compact group representation theory does not replace the compact quantum-group construction. The σ-derivation Ore extension differs from both the pinned zero-derivation skew algebra and the derivation-only external construction.

The citation resolver returned no unresolved roadmap/name strings but explicitly did not search the pinned libraries; I therefore checked the pins directly. No same fully qualified top-level declaration was found in the inspected other roadmap files. Incidental results from unprovided heads in the tool's global index were not treated as authoritative suppliers.

| Library file at pin | Declaration/content opened and scope |
| --- | --- |
| `Mathlib/RingTheory/HopfAlgebra/Basic.lean:58,65` | HopfAlgebraStruct/HopfAlgebra contain a linear antipode and the two convolution identities, not star compatibility or antipode bijectivity. |
| `Mathlib/RingTheory/HopfAlgebra/Convolution.lean:57` | HopfAlgebra.antipode_mul_antidistrib is supplied; Q3 correctly consumes it. |
| `Mathlib/RingTheory/HopfAlgebra/GroupLike.lean:37` | GroupLike.toUnits supplies invertibility of a grouplike element. |
| `Mathlib/RingTheory/SimpleModule/Basic.lean:65` | IsSemisimpleModule is ComplementedLattice of native submodules; it states the missing finite-reducibility headline without a custom predicate. |
| `Mathlib/RepresentationTheory/Rep/Iso.lean:159` | Rep.equivalenceModuleMonoidAlgebra is a categorical equivalence; the roadmap still has to prove its monoidal comparison. |
| `Mathlib/Algebra/SkewPolynomial/Basic.lean:93,170,224,237` | SkewPolynomial/monomial/twist/multiplication use the multiplicative-ℕ action, without a derivation term. |
| `TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68,100,109,117,162,173` | coefficientMatrix, counit, column coaction, comultiplication and both antipode-inverse identities match Q1/Q3. |
| `TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/FromMatrix.lean:49,166,204` | matrixCoact, matrixComodule and coefficient reconstruction, on the actual algebraic tensor carrier. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/RightRigid.lean:97,186` | Dual evaluation/coevaluation use native finite comodules and antipode-twisted duals. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.lean:43,47` | Existing two-sided rigidity has commutative Hopf coefficients; not a substitute for the noncommutative S⁻¹ construction. |
| `TauCeti/Algebra/HopfAlgebra/Antipode.lean:88,97` | antipode_antipode and antipodeAlgEquiv in the commutative case. |
| `TauCeti/RepresentationTheory/FDRep.lean:248,254` | ofShrink/ofShrinkEquiv supply the cited finite-dimensional universe comparison. |
| `TauCeti/RepresentationTheory/Compact/SchurOrthogonality.lean:104,122,151` | Classical compact-group Schur relations; not weighted quantum Schur theory. |

**Resolved cross-roadmap contracts.** Main was used for existing roadmaps; the supplied new-roadmap heads were used for new suppliers. These are mathematical contracts, not imports of their Suggested modules.

| Supplier | Resolved location and result |
| --- | --- |
| CStarAlgebras | C1 `README.md:237–261` multipliers/strict extension; C2 state extension; C4 multiplicative domain; C5 `:546–573` minimal tensors/slices; C8 Toeplitz. The generic commutative-pullback target is not restated in this head of QuantumGroups. |
| VonNeumannAlgebras | The full supplied head has V11 `README.md:2794–2809` full left Hilbert algebra, Tomita, weight recovery and KMS uniqueness. The alternative V0–V4-only head does not supply V10–V11; retain the full contract, not just the table's V0–V4 label. |
| HilbertModules | Available supplied head H1 `README.md:162`, H2 `:201–210`, H3 `:259` supplies arbitrary-H free modules, compact/adjointable multiplier comparison and interior tensors. The alternate supplied checkout is absent. |
| CategoricalOperatorAlgebras | CA1a `README.md:152` and CA2a `:302` provide dagger/finite-Hilbert categories, duality and dimensions. The reference to QuantumGroups at `:1624` is a consumer. |
| TemperleyLiebOperatorAlgebras | Actual §§1.1–1.4,2.1,3.1–3.4, as R04. Its CA1a/CA2a consumption at `:1290,1323` is downward. |
| TemperleyLieb | Main Layers 0–7; Jones–Wenzl Layer 6 `README.md:680`, monoidal envelope in Layer 7. |
| RepresentationTheory/CompactGroups | Main Layer 0 `README.md:205`, Layers 4–5 `:295,318`, SU(2) engine `:390`. The conjugated coefficient convention is explicitly transported. |
| RepresentationTheory/LieHighestWeight | Main sl₂ Layer 0 `README.md:319–345`: ladder modules, classification and complete reducibility. |
| OperatorAlgebraDynamics | Main D1–D2; `README.md:180–187` includes both Reiter directions and the discrete ℓ² specialization. |
| FreeProbability | Main F3 `README.md:303–315` full/reduced free-group counterexample; F6 `:534–538` semicircle normalization/moments. |
| AmenableGroups | Main Layers 1,5,7 at `README.md:98,289,415`; Layer 5 supplies the discrete Følner test missing from the table's section list. |
| PivotalSpherical | Main Layers 0–2,7,10; traces `README.md:329–348`, balanced/ribbon definitions `:562–576`. These match Q9's balancing/dual conditions. |
| QuantumEnvelopingAlgebras | QEA0–QEA1 supplies full lattices, qᵢ, quotient, triangular decomposition and nilpotent pairing. Its Q8 comparison creates R02's reverse edge. |
| KacMoody | No KM5 at the provided head; scope `README.md:52–60` assigns quantum theory to Part II. This is R03, not a declared gap. |

There are **no declared gaps** in this package. Ownership against accessible supplied open-head files was checked; missing alternate heads are disclosed rather than silently substituted. The supplied brief does not authorize additional unprovided open heads as dependencies.

Required dependency-check output, unchanged:

```text
UPWARD: QuantumGroups (on main) -> CategoricalOperatorAlgebras (#211) at README lines [46]
UPWARD: QuantumGroups (on main) -> HilbertModules (#9) at README lines [45]
UPWARD: QuantumGroups (on main) -> TemperleyLiebOperatorAlgebras (#227) at README lines [47]
UPWARD: QuantumGroups (on main) -> VonNeumannAlgebras (#3) at README lines [44]
CYCLE among: CategoricalOperatorAlgebras, QuantumGroups, TemperleyLiebOperatorAlgebras
depcheck: 205 roadmaps, 1512 edges, 5 problem(s)
```

**Sources and seeded sample.** No locator is explicitly flagged unverified in the README. The seeded “Suppliers and order” paragraph was checked against the actual supplier texts above, including the missing KM5 and the reverse QEA edge. It has no theorem/page locator itself; its mathematical ribbon references were checked as follows. All source retrievals used the sources service; no source file was put in the repository or report.

- [Snyder–Tingley v3](https://arxiv.org/abs/0810.0084v3): `snyder-tingley line 106` fixes a complex simple Lie algebra, lines 117–127 the rational-function field with fractional powers and opposite coproduct. Lines 238–253, §3.4 pp.6–7, give ribbon-element and duality conventions; lines 262–265 give Definition 3.15/Theorem 3.16 on preprint p.7. The standard ribbon scalar is the inverse of Q9's θ. This supports the convention comparison, not by itself every stated arbitrary-field/product/isogeny extension. Q9's direct constructions must supply those extensions. The arXiv version's theorem/page were checked; journal pagination was not asserted.
- `bmt line 257`, Theorem 2.2 p.6; lines 461–483, Theorem 2.8/Corollary 2.9 pp.10–11; lines 858–865, Theorem 3.6 pp.18–19: faithful-Haar and bounded-counit hypotheses agree with Q4. The fetched text is arXiv:math/0010248v1.
- `banica line 42`, Theorem 1 p.2, read with abstract lines 9–11 restricting n≥2; lines 54–72 give Proposition 1/Lemma 1 and the cup/β normalization. Q7 correctly handles n=1 separately. The text is arXiv:math/9806063v5.
- `malacarne line 52`, Theorem 1.1 preprint p.2; line 183, Lemma 2.1 pp.3–4; lines 285–312, Theorem 4.1 and finite-subset construction pp.5–6. Closure under sums/subobjects is explicit at line 290; Hopf-core uniqueness is separate from analytic completion. The text is arXiv:1602.04807v1.
- `virelizier line 348`, §2.3 p.8, and lines 351–359 confirm the field/generic parameter, presentation, coproduct, antipode and S². Its q-number is nonsymmetric: at q=1/2 and index 2 it is 5/4, versus the roadmap's symmetric 5/2. The roadmap explicitly treats its signed/Verma/local-finiteness extensions as its own developments.
- `algebraic-analysis line 26` (Associativity) allows a noncommutative coefficient ring; lines 168,194,338 provide faithful evaluation, associativity and a universal ring map for σ=id. For LeftPBW, `algebraic-analysis line 38` assumes Field K and lines 63/74 construct the left linear equivalence/basis. For IteratedTower, lines 39/45/49/100 require a ring and a finite family of commuting derivations. These files were fetched at the same stated commit. The Lean source files were read as text and never executed.
- EGNO was retrieved from the author's institutional page as supplementary reading. No specific EGNO theorem is attributed by this README, so none is certified here.

## Not verifiable

- Chari–Pressley, *A Guide to Quantum Groups*, §§4.2,5.3,8.3 and Corollary 8.3.16: the sources service found no legal text. Snyder–Tingley references that corollary, but this is not a direct check of the book's wording or page. Recorded in the scratch missing-reference list with the attempted bibliographic lookup.
- Kassel, *Quantum Groups*, Chapters VIII/XIV: the service classified the publisher route as paywalled/uncertified. No content or hypotheses were guessed, and no duplicate missing-text request was added.
- Timmermann, *An Invitation to Quantum Groups and Duality*, the listed Chapters 3/5/6 and Proposition 2.2.4: DOI lookup reached the [publisher page](https://ems.press/books/etb/44), which explicitly requires a subscription. These locators remain uncertified. In particular the nonseparable analytic proof routes relying on this book were not independently proved or source-certified.
- Malacarne's journal pp.152–159 were not matched to the legal preprint's pagination. The theorem numbers and hypotheses above were checked in the preprint.
- The nonexistent KM5 cannot be source-certified. The repaired supplier must provide the quantum module statements at the claimed generality; classical path characters alone do not provide them.
- The alternate HilbertModules checkout was unavailable; the other supplied head was inspected. The two available VonNeumannAlgebras proposals have different scopes, as recorded above.
- Computed controls are not proofs of general Tannaka reconstruction, nonseparable Peter–Weyl, the center theorem, all generalized-weight splitting steps, or general 6j coherence. The report distinguishes these limits from the concrete false supplier contracts and machine-checkable acceptance defects. The review is completed, not parked for a missing text.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the infinite SU(2)-type simple indexing works for arbitrary n; it should be restricted to n≥2, since n=1 has two simples; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says all the defined q-numbers belong to the multiplicative unit group; it should allow zero and assert invertibility only for nonzero indices; affects nothing.
- **Misprint** in snyder-tingley at §2, printed p.3: the source says the reflection coefficient pairs αᵢ with αⱼ∨; it should pair αⱼ with αᵢ∨, which differs in nonsimply-laced type; affects nothing.
