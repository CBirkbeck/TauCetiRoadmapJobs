# Review of UnboundedOperators (pull request #1027 at e4deb84)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`

**Verdict:** needs changes

Eight findings, two blocking (one P1, one P2). The gate fails on one rule (`depcheck=1`, a CYCLE). Six of the previous review's nine findings are repaired, two are partly repaired (R07 and R09 of that review), and one is not (R05 for the companion file); the finding-by-finding record is under *Verified sound*.

## R01 (P1) — Supply cycle with VariationalMethods, and the cited V2.3 does not supply what is consumed

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:63` ("VariationalMethods V2.3 supplies scalar-generic coercivity, Hilbert complexification and the fixed real subspace"), `:496–498` ("Use native real Lax–Milgram and the scalar-generic coercive adapter specified in VariationalMethods V2.3, whose complexification and real restriction are proved there"), `:510–511` ("use V2.3's Hilbert complexification, real isometric inclusion ι_H … and self-adjoint complexification A_ℂ"), `:558` (*Needs:* of §4.7), `:614` (Layer 4 Dependencies).

**Claim:** The dependency check reports `CYCLE among: UnboundedOperators, VariationalMethods`, and the cycle is real: UO §4.7 consumes VariationalMethods §2.3, while VariationalMethods §2.3 consumes UO-D06's coercive solution. The citation is also drifted: VariationalMethods has no section labelled V2.3 or V5.1 (its sections are 2.3 and 5.1), its §2.3 constructs energy spaces and forcing maps and proves no complexification, and its scope section assigns to UO-D06 exactly what UO imports from it.

**Witness:** VariationalMethods at its open head, `TauCetiRoadmap/VariationalMethods/README.md:45–51`: UO-D06 owns the closed-form representation theorem over `[RCLike 𝕜]`, "the coercive solution map of a shifted Hermitian form over 𝕜 (its scalar-generic adapter of Mathlib's real Lax–Milgram …)", the complexification of a real form and of its represented operator, and the real spectral restriction. Its `:497` consumes "the coercive solution of UnboundedOperators UO-D06 over `[RCLike 𝕜]`", and its `:1050–1051` says UO-D06 "is a supplier, not a consumer". The Hilbert complexification itself is owned on main by GeneralizedCohomology G5.5-RealHilbert (`TauCetiRoadmap/GeneralizedCohomology/README.md:1939–1952`: the complexified inner product, isometric real embedding, antilinear conjugation `J`, completeness, transport of `ContinuousLinearMap.complexify`). Depcheck output after the repair must contain no CYCLE line (current output: `depcheck: 208 roadmaps, 1475 edges, 1 problem(s)`).

**Repair:** Remove every supplier citation of VariationalMethods (the contract paragraph at line 63, the §4.7 text and its *Needs:* line, the Layer 4 Dependencies). Make UO-D06 the owner of the scalar-generic coercive solution: cite Mathlib's `IsCoercive.continuousLinearEquivOfBilin` (`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105`, real scalars only, `V →L[ℝ] V →L[ℝ] ℝ`) for 𝕜 = ℝ and state the 𝕜-generic solution map as a UO-D06 target proved by the real-restriction pattern. Cite GeneralizedCohomology G5.5-RealHilbert for the Hilbert complexification, `ι_H` and `J`; what G5.5 does not provide (the self-adjoint complexification `A_ℂ` of an unbounded real self-adjoint operator and the restricted bounded spectral data) becomes a UO-D06 target. Keep "VariationalMethods 5.1 consumes §4.7" only under *Downstream consumers*. Test instance after the repair: `V=H=ℂ`, `j=id`, `q(u,v)=2 conj(u) v`: the real Lax–Milgram map at 𝕜=ℝ sends `h` to `h/2`, so the represented operator is `A=2I`, agreeing with the §4.7 Check; the depcheck must then print no CYCLE for this roadmap.

## R02 (P2) — The Friedrichs-extension headline is statable at the pins but absent

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean:16–18` (module docstring: "the Friedrichs and singular-endpoint headlines additionally need the closed-form completion"); README `:538–549` (§4.7, "construct its form completion, and obtain the Friedrichs extension S_F … Prove it extends S, preserves its lower bound").

**Claim:** The existence of a self-adjoint extension of a densely defined symmetric operator that preserves its lower bound is one of the roadmap's deep end results, and its statement needs only `LinearPMap`, `IsFormalAdjoint`, `IsSelfAdjoint` and the extension order, all at the Mathlib pin. The form completion is the proof, not a carrier of the statement. The docstring names the headline as not statable, which is incorrect, and the file does not state it.

**Witness:** A scratch declaration elaborated with the single `import Mathlib` at the pin (one `sorry` warning, `#check` printed): for `[RCLike 𝕜]`, complete `H`, `S : H →ₗ.[𝕜] H` with dense domain, `S.IsFormalAdjoint S`, and `γ * ‖x‖² ≤ re ⟪S x, x⟫` on `S.domain`, there is `T` with `IsSelfAdjoint T`, `S ≤ T`, and the same bound on `T.domain`. Instance: `S = 2I` on ℂ with full domain, γ = 2, `T = S`; `S = −d²/dx²` on `C_c∞(0,1)`, γ = 0: the Dirichlet and the Neumann realizations are both such `T` (both extend the minimal operator with domain `H₀²` and have lower bound 0); only the form-order extremality singles out the Dirichlet one, and that clause needs form domains, so it is rightly left to the README.

**Repair:** State the existence theorem above in `Suggested.lean` under Layer 4 (existence, extension, lower bound; no form-order extremality), and correct the docstring to say that only the extremal and form-domain identities are not statable. The same test applies to the closed-symmetric spectrum alternatives of §4.2, which are statable with `TauCeti.LinearPMap.resolventSet` (at the pin in `TauCeti/Analysis/Normed/Operator/Resolvent/Unbounded.lean:168`, at main's pin in `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent.lean:121`); state it or name it in the docstring with the carrier it lacks.

## R03 (P3) — The family index does not list the new child

**Location:** `TauCetiRoadmap/OperatorTheory/README.md:38–70` ("The roadmaps" list) and `:71–83` (the dependency table); contrast `TauCetiRoadmap/OperatorTheory/Suggested.lean:17–18`, which names `UnboundedOperators` among the children.

**Claim:** The index changed in this pull request lists nine children and nine table rows; `UnboundedOperators` occurs nowhere in it (zero matches), while the family's `Suggested.lean` declares it a child. The index also states that SelfAdjointSpectralTheory owns "the spectral theory of unbounded self-adjoint operators" without recording the boundary with the new child.

**Witness:** `grep -c UnboundedOperators TauCetiRoadmap/OperatorTheory/README.md` returns 0 at e4deb84.

**Repair:** Add a list entry for UnboundedOperators (unbounded Borel calculus on SAST's PVM, normal and joint spectral theory, spectral types, deficiency and boundary data, closed forms, analytic vectors, perturbations, tensor operators) and a table row `UnboundedOperators | SelfAdjointSpectralTheory, PolarDecomposition`, and one ownership bullet: SAST owns `P_A`, the bounded Borel calculus, resolvents and Stone; UnboundedOperators owns the unbounded spectral integral and everything built on it.

## R04 (P3) — The companion Lean file still violates the Lean form rules

**Location:** `TauCetiRoadmap/OperatorTheory/UnboundedOperators/IntegralCounterexampleTargets.lean:5–8` (four `Mathlib.*` imports, no `import Mathlib`), `:10–15` (docstring "These are suggested forms only. The README is the definitive specification."), `:30–41` (`exists_interval_witness`).

**Claim:** The file is unchanged since the previous review, so its R05 (imports) and the companion half of its R09 (the interval Check restated as a theorem) are not repaired. The gate's import rules cover `Suggested.lean` only, which is why `mathlib-subimports=0` passes.

**Witness:** `exists_interval_witness` restates README `:578` ("`f_n=n⁻¹1_[0,n]`; prove `f_n∈D(I)`, `‖f_n‖₂=1/√n→0` and `If_n=1`"); at n = 4 both say norm 1/2 and integral 1. A `simp` probe does not close it, so it is padding by content, not by tactic.

**Repair:** Replace the four imports by the single `import Mathlib`; delete `exists_interval_witness` (the README keeps the Check); give the file the "<title>: target signatures" docstring form. Alternatively move `exists_integralOperator` and `integralOperator_counterexample` into `Suggested.lean` under Layer 5 and delete the companion file, removing the link at README `:582`.

## R05 (P3) — The joint Nelson headline cites a theorem with a stronger hypothesis; most generic targets have no locator

**Location:** README `:629–631` (§5.3: "integrate the abelian Lie-algebra representation to a strongly continuous unitary representation", "State any stronger hypotheses used by the chosen joint analytic-vector theorem"), `:1229–1231` (References: Nelson, "The analytic-vector criterion is the theorem used in §5.3; the joint statement retains the explicit mixed-word hypothesis"); `Suggested.lean:131–140` (`nelson_resolvent_commute`).

**Claim:** The headline is true, but not by Nelson's joint theorem. Nelson's integrability theorem for a Lie algebra representation needs analytic vectors for the Laplacian `Δ = Σ Sᵢ²`; the mixed-word bound `‖w x‖ ≤ C R^|w| |w|!` gives for `Δⁿx` only `C (kR²)ⁿ (2n)!`, and `(2n)!/n! ≥ n!` is unbounded, so `x` need not be Δ-analytic. The theorem that gives exactly the Lean statement is Flato–Simon–Snellman–Sternheimer: a representation of a real Lie algebra by skew-symmetric operators on a dense invariant domain of vectors analytic for each basis representative integrates to a unique unitary representation of the simply connected group (`fsss1972 line 230–232`, Hypothesis (C), printed p. 428; `fsss1972 line 277–279`, Theorem 1, printed p. 430). For the abelian algebra ℝ^k the generators strongly commute and extend `i·cl(Sᵢ|D)`, which is self-adjoint by Nelson's single-operator theorem, so the resolvents commute. The roadmap cites neither this paper nor the single-operator theorem's number. Beyond §5.3, the generic targets of §§1.1–1.4, 1.6, 1.7, 2.1, 2.2, 2.5, 2.6, 3.1–3.5, 4.1–4.6, 5.1, 5.2, 5.4, 5.6 and 6.1–6.4 carry no locator at all (the previous review's R07 asked for them; the repair added locators only to §1.5, §4.7, §4.8 and the E01 example).

**Witness:** k = 2, R = C = 1, `S₁ = S₂ = 0` on ℂ satisfies the mixed-word bound trivially; a hypothetical bound for `Δⁿ` that the mixed-word estimate yields is `2ⁿ(2n)!`, while Δ-analyticity would need `C sⁿ n!`; at n = 5 the ratio `(2n)!/n!` is 30240.

**Repair:** Cite Flato, Simon, Snellman, Sternheimer, *Simple facts about analytic vectors and integrability*, Ann. Sci. ENS 5 (1972), Hypothesis (C) p. 428 and Theorem 1 p. 430 (open at Numdam, DOI 10.24033/asens.1233), for the joint integration in §5.3, and Nelson's Lemma 5.1 (dense set of analytic vectors gives essential self-adjointness) for the single-operator step; add Teschl locators to Layer 1 (the unbounded integral and its domain are Teschl (3.25)–(3.28) and Theorem 3.2, printed pp. 91–92, `teschl line 3726–3758`; the adjoint identity is (3.29)) and one locator per generic theorem elsewhere (Teschl Chapter 2 for Layer 4, Reed–Simon or Teschl §3 for Layer 3).

## R06 (P3) — The product law of §1.3 is planned by an earlier supplier

**Location:** README `:104–106` (§1.3: "Prove `dom(f[P]g[P]) = dom g[P] ∩ dom((fg)[P])` and `f[P]g[P]=(fg)[P]` on that domain").

**Claim:** VonNeumannAlgebras, earlier in the merge order, plans the same law for the same object: "own the spectral multiplier product rule: for Borel φ,ψ the actual composition φ(T)ψ(T) has domain Dom(ψ(T))∩Dom((φψ)(T)) and agrees there with (φψ)(T)", for self-adjoint `T` affiliated with `M`, "in particular M=B(H)" (`TauCetiRoadmap/VonNeumannAlgebras/README.md:2313–2316` at the head of #889). UO-A08 already plans the comparison of UO's `f(A)` with V10's affiliated calculus. The ownership of the unbounded self-adjoint spectral theory between VonNeumannAlgebras V10 and SelfAdjointSpectralTheory on main is a matter between those two roadmaps; UO sits on SAST's `P_A`, so this is a citation, not a blocker.

**Witness:** `f(n)=n`, `g(n)=1/n` on counting measure: both roadmaps give `dom(f g) = dom g ∩ dom(fg) = H` and the product `I`; `f=0`, `g=n`: both give domain `dom g` and the zero operator there, while the spectral `fg=0` is total.

**Repair:** In §1.3 cite V10.Affiliation's product rule for the law itself and keep as UO's target only the transport to SAST's `P_A` through the identification of §1.2 and the scalar/inverse/iterated-product corollaries; mention V10.Affiliation in §1.8's comparison sentence.

## R07 (P3) — Supplier-statement drift and roadmaps that exist nowhere

**Location:** README `:263` ("B1 already owns boundedness of convergent SOT/WOT sequences by uniform boundedness"); `:9` and `:51` (VonNeumannAlgebras links with anchor `#v2-elementary-algebra-corners-and-tensors`); `:11–12`, `:198`, `:745`, `:604`, `:816–819` (Quantum Foundations, QF6a, QF6b, RelativisticQuantumFieldTheory RQFT9).

**Claim:** (a) BanachSpaceTheory B1 is "Duality and weak topologies" and lists uniform boundedness among Mathlib prerequisites it consumes (`TauCetiRoadmap/BanachSpaceTheory/README.md:27–28`); boundedness of strongly convergent sequences is Mathlib's Banach–Steinhaus, not a B1 target. (b) The VonNeumannAlgebras anchor matches the heading `## V2. Elementary algebra, corners, and tensors` of the 396-line roadmap in #1041, which has no V2.RectangularL2 and no V10; the sections UO consumes exist only in the 4337-line roadmap of #889, whose heading is `## Layer 2: Elementary algebra, corners, and tensors` (`:523`). Two open pull requests add a `VonNeumannAlgebras` folder; UO should name the sections (V2.RectangularL2, V10.ClosedOperators) and not an anchor. (c) No roadmap named QuantumFoundations or RelativisticQuantumFieldTheory exists on main, in the 434 open roadmap pull requests, or among the board's packages; QF6a, QF6b and RQFT9 are cited as owners of deferred material and as consumers.

**Witness:** `roadmaps grep 'QF6a'` and `'RQFT9'` match only this README (and, for RQFT, one unrelated sentence of LocalVariationalFieldTheory); `grep -n "^## V2" TauCetiRoadmap/VonNeumannAlgebras/README.md` is empty at #889's head and matches at #1041's.

**Repair:** (a) cite Mathlib's `banach_steinhaus` (or the uniform boundedness principle by name) and drop the B1 attribution; (b) cite "VonNeumannAlgebras V2.RectangularL2" and "V10.ClosedOperators" by section name without anchors; (c) describe the scope boundary without naming a roadmap that does not exist ("physical models and measurement are outside this roadmap"), or name an existing owner.

## R08 (P3) — Definitions without Checks

**Location:** README `:338–340` (the point/continuous/residual partition), `:573–579` (the maximal `−u″` and Sturm–Liouville domains of §4.8), `:584–585` (`D_abs(K)` in §5.1), `:770–772` (`S` and `P` closures in §6.2); the Layer 5 preamble `:565` (C-infinity and analytic vectors are checked only in §5.2).

**Claim:** These definitions have no `**Checks.**` list (the shape rule asks for at least three discriminating Checks per definition). Several Checks that would discriminate are already computed in prose elsewhere in the file.

**Witness:** For the spectrum partition, the backward shift on ℓ² (Problems I 4, `:850`) gives `σ_p = {|z|<1}`, `σ_c = {|z|=1}`, `σ_r = ∅`; the zero operator on `c₀₀ ⊂ ℓ²` (`:342`) gives `σ = ℂ`; the zero operator on ℂ gives `σ_p = {0}`. For `D_abs(K)`: the positive rank-one kernel has `D_abs = L²`; the weighted block kernel with `ψ = Σ n⁻¹ s_n` has `ψ ∉ D_abs` although `ψ ∈ dom A*`; the zero kernel has `D_abs = L²`.

**Repair:** Add a `**Checks.**` list under each of these definitions, moving the computed instances above into bullets, and add for §6.2 the three instances `A=2I, B=3I` (sum 5, product 6), a zero factor (zero space), and `A = M_n, B = −M_n` with `x = Σ n⁻¹ e_n⊗e_n` (in `dom S`, not in the intersection domain).

## Verified sound

**Repair status of the previous review (r1 at 6ce07cd).**

| r1 finding | Status at e4deb84 | Evidence |
|---|---|---|
| R01 (P1) BanachSpaceTheory B5 Hilbert-cardinality contract absent | repaired | §4.1 (`:400–404`) owns the cardinal comparison `nonempty_linearIsometryEquiv_iff_lift_mk_eq` and imports H6's unitary criterion; no B5 citation remains |
| R02 (P2) admitted data | repaired | `Suggested.lean` has no sorried `def`; gate `sorry-data=0`; the multiplier branch is the existence theorem at `:36–45` with exact domain and a.e. action |
| R03 (P2) Nelson headline absent | repaired | `nelson_essential_selfAdjoint` (`:119`) and `nelson_resolvent_commute` (`:131`) on the existing `CommonInvariantDomain` |
| R04 (P2) H6 existence criterion replanned | repaired | `:400`: "Import HilbertModules H6's existence criterion … the unitary criterion itself is an H6 input" |
| R05 (P3) imports | repaired for `Suggested.lean` (single `import Mathlib`, `:5`); not repaired for the companion file (R04 above) |
| R06 (P3) frozen links | repaired | gate `blob=0`; suppliers cited by name and section |
| R07 (P3) layers, *Needs:*, Checks, references | partly repaired | six `## Layer k` sections with `*Needs:*`, Examples and Dependencies, a References section; locators and Checks still missing on the targets listed in R05 and R08 above |
| R08 (P3) anchor tag | repaired | gate `residue=0` |
| R09 (P3) padding | repaired in `Suggested.lean` (the wrappers and word identities are gone); not repaired in the companion file (`exists_interval_witness`) |

**Gate.** The worker's gate at e4deb84: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`. The dependency check, run independently with the brief's command:

```text
CYCLE among: UnboundedOperators, VariationalMethods
depcheck: 208 roadmaps, 1475 edges, 1 problem(s)
```

The outside-folder diff (`git diff --stat origin/main...HEAD` excluding the folder and the family index) is empty. The family index changes are `README.md` (dependency table reduced to intra-family prerequisites) and a new `Suggested.lean` declaring nothing; `PROGRESS.md`, `STATUS.md` and `metadata.toml` are unchanged from main.

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 10 declarations elaborated at the pin with exactly five `sorry` warnings (the five theorems) and no error; every elaborated type agrees with its README statement (the multiplier theorem quantifies over every measurable space and measure; the closed-form theorem is over `[RCLike 𝕜]` with complete `V`; both Nelson theorems carry `[CompleteSpace H]`; the three `def`s and two `structure`s mention no completeness, which their types do not need). One-tactic probes (`simp`, `infer_instance`) closed none of the five `Suggested.lean` theorems nor the three companion theorems. Two `rfl` examples confirm `applyWord [] x = x` and `applyWord [i,j] x = action i (action j x)`; a `CommonInvariantDomain 1 ℂ` instance with the zero operator and full domain elaborates. A scratch Friedrichs statement elaborates (R02).

**Adversarial table.** Instances are finite or scalar and test the statements, not the infinite-dimensional proofs. Spectra use the disjoint point/continuous/residual convention.

| Statement / location | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| UO-A01 domain and norm identity (§1.1) | two atoms 0,1, x=(1,2), f=(2,i); f(n)=n, xₙ=1/n | f[P]x=(2,2i), ‖·‖²=8=4·1+1·4; Σ|xₙ|²=π²/6, Σn²|xₙ|²=∞ | consistent; locator missing (R05) |
| UO-A01 on H=0 | zero space | every projection 0, integral 0, 0=0 | keep |
| UO-A02 adjoint/reality (§1.2) | f=i; f=2 on one atom | Mᵢ*=M₋ᵢ, Mᵢ*Mᵢ=MᵢMᵢ*=I; M₂*=M₂ | equal domains do not give self-adjointness; keep |
| UO-A03 sum domain (§1.3) | f(n)=n, g(n)=−n, xₙ=1/n | spectral (f+g)=0 on H; algebraic sum defined only on dom M_n, x excluded | extension wording correct |
| UO-A03 product law | f(n)=n, g(n)=1/n; f=0, g=n | first: dom g∩dom(fg)=H, product I; second: domain dom g, value 0, spectral fg total | law correct; owned earlier by V10.Affiliation (R06) |
| UO-A04 recovery iff (§1.4) | A=diag(−1,1), f=t², f=t³ | squaring: P_A({g(t²)≠t})=I for every g; cubing: g=cube root gives P_A(…)=0 | both directions discriminate; keep |
| UO-A05 spectral family (§1.5) | A=aI, a<b; A=diag(0,1) | P((a,b])=E(b)−E(a)=0, P([a,b])=I; E(1)−E(0)=diag(0,1) | matches `teschl line 3633–3638` (3.14), inverse construction `line 3643–3649` |
| UO-A07 maximal multiplier (`existsUnique_maximal_multiplier`) | f=0; f=i on a point mass; f(n)=n counting; μ=0 | domain all L², action 0; domain ℂ, action ix, adjoint −i so realness needed; xₙ=1/n out, 1/n² in with Σn²n⁻⁴=π²/6; zero space, unique zero map | statement true at every instance; probes fail; keep |
| UO-A07 null-set invariance | h=1_{ {0} } on Lebesgue [0,1] versus δ₀ | Lebesgue: M_h=0; δ₀: M_h=I | the measure, not the function, decides; keep |
| UO-A08 comparison (§1.8) | h=t², A=diag(−1,2); ψ=(1+|x|)⁻², A=M_x | both calculi diag(1,4); ∫x²ψ²=2/3 finite, ∫x⁴ψ²=∞ | D(A)⊄D(A²); keep |
| UO-A08 essential image | h=1_{ {0} } on L²[0,1]; diag n | σ={0} although raw range {0,1}; σ=ℕ₊ | formula correct |
| UO-B01 normal API (§2.1) | N=diag(1,i); N=[[0,1],[0,0]]; N=iM_n | N*N=NN*=I, Re N=diag(1,0), Im N=diag(0,1); N*N=diag(0,1)≠NN*=diag(1,0); Re N=0 total vs algebraic part on dom M_n | normality rejects nilpotent; domain enlargement handled |
| UO-B02 normal spectral theorem (§2.2) | N=diag(1,i) | P({1})=diag(1,0), P({i})=diag(0,1), ∫z dP=N | consistent; no locator (R05) |
| UO-B03 strong commutation (§2.3) | Pauli X,Z; diagonal pair | XZ=−ZX, e^{iπX/2}e^{iπZ/2}≠e^{iπZ/2}e^{iπX/2} (sign); all commutators 0 | content confirmed |
| Nelson surface (§2.3–2.4) | 8 unit squares, 12 punctures | area 8; cone angle 8·π+4·3π/2=14π; χ=8−16+2=−6, g=4 | arithmetic consistent; source paywalled |
| UO-C03 decomposition (§3.3) | δ₀+Lebesgue on [0,1]; diag(0,1), vector (1,1); rational diagonal | pp mass 1, ac mass 1, sc 0; union of axes omits (1,1), span has it; H_pp=H but σ_c=ℝ∖ℚ | closed span statement correct; keep |
| UO-C03 arbitrary H | ℓ²(ℝ)⊕L²(ℝ) | pure-point projection is ℓ²(ℝ)⊕0; any Borel B with every atom is ℝ, P_A(ℝ)=I≠P_pp | nonseparable qualification needed and present |
| UO-C05 diagonal realization (§3.5) | λₙ=n, D=ℚ⊂F=ℝ; m=2 eigenvalues; H=0 | σ_p=ℚ, σ=cl ℚ=ℝ, σ_c=ℝ∖ℚ, σ_r=∅; |F|≤2; all four sets ∅ | cardinality cases correct |
| UO-D01 half-plane constancy and cardinals (§4.1, `nonempty_linearIsometryEquiv_iff_lift_mk_eq`) | −i∂ on (0,∞): z=i gives e^{−x} (‖·‖²=1/2), z=−i gives e^{x} (not L²); ℂ vs ℂ²; two ℓ²(ℕ); two zero spaces | defects (1,0); cardinals 1≠2, no unitary; ℵ₀=ℵ₀, identity unitary; ι,κ empty, 0=0 | statement true at instances; probes fail |
| UO-D01a spectrum alternatives (§4.2) | −i∂ on H₀¹(0,∞) | Im w>0: ker(S*−w̄)=0, range closed dense, w∈ρ; Im w<0: ker(S*−w̄)=span e^{iw̄x}≠0, range not dense, residual | closed lower half-plane; statable (R02 note) |
| UO-D02 extensions (§4.3) | defects (2,1), rank-one pairing; (1,0) | new defects (1,0), 2=1+1, 1=1+0; no nonzero pairing | cardinal sums, no subtraction |
| UO-D03 conjugation (§4.4) | A=2I, J=conj; B=i∂ split line, Jψ(x)=conj ψ(−x); plain conj | AJ=JA; both sides −i conj ψ′(−x); plain conj gives +i conj ψ′ vs −i conj ψ′ | commuting versus anticommuting correct |
| UO-D04 boundary form (§4.5) | unit x₊∈N₊, unit x₋∈N₋; (1,1) line (1,e^{iθ}); (1,0) | G(x₊,x₊)=−2i, (i/2)G=1; G(x₋,x₋)=2i, −1; 1−1=0 isotropic and self-orthogonal; form positive definite, maximal isotropic 0 | signs and the maximal-isotropy distinction correct |
| Transfer adapter (§4.5) | C=iI; C=[[1,1],[0,1]] | C*JC=J both; det C=−1; conj(b)d=1 real not imaginary | refutes the recorded restrictions |
| UO-D05 examples (§4.6) | interval θ=0, θ=π; half line | eigenvalues 2πk, π+2πk from e^{iλ}=e^{iθ}; defects (1,0), σ=closed lower half-plane | consistent |
| UO-D06 representation (`existsUnique_selfAdjoint_of_closed_form`) | V=H=ℂ, j=id, q=2ūv, α=0, c=2; q=0, α=c=1; j=2id, q=ūv; V=H=0 | A=2I (u=1,v=i: both sides 2i); A=0; A=(1/4)I since 4Ā ū v=ūv; graph {(0,0)} | convention ⟨h, jv⟩ conjugate-linear in h matches q; probe fails; keep |
| UO-D06 Friedrichs (§4.7) | −∂² on C_c∞(0,1); A=2I on ℂ | Dirichlet form domain H₀¹⊂H¹, inverses at λ=−1 ordered; T=S | existence statable (R02) |
| UO-D07 Sturm–Liouville (§4.8) | p=w=1, q=0 on (0,1); ν=0, 1/2, 1 | solutions 1, x both L², defects (2,2); r^{1/2±ν}: at ν=0 √r, √r log r in L²; at ν=1 r^{−1/2} not | thresholds correct; `eckhardt line 227–229` has p≠0, r>0 (UO's p>0 is a specialization) |
| UO-E01 cores and commutator (§5.1) | M_n with finite-support D; ‖P‖=‖Q‖=|c|=1 | Σₙ>N(1+n²)|xₙ|²→0; n!≤2ⁿ fails at n=4 (24>16) | keep |
| E01 Jones functional (companion theorems) | fₙ=n⁻¹1_[0,n], n=1,4; c≠0 | norms 1, 1/2, integrals 1, 1; (0,c) is a graph limit, adjoint domain {0} | matches `jones line 2886–2887`, `2902–2903`; interval theorem is a Check (R04) |
| UO-E02 analytic vectors (§5.2) | A=2I, x=1; A=0; M_n, xₙ=1/n | Σ2ⁿrⁿ/n!=e^{2r}; series ‖x‖; x∉dom M_n | keep |
| `nelson_essential_selfAdjoint` (§5.3) | k=1, S=2I, x=1, C=R=2; S=iI; k=0 | 2ⁿ≤2·2ⁿn! at n=0,1,2: (1,2),(2,4),(4,16), closure 2I; iI bounded with C=R=1 but ⟨i,1⟩=−i≠i, excluded by `hsym`; Fin 0 empty, vacuous | true; mixed-word bound stronger than needed (single-letter words suffice), note only |
| `nelson_resolvent_commute` (§5.3) | Pauli X,Z, x=e₁; A=2I, B=3I on ℂ, z=w=i | words [X,Z],[Z,X] give e₂,−e₂, `hcomm` fails, resolvents (i−X)⁻¹,(i−Z)⁻¹ do not commute; R=1/(i−2), S=1/(i−3) commute, (Rx, iRx−x)=(Rx, 2Rx) in graph of 2I | true by FSSS Theorem 1 + Nelson's single-operator theorem; source missing (R05) |
| Δ-analyticity from mixed words (R05) | k=2, C=R=1 | bound for Δⁿ: 2ⁿ(2n)!; analytic needs C sⁿ n!; (2n)!/n! at n=5 is 30240 | Nelson's joint theorem does not apply as cited |
| UO-E04 relative compactness (§5.4) | A=0, V rank-one projection; V=I | iV compact, essential spectra {0},{0}; iI not compact, {0}→{1} | keep |
| UO-E04a perturbation (§5.5) | A=2I, B=3I; T(t)=diag(t,−t) | R=1/(w−2−3z), ∂_z R=3/(w−2−3z)²; branches t,−t analytic, ordered −|t|,|t| not | keep |
| UO-E05 cores (§5.6) | u=sin(πx) on (0,1) | u(0)=u(1)=0, u′(0)=π, u′(1)=−π: u∈dom Dirichlet, u∉H₀² | form core versus operator core correct |
| UO-E06 (§5.7) | u_R(x)=u(x/R) in ℝ³ | ‖u_R‖₂∼R^{3/2}, ‖Δu_R‖₂∼R^{−1/2}, exponent (3/2)(1/4)+(−1/2)(3/4)=0 | GN estimate scale-consistent |
| UO-F01–F03 tensors (§6.1–6.3) | A=2I, B=3I; zero factor; spectra ℕ₊ and {−n+1/n} | product 6I, sum 5I; zero space, σ=∅; raw sum contains 1/n but not 0, closure needed | keep |
| UO-F04 (§6.4) | eigenvectors with eigenvalues 2, 3 | sum series e^{5r}=e^{2r}e^{3r} | criterion sufficient |
| Exam Q1 symbol (`:1115–1138`) | f(λ)=λ (λ<0), floor(λ)+1 (λ≥0) | level sets [k−1,k) positive measure for k≥1; level set at 0 empty, negative values approach; |f−λ|≤1 | σ_p=ℤ₊, σ_c=(−∞,0] |
| Assignment 1 Q2 (`:905–920`) | xₙ=eₙ/n, h=Σ eₙ/n | (R−N)xₙ=⟨h,n eₙ⟩e₁=e₁ while xₙ→0; T=I+K with K²=0 since h⊥e₁ | not closable; R=TN closed |
| Problems I 4 (`:850`) | backward shift | ‖A‖=1, A*A=I−P_{e₁}, σ_p open disk, σ_c circle, σ_r=∅ | correct |
| Problems I 8 (`:1178–1192`) | λ_{n_j}→i, x_{n_j}=n_j⁻³ | Σn_j⁻⁶<∞, Σn_j⁶n_j⁻⁶=∞ | D₃⊊D_max, A not closed |
| Weighted shift (`:1205–1215`) | a₀eₙ=√n eₙ₋₁ | ‖ax‖²=Σn|xₙ|², ‖a†x‖²=Σ(n+1)|xₙ|², a†a=N, aa†=N+I | D₊=D₋, non-normal |

**Library declarations opened at the pin** (worktree manifest, TauCeti a91d3aaf, Mathlib as pinned): `LinearPMap.smul_domain` (`Mathlib/LinearAlgebra/LinearPMap.lean`), `IsClosed`/`IsClosable`/`closure` (`Mathlib/Topology/Algebra/Module/LinearPMap.lean:59,66,93`), `IsFormalAdjoint` (`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean:73`, the two-sided pairing on both domains), `adjoint`, `adjoint_isClosed`, `adjoint_graph_eq_graph_adjoint`, `isSelfAdjoint_def` (same file), `HilbertBasis.repr` (`l2Space.lean:378`, an isometric equivalence with `ℓ²(ι,𝕜)`; no basis-cardinality theorem exists at the pin, so §4.1's ownership is right), `HaveLebesgueDecomposition`, `absolutelyContinuous_iff_withDensity_rnDeriv_eq`, `withDensityᵥ`, `AbsolutelyContinuousOnInterval`, `polynomialFunctions.topologicalClosure`, `ContinuousMap.toLp_denseRange`, `AddCircle.fourierBasis`, `InnerProductSpace.rankOne`, `isPositive_iff_complex`, `LinearMap.IsSymmetric.continuous`, `LinearMap.continuous_of_isClosed_graph`, `ContinuousLinearMap.ofIsClosedGraph`, `IsSelfAdjoint.eq_smul_self_of_isLocalExtrOn`, `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `IsCoercive.continuousLinearEquivOfBilin` (`LaxMilgram.lean:105`, real scalars only). Tau Ceti: `TauCeti.LinearPMap.IsResolventAt`, `resolventSet`, `resolvent` (`TauCeti/Analysis/Normed/Operator/Resolvent/Unbounded.lean:104,168,199` at the worktree pin; at main's pin 358314d4 they are in `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent.lean:121,152`, which is the path the README names; not a finding since the merged roadmap reads main's pin), `analyticAt_resolvent` (`Resolvent/Analytic.lean:67`), `TauCeti.riemannianVolume` and `eq_riemannianVolume_iff` (`VolumeDensity/Volume.lean:76,87`), `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex` (`EulerCharacteristic/Singular.lean:141`, finite CW hypothesis), `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Stone/Unbounded.lean:106`, generator `Complex.I • A`, as the README's "native complex generator is iA"), `StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top` (`UniformlyContinuous.lean:233`), `LinearPMap.smulSub` (`SmulSub.lean:37`). No projection-valued-measure carrier exists in either pinned library, which confirms the docstring's list of unstatable spectral headlines.

**Cross-roadmap citations resolved.** HilbertModules H6 at the head of #861 (`README.md:692–748`: scalar adjoint, graph closure, cores, unbounded continuous calculus, deficiency decomposition, boundary form, Cayley correspondence, unitary classification with existence iff the deficiency spaces are unitarily isomorphic). VonNeumannAlgebras at the head of #889: V2.RectangularL2 (`:634–640`, maximal `Measure.pi` product through `MeasurableEquiv.piFinTwo`, no σ-finiteness, agreement with `Measure.prod` under σ-finiteness), V10.ClosedOperators (`:2249–2290`: Cayley transform, inverse correspondence, polar decomposition of closed operators, multiplier-form theorem with domain `{g : ∫|fg|²<∞}`, the three interval-derivative spectra ∅, ℂ, 2πiℤ), V10.Affiliation (`:2305–2316`). SelfAdjointSpectralTheory on main: SA-A21 (`:225`, von Neumann criterion), SA-B39 (`:399`), SA-B49–B57 (`:436–460`), SA-B85 (`:676`), SA-C39 (`:888`), SA-C55 (`:929`), SA-D17–D20 (`:1103–1109`), SA-E01 (`:1202`), SA-E05 (`:1211`), SA-E08 (`:1217`), SA-E26 (`:1260`), SA-E29 (`:1266`), SA-E43 (`:1307`), each stating what UO cites it for. PolarDecomposition on main PD-B23–PD-B34 (`:371–393`; PD-B29 initial space `(ker M)⊥`, PD-B32 final space). BanachAlgebras A2 on main (`:161`, holomorphic calculus with Banach-valued contour integrals). PDE Lane A on main (`:223–264`, items 1–3 and 6: weak derivatives, `W₀`, Bessel comparison, traces). LieGroups on main Layers 2 and 5 (`:275`, `:358`). OrthogonalL2Bases (completed) Parts A and D (`:147`, `:372`). OperatorAlgebraDynamics D8 on main (`:554`). GeneralizedCohomology G5.5-RealHilbert on main (`:1939`). PlanarTopology and SurfaceTopology in #271 (another author's new roadmaps): `Surface.eulerChar` (`PlanarTopology/README.md:741`), `Surface.IsOrientable` (`:746`), `boundaryComponentCount` (`:411`), `IsClosedCombinatorialSurface` (`:532`), `Orientation K hK` (`:731`), Layer 6 heading (`:704`); `IsSurfaceGMap.eulerChar_eq`, `isOrientable_iff`, `GMap2.boundaryComponentCount_realization` (`SurfaceTopology/README.md:414,416,409`), `StandardSurface.orientable` (`:868–880`), Layer 8 heading (`:859`). VariationalMethods at #1028 (`:45–51`, `:491–511`, `:827–850`, `:1050`): see R01. Ownership of this roadmap's objects against the open pull requests listed in the brief was searched by object (maximal multiplication operator, Hilbert-basis cardinal classification, closed-form representation, Nelson analytic vectors): the only other planners are VonNeumannAlgebras V10 (R06) and VariationalMethods (which defers to UO). The `applyWord` lead of the citations report is defined at `Suggested.lean:99` and type-checked; the two SurfaceTopology leads are supplier declarations in #271.

**Sources read at their locators.** `teschl` (schroe.pdf, version February 12, 2009, `line 37`): Theorem 2.13 at printed pp. 71–72 (`line 2960–2966`, closed semibounded form ↔ unique self-adjoint operator with the domain formula (2.60)); (3.14) and properties (i)–(iv) at printed p. 89 (`line 3633–3638`), the unique PVM of a resolution of the identity (`line 3643–3649`); the unbounded integral `D_f`, (3.25)–(3.27), density, Theorem 3.2 (`line 3726–3758`, printed pp. 91–92). `jones` (2015 edition): Exercise 12.1.11(ii) `line 2886–2887` and Exercise 12.1.15 `line 2902–2903`, printed pp. 86–87; Theorem 12.2.6 `line 2945`. `eckhardt2012` (arXiv 1208.4677v3): Hypothesis 2.1 `line 227–229`, Theorem 2.2 `line 257`, §§3–6 `line 369–823`, §11 `line 2233`. `fsss1972` (Numdam, fetched this round): Hypothesis (C) `line 230–232`, Theorem 1 `line 277–279`. The seeded targets 1.1, 1.3, 1.7, 1.8, 2.1, 2.2, 3.3, 3.5, 4.1, 4.5, 4.6, 5.2, 5.6, 5.7 and 6.4 carry no locator of their own (R05); their mathematics is in the table above.

## Not verifiable

- **Grundling, lecture packet (225 pp., SHA-256 given in the README).** Not in the sources cache, not obtainable through the service, no legal public copy identified. Every "Grundling pp. …" comparison, glyph qualification and source-error attribution in the README is unverified here; the corrected statements were tested mathematically (table), not against the text.
- **Nelson, *Analytic Vectors*, Annals 70 (1959), §10 pp. 604–606 and the single-operator theorem.** The DOI resolves to JSTOR (paywalled); recorded in `needs-references.toml` as `nelson1959`. The surface construction's arithmetic was checked independently; its attribution to §10 is not certified.
- **Weidmann, LNM 1258, §§3–6.** Paywalled Springer DOI; recorded as uncertified (`weidmann1987`). Cited by locator only, as the rules allow.
- **Ownership against open pull requests whose files the brief does not give** was not checked beyond the `roadmaps grep` index.

## Source issues

- **Misprint** in jones at Definition 12.1.13, printed p. 87 (`jones line 2899–2900`): the source says the adjoint sends ξ to η after naming σ as the representing vector; it should be that the adjoint sends η to σ; affects a stated result.
- Nothing else; Teschl, Eckhardt–Gesztesy–Nichols–Teschl and Flato–Simon–Snellman–Sternheimer were correct at every locator read.
