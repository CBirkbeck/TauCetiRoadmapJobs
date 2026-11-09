# Review of UnboundedOperators (pull request #1027 at 61a7f00)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

Four findings, all P3; none is blocking. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

**Previous review (at 6235d4a), finding by finding:**
- **R01, repaired.** The four statements asked for are in `Suggested.lean`:
  - `discreteSpectrum` and `essentialSpectrum` (`:143`, `:151`);
  - Weyl's theorem (`:348`);
  - the relatively compact perturbation theorem (`:360`);
  - the simple-eigenvalue branch (`:374`);
  - Kato's theorem (`:420`).

  Two further headlines were added: `notMem_essentialSpectrum_iff` (`:160`) and `exists_realAnalytic_eigenvalue_branches` (`:395`). The docstring names all of them (`:25–33`), and its §5.5 sentence is gone. §3.2 compares with OperatorKTheory §8.4 (`README.md:457`), and §§5.4, 5.5 and 5.7 name the declarations (`:872–874`, `:898–899`, `:916`).
- **R02, repaired.** The From Tau Ceti paragraph now lists the Kato–Rellich, resolvent, (2.44), closed-range and reducing declarations (`README.md:48–71`). They are cited at §2.1 (`:334`), Layer 3 (`:435`, `:443`), §4.1 (`:526`), §4.2 (`:544`), §5.1 (`:789`), §5.4 (`:866`) and §5.5 (`:884`). `:115–116` now reads "SA-B49–B53 (implemented at the Tau Ceti pin, above) and SA-B54–B57". One more pinned SAST result, SA-A21, is still uncited; see R02 below.
- **R03, repaired as asked.** §4.7 now uses Tau Ceti's `WithLp 2 (TauCeti.Complexification H)` and takes `A_ℂ` from G5.5-RealHilbert's `D_ℂ` (`:663–671`). The docstring gives `P_A` as the only missing carrier (`Suggested.lean:37–44`). The pairing that repair proposed has a carrier gap; see R01 below.
- **R04, repaired.** `:134–137` reads "H7 supplies the interval example built on that H6 deficiency API". §4.6 reads "consume HilbertModules H7's deficiency indices" (`:621`), and its *Needs* line names "HilbertModules H7 interval example (indices and `D_λ`)" (`:623`).
- **R05, repaired.** `:789` reads "the estimate (2.44) in the proof of Teschl (2009), Lemma 2.7, p.66 … by the range criterion for essential self-adjointness (Teschl (2009), Lemma 2.7, p.66)". `:934` adds a polar-decomposition route to the general adjoint identity.
- **R06, not repaired.** `:1469` still cites the lecture packet, which is still not in the manifest. See R03 below.
- **R07, repaired.** `exists_integralOperator` is deleted. The docstring of `integralOperator_counterexample` reads "Such an `I` exists, and `hdom` and `hact` determine it" (`Suggested.lean:256–257`).

## R01 (P3) — The conjugation and unbounded complexification that §4.7 takes from G5.5-RealHilbert live on a different type from §4.7's `H_ℂ`

**Location.**
- `README.md:163–164`: "GeneralizedCohomology G5.5-RealHilbert supplies the antilinear isometric conjugation `J(x+iy)=x−iy` of `H_ℂ`".
- §4.7, `:664–667`: "`H_ℂ=WithLp 2 (TauCeti.Complexification H)` be Tau Ceti's Hilbert complexification …, and J the antilinear isometric conjugation of GeneralizedCohomology G5.5-RealHilbert; prove that `Fix J`, Tau Ceti's `TauCeti.realPoints J`".

**Claim.**
- G5.5-RealHilbert builds J and `D_ℂ` on its own type synonym `RealHilbertComplexification H`. §4.7 applies them on `WithLp 2 (TauCeti.Complexification H)`, which is another synonym of the same underlying type.
- The pinned Tau Ceti has no conjugation on either synonym. So `TauCeti.realPoints J` (which takes a conjugate-linear endomorphism of one module), `JA_ℂ=A_ℂJ` and `A_ℂ` all mix the two types, and nothing in the roadmap identifies them.
- The two inner products are the same formula, so the gap is one missing identification, not wrong mathematics.

**Witness.**
- `TauCetiRoadmap/GeneralizedCohomology/README.md:1941–1942` on main: "construct `RealHilbertComplexification H` as a separate synonym of native `TauCeti.Complexification H`". J is defined on it at `:1946`, and `D_C` at `:1962–1965`.
- Neither `TauCeti/Analysis/Normed/Module/Complexification.lean` nor `TauCeti/Analysis/InnerProductSpace/Complexification.lean` at the pin defines a conjugation.

**Repair.**
- Add to §4.7 the target that the identity of `TauCeti.Complexification H` is a complex-linear isometric equivalence `RealHilbertComplexification H ≃ₗᵢ[ℂ] WithLp 2 (TauCeti.Complexification H)`. Both synonyms carry `⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′))`.
- Transport J and `D_ℂ` along this equivalence, and say at `:163` that G5.5's J and `D_ℂ` are used through it.
- Tested at H=ℝ: the transported J sends x+iy to x−iy, and its fixed set is {y=0}, which is ι(ℝ). On both synonyms ⟨i·1,1⟩=−i, so the identity preserves the inner product.

## R02 (P3) — Von Neumann's criterion (SA-A21) is at the Tau Ceti pin but is consumed only as a roadmap target

**Location.**
- §4.1, `README.md:526`: "Use SAST SA-A21 for the sufficient criterion that a symmetric operator with both `S+i` and `S−i` surjective is self-adjoint".
- `:117–118` lists the pinned SAST results as "SA-D17, SA-D18, SA-D20; these four implemented at the Tau Ceti pin". Together with SA-C55 these are the four meant.

**Claim.** SA-A21 is implemented at the pin, but the From Tau Ceti paragraph (`:39–111`) does not list it, and §4.1 cites only the roadmap id. This is the same kind of gap as the previous R02.

**Witness.** At the pin, `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:393` declares `LinearPMap.isSelfAdjoint_of_surjective_addSub`: a symmetric partial map with `A+i` and `A−i` surjective is self-adjoint, with density derived (`dense_domain_of_surjective_add_I`, `:365`). SelfAdjointSpectralTheory `README.md:225` defines SA-A21 as the von Neumann criterion.

**Repair.**
- Add `LinearPMap.isSelfAdjoint_of_surjective_addSub`, with its file, to the From Tau Ceti paragraph.
- At `:526`, write "SA-A21, Tau Ceti's `LinearPMap.isSelfAdjoint_of_surjective_addSub`". At `:118`, write "these five implemented".
- `LinearPMap.exists_adjoint_apply_eq_of_inner_smul_sub_eq_zero` (same file, `:122`) can be cited at §4.2's "z is a resolvent point exactly when `ker(S*−z̄)=0`" and at Layer 3's `(ran(T−λ))⊥=ker(T−λ̄)`. It says that a vector orthogonal to `ran(cI−A)` lies in `dom A†`, where `A†y=conj(c)·y`.
- Tested:
  - S=2I on ℂ: 2±i are surjective, so S is self-adjoint, as the pinned theorem gives.
  - Minimal interval momentum: deficiency (1,1), so S±i are not surjective and the criterion does not apply. This matches §4.3's warning at `:562`.

## R03 (P3) — The lecture packet is still cited for page locators but is not recorded in the sources manifest

This repeats the previous review's R06. This head does not change it, and no repair report gives a reason for leaving it.

**Location.** `README.md:1469`: "The primary course grounding is the 225-page PDF `5755 Mathematics of Quantum Mechanics notes - Grundling.pdf`, SHA-256 `d2cb7c97…`". Its locators appear throughout the layers and the Worked examples: 30 "Grundling …", 16 "physical p.…", and the Exam, Assignment and Problems I items.

**Claim.** Every cited work must be recorded in `packages/UnboundedOperators/sources.toml`. As it stands, no reader can check these locators.

**Witness.** The manifest has seven entries: teschl, kato, jones, flato-simon-snellman-sternheimer, eckhardt-gesztesy-nichols-teschl, weidmann and nelson. None has the SHA-256 `d2cb7c97…` or the file name.

**Repair.** If the operators hold the packet legally, record it as a locally held text with this SHA-256. Otherwise, remove its page locators from the layers and the Worked examples. Each target already states its mathematics with its own hypotheses, and `## Source provenance` can then describe the corrections without page numbers.

## R04 (P3) — Four definitions have Checks but no API list

**Location.**
- Layer 3 introduction, `README.md:435`: "define the point spectrum by noninjectivity of T−λ, the continuous spectrum by injectivity with dense but non-surjective range, and the residual spectrum…".
- §4.8, `:733–736`: "Build the scalar Sturm–Liouville expression `τu=w⁻¹(−(pu′)′+qu)` … Its maximal domain consists of…".
- §5.1, `:795`: "define … the solid linear domain `D_abs(K)={f∈L²:P_K|f|∈L²}`".
- §6.2, `:956`: "construct the product PVM `P_(A,B)` … define `S` as the graph closure … and `P` as the closure of `A⊙B`".

**Claim.** The README form requires every definition to list its API as prose bullets, in addition to at least three Checks. These four definitions have their Checks (`:437–441`, `:767–771`, `:797–801`, `:958–962`), but they have no `**API.**` block. Their facts are scattered through the prose.

**Witness.** The README has 16 `**API.**` blocks. None follows `:435`, `:733`, `:795` or `:956` before the next heading.

**Repair.** Add an `**API.**` block to each definition, restating facts the prose already proves:
- **Layer 3.** σ_p, σ_c, σ_r and ρ partition ℂ. For closed densely defined T, λ∈σ_r(T) implies conj λ∈σ_p(T*). For self-adjoint T, σ_r(T)=∅ and σ(T)⊆ℝ.
- **§4.8.** `T_min*=T_max`, with Green's formula. Each endpoint is limit circle or limit point, independently of the spectral parameter. The deficiency indices are determined by the endpoint types.
- **§5.1.** `D_abs(K)` is a solid subspace of the maximal domain. It equals the domain where the absolute double pairing with every L² test is finite. It is dense when almost every column `K_y` is in L².
- **§6.2.** `P_(A,B)` is a PVM on ℝ² with marginals `P_A` and `P_B`. S and P are the spectral integrals of s+t and st on their full moment domains. The closure of the intersection-domain sum is S.

Tested against the existing Checks:
- The backward shift has σ_p equal to the open disc. Its adjoint, the forward shift, has residual spectrum equal to the conjugate disc, which is the same disc.
- p=w=1, q=0 on (0,1) gives two limit-circle endpoints and indices (2,2).
- The unit-block kernel's `u_n` lie in `D_abs`.
- `M_n⊗(−M_n)` gives S strictly larger than the intersection-domain sum.

## Verified sound

**Gate and dependency check.**
- The worker's gate at 61a7f00 passes every rule (`OK`).
- My rerun of the brief's gate command, which reads the configured merge order, fails only on `depcheck: NOT IN ORDER: UnboundedOperators (insert it after its last supplier)`. That is not a finding: the candidate merge order lists this roadmap at line 10.
- The dependency check against the candidate order:

```
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

- No UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD`, excluding this folder and the family index, is empty.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives 20 `sorry` warnings, one per theorem, and nothing else.
- One scratch file `#check`s all 28 declarations. Every elaborated type matches its README statement, and no section binder is lost:
  - the Nelson theorems carry `[CompleteSpace H]` explicitly;
  - `discreteSpectrum` and `essentialSpectrum` mention only `H` and `A`;
  - the worker's `signatures.md` agrees.
- No file was changed, so there is nothing to re-check.

**One-tactic probe.**
- Each `sorry` was replaced by `first | (rfl; done) | (trivial; done) | (infer_instance; done) | (decide; done) | (simp; done) | (aesop; done) | (exact?; done) | sorry`.
- On `existsUnique_selfAdjoint_of_closed_form` and `exists_realAnalytic_eigenvalue_branches`, `simp` hit maxRecDepth and the heartbeat limit, which `first` does not catch. Those two were re-probed without `simp` and `aesop`.
- All 20 theorems stay at `sorry`. Nothing restates a definition: the two `def`s have real bodies and are needed by Weyl's theorem and the Fredholm characterization.

**Headline theorems** (README §§1–6), stated at the pins:
- §1.1–1.2: `existsUnique_spectralIntegral`.
- §1.7: `existsUnique_maximal_multiplier`.
- §2.2: `existsUnique_projValMeasure_of_normal`.
- §2.5: `existsUnique_jointProjValMeasure`.
- §2.6: `existsUnique_projValMeasure_of_unitary_representation`.
- §3.2: `notMem_essentialSpectrum_iff`.
- §3.3: `exists_spectralType_decomposition`.
- §4.2: `resolventSet_alternatives_of_isClosed_symmetric`.
- §4.7: `existsUnique_selfAdjoint_of_closed_form` and `friedrichs_extension_extremal`.
- §5.1: `integralOperator_counterexample`.
- §5.3: `nelson_essential_selfAdjoint` and `nelson_resolvent_commute`.
- §5.4: Weyl's theorem and the relatively compact perturbation theorem.
- §5.5: the holomorphic branch and the Rellich branches.
- §5.7: Kato's theorem.
- §6.2–6.3: `existsUnique_tensorSum` and `existsUnique_tensorProd`.

Named in the docstring as not statable, and confirmed:
- **P_A (SA-E01).** At the pin, `ProjValMeasure.map` is the only constructor of a PVM. There is no PVM of a bounded normal or unbounded self-adjoint operator: `StarAlgHom.representationBorelOperator` gives bounded operators only, not a `ProjValMeasure`.
- **Sturm–Liouville.** There are no minimal or maximal Sturm–Liouville operators.
- **Nelson's surface.** There is no translation surface.

**Adversarial table.** Conventions throughout: inner products are conjugate-linear in the first slot, `R_A(z)=(zI−A)⁻¹` (Tau Ceti), Teschl's `R_A(z)=(A−z)⁻¹` (`teschl line 3048`), `U(t)=exp(itA)` and `N₊=ker(S*−i)`.

| Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|
| A01–A02 `existsUnique_spectralIntegral` (sampled §1.2) | H=0; X=∅; atoms 0,1 on ℂ², x=(1,2), f=(2,i); counting ℕ₊, f=n | X=∅: I=P(∅)=0, so H=0; f[P]x=(2,2i) with ‖·‖²=8=4·1+1·4, but ∫f²dμˣ=4−4=0; adjoint diag(2,−i)=conj f; Σn⁻²=π²/6 vs Σn²n⁻²=∞ | true |
| A03 (sampled) | A=M_n, f=λ, g=−λ; f=λ, g=0 | dom f∩dom g=D(M_n)⊊ℓ²=dom(f+g)[P]; dom(f[P]0[P])=ℓ²; dom(0[P]f[P])=D(M_n)=D_g∩D_fg, matching (3.39) | true |
| A05 (sampled) | A=aI, a<b; diag(0,1) | E(a)=E(b)=I, so P((a,b])=0 and P([a,b])=I; left-continuous E(t)=1_{t>a} gives P((a,b])=I; E(1)−E(0)=diag(0,1) | true |
| A06 (sampled) | diag(0,1); M_x on L²(0,1) | P((λ−ε,λ+ε))≠0 ∀ε iff λ∈{0,1}=σ; 1_(λ−ε,λ+ε)∩(0,1)≠0 iff λ∈[0,1]=σ | supp=σ |
| A07 `existsUnique_maximal_multiplier` | μ=0; one point, f=i; counting ℕ₊, f=n | Lp=0; T=iI, T*=−iI, so the realness premise fails; x=1/n²: Σ\|n·n⁻²\|²=π²/6 ∈ dom; 1_{\|f\|≤n}x→x needs no σ-finiteness | true |
| A08 (sampled) | L²[0,1], h=1_{0}; M_x, h=x², ψ=(1+\|x\|)⁻² | h gives the zero operator, σ={0}, raw range {0,1}; ∫x²(1+\|x\|)⁻⁴<∞ but x²ψ→1 is not in L² | true |
| B01 (sampled) | diag(1,i); iM_n; [[0,1],[0,0]] | N*N=NN*=I, Re=diag(1,0), Im=diag(0,1); Re(iM_n)=0 on H vs the algebraic part on D(M_n), xₙ=1/n; N*N=diag(0,1)≠diag(1,0)=NN* | true |
| B02 `…_of_normal` | diag(1,i); [[0,1],[0,0]] | ‖Ne₂‖=‖N*e₂‖=1, P with atoms 1,i; ‖Ne₂‖=1≠0=‖N*e₂‖, so `hnorm` fails | true |
| B03 (sampled) | Nelson surface, u∈C_c∞((0,1)²), pullback convention | e^{−Y} moves the support up to (0,1)×(1,2), where x-translation is 1-periodic, so e^{−X}e^{−Y}u⊂(0,1)×(1,2); e^{−Y}e^{−X}u⊂(1,2)×(0,1), disjoint; e^Xe^Yu and e^Ye^Xu⊂(2,3)×(2,3) | true; strong commutation fails, against (4.24), p.117 |
| B03a (sampled) | completed surface | V−E+F=2−16+8=−6, g=4; cone angle 8·4·π/2−4·π/2=14π; Σ(2π−θ)=0+(2π−14π)=−12π=2π·(−6); unglued 16−24+8=0; chart θ/7 | all numbers match |
| B04 `existsUnique_jointProjValMeasure` | n=0; diag(0,1),diag(2,3); Pauli X,Z | Fin 0→ℝ is a point; atoms (0,2),(1,3); (i−X)(i+X)=−2, so R_X(i)=−(i+X)/2 and [R_X(i),R_Z(i)]=[X,Z]/4≠0, so `hcomm` fails | true |
| B05 multiparameter Stone | n=0; A=diag(0,1) | U(0)=U(0)² unitary, so U(0)=I and P is the point mass; ⟨e₂,U(t)e₂⟩=e^{it}, atom at 1; exp(−i…) would put it at −1 | true |
| C02 `discreteSpectrum`/`essentialSpectrum` | diag(0,1); 0 on ℓ²; diag(1/n); rational diagonal | σ_ess=∅; {0} (dim ker=∞); {0} (0 is not an eigenvalue); ℝ (no isolated point); without isolation, ℝ∖ℚ | true |
| C02 `notMem_essentialSpectrum_iff` | A=P rank one on ℓ², z=1, 0, i; rational diagonal at q | z=1: dim ker=1, range (ran P)⊥ closed, codim 1, and 1∉σ_ess; z=0: dim ker=∞, both sides false; z=i: ker 0, range H; q: range not closed, q∈σ_ess | true both directions |
| C03 `exists_spectralType_decomposition` | diag(0,1); M_x on L²[0,1]; Cantor | H_pp=ℂ²; H_ac=H; H_sc=H; μ^{x+y}≤2(μˣ+μʸ); x=P(B_pp)x+P(B_ac)x+P(B_sc)x | true |
| D01a `resolventSet_alternatives…` | 2I; half-line; interval; H=0 | ℂ∖{2}; \|e^{iz̄x}\|=e^{(Im z)x} is L² iff Im z<0, so ρ={Im z>0}; ρ=∅; ρ=ℂ | all four alternatives occur |
| D01 / R02 von Neumann criterion | S=2I; minimal interval momentum | 2±i surjective, so self-adjoint; e^{∓x}∈ker(S*∓i), so S±i are not surjective | pinned theorem applies; R02 |
| D03 (sampled) | J=conj ψ(−x) with i∂; plain conjugation K | AJψ=JAψ=−i conj ψ′(−x); AKψ=i conj ψ′ but KAψ=−i conj ψ′ | commute vs anticommute |
| D05 (sampled) | φ₊=Ce·e^{−x}, φ₋=Ceˣ, C²=2/(e²−1) | ‖φ₊‖²=C²e²(e²−1)/(2e²)=1; u(0)=C(1+eλ), u(1)=C(λ+e); \|λ+e\|²=\|1+eλ\|²=1+e²+2e Re λ; λ=1 gives θ=0, λ=−1 gives −1; half-line (1,0) | true |
| D06 `existsUnique_selfAdjoint_of_closed_form` | ℂ, j=id, q=2ūv; j=2id, q=ūv; q=0, α=1,2 | conj h=2 conj u gives A=2I; 2 conj(h)v=ūv and x=2u give A=I/4; A=0 for both α | true |
| D06 `friedrichs_extension_extremal` | −d² on C_c∞(0,1), T=Neumann, t=−1, vector 1 | ⟨1,R_T(−1)1⟩=−1; u=1−cosh(x−½)/cosh(½), ∫u=1−2tanh½=0.0758, so ⟨1,R_SF(−1)1⟩=−0.0758; −1≤−0.0758 | R_T≤R_SF; `(·−t)⁻¹` reverses it |
| D06 / R01 carriers | H=ℝ | J(x+iy)=x−iy, Fix J={y=0}=ι(ℝ); ⟨i(x+iy),w⟩=−i⟨x+iy,w⟩ on both synonyms | same formula, different types; R01 |
| E01 `integralOperator_counterexample` | fₙ=n⁻¹1_[0,n]; y∈ℂ | ‖fₙ‖₂²=n·n⁻²=1/n, ∫fₙ=1, so (0,1)∈cl(graph); f↦ȳ∫f is continuous iff y=0, so `adjoint.domain=⊥` | true |
| E02 (sampled) | 2I, x=1; M_n, xₙ=1/n | Σ2ⁿrⁿ/n!=e^{2r}; x∉D(M_n); FSSS p.424: some t>0 with Σtⁿ‖Xⁿy‖/n! convergent | true |
| E03 `nelson_*` | k=1, 2I, C=R=2; iI; Pauli at e₁; k=0 | (1,2),(2,4),(4,16); ⟨i,1⟩=−i≠i, so `hsym` fails; [X,Z]e₁=e₂ and [Z,X]e₁=−e₂, so `hcomm` fails; k=0 vacuous | true |
| E04 Weyl (sampled §5.4) | A=0, B=P rank one; B=I | (i−P)⁻¹=P/(i−1)−i(I−P), so R_0(i)−R_P(i)=((1−i)/2)P, rank one, σ_ess={0} for both; B=I: ((1−i)/2)I, not compact, σ_ess {0}→{1} | true |
| E04 `isSelfAdjoint_add_and_essentialSpectrum_eq` | A=0, V=P; V=I | V·R_A(i)=−iP compact, σ_ess(P)={0} (1 is discrete); V=I gives −iI, premise fails | true |
| E04a `exists_analytic_eigenvalue_branch` (sampled) | A=diag(0,1), B=[[1,1],[1,0]]; A=2I, B=3I | λ²−(1+z)λ+z−z²=0, λ=((1+z)−√(1−2z+5z²))/2=z−z²+O(z³), λ′(0)=1=⟨e₁,Be₁⟩; A−zB gives −1; R=1/(w−2−3z) and R(I−zBR_A)⁻¹ agree | true |
| E04a `exists_realAnalytic_eigenvalue_branches` | A=0 on ℂ², B=diag(1,−1), m=2; B=0 | branches ±t with v=e₁,e₂, σ∩ball={t,−t}; ordered −\|t\|,\|t\| not analytic; B=0: λ≡λ₀ | true |
| E06 Kato (sampled) | V=0; ‖u‖∞≤C‖u‖^{1/4}‖Δu‖^{3/4}; V₂=\|x\|⁻¹1_{\|x\|<1} | u(λx) scales both sides by λ⁰ (λ^{−3/8}·λ^{3/8}); R²=‖Δu‖/‖u‖ balances R^{3/2}‖u‖=R^{−1/2}‖Δu‖; ∫_{\|x\|<1}\|x\|⁻²=4π, so V₂∈L²; ⊤=ω trap, ∞ used | true |
| F01–F03 `existsUnique_tensorSum/Prod` | 2I,3I; H=0; M_n,−M_n, x=Σn⁻¹eₙ⊗eₙ; ℕ₊ and {0}∪{1/n} | 5I, 6I; ∅=∅; s+t=0 on atoms, Σn²n⁻²=∞ and Σn⁴n⁻²=∞; raw products ℚ_≥0 vs [0,∞) | closures needed; true |
| F04 (sampled) | A=2I, B=3I, x=y=1 | Σ5ⁿtⁿ/n!=e^{5t}=e^{2t}e^{3t} | true |
| R04 definitions | backward shift; p=w=1, q=0 on (0,1) | (1,z,z²,…) has ‖·‖²=1/(1−\|z\|²) iff \|z\|<1; residual spectrum of the adjoint is the conjugate disc; both endpoints limit circle, indices (2,2) | API bullets consistent |

**Sources read at their locators (the seeded sample).** For `teschl`, printed page = PDF page − 12, and every locator below is on its stated printed page:
- (3.14) and the inverse construction p.89 (`teschl line 3633`, `3643–3644`); normality p.91 (`3746–3749`); (3.23) p.91 (`3715`).
- Theorem 3.2 and (3.29) p.92 (`3752–3758`); Lemma 3.5 with (3.38)–(3.39) p.94 (`3869–3872`); Theorem 3.7 p.96 (`3983`).
- Theorem 3.8 and Corollary 3.9 p.97 (`4015–4032`); Problems 3.10–3.11 p.99 (`4088–4090`); (3.67), Lemmas 3.11–3.12 p.101 (`4194–4206`).
- Theorem 3.18, (3.83) and Lemma 3.19 p.105 (`4376–4393`); Theorem 2.28 p.83 (`3413`); Problem 2.27 p.84 (`3453`, the `+i` sign).
- Lemma 4.5 p.116 (`4926`); Lemma 4.9, (4.24) and Problem 4.2 p.117 (`4967–4987`).
- Theorem 4.14, (4.43)–(4.44) p.121 (`5134–5156`); Theorem 6.4 p.135 (`5704`).
- (6.27)–(6.28) and Lemma 6.17 p.145 (`6256–6281`); Lemma 6.18 and Theorem 6.19 p.146 (`6313–6324`); Lemmas 6.22–6.23 p.148 (`6368–6385`).
- Lemma 10.1 p.221 and Theorem 10.2 p.222 (`9562–9589`). Theorem 10.2 assumes the bounded part vanishes at infinity, which §5.7 says, together with why a nonvanishing bounded part still has relative bound zero.

Other sources:
- `flato-simon-snellman-sternheimer`: analytic vectors p.424 (`54–62`), Hypothesis (C) p.428 (`230–232`), Theorem 1 p.430 (`277–279`).
- `jones`: Exercises 12.1.11(ii) p.86 and 12.1.15 p.87 (`2883–2903`).

The seeded sample (15 targets):
- **Supported as written:** §§1.2, 1.3, 1.5, 1.6, 1.8, 2.1, 4.4, 4.6, 5.2, 5.4 and 5.7.
- **§2.3:** the Teschl locators hold, and the Nelson part is uncertified.
- **§2.4:** has no external locator; its numbers are computed in the table.
- **§5.5:** Kato is uncertified; the statements were checked mathematically in the table.
- **§6.4:** the Teschl locator holds, and Nelson is uncertified.

**Library declarations opened at the pins.** One `#check` file (Mathlib 1b1ccf4, Tau Ceti 2fd255d); every name below resolves.
- Mathlib: `LinearPMap.adjoint`, `adjoint_graph_eq_graph_adjoint`, `adjoint_isClosed`, `smul_domain`, `HasCore`, `HilbertBasis.repr`, `IsCoercive.continuousLinearEquivOfBilin`, `banach_steinhaus`, `InnerProductSpace.rclikeToReal`, `TensorProduct.instInnerProductSpace`, `UniformSpace.Completion.innerProductSpace`, `LinearMap.IsSymmetric.continuous`, `LinearMap.continuous_of_isClosed_graph`, `ContinuousLinearMap.ofIsClosedGraph`, `ContinuousLinearMap.isPositive_iff_complex`, `ContinuousMap.toLp_denseRange`, `polynomialFunctions.topologicalClosure`, `fourierBasis`, `Measure.absolutelyContinuous_iff_withDensity_rnDeriv_eq`, `MeasurableEquiv.piFinTwo`, `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `InnerProductSpace.instLaplacian`, `InnerProductSpace.rankOne`, `IsCompactOperator`, `AbsolutelyContinuousOnInterval`, `IsContinuousRiemannianBundle`, `LindelofSpace`.
- Tau Ceti, with files and lines:
  - `IsResolventAt`, `IsResolventAt.unique`, `resolventSet`, `spectrum` (`Resolvent/Basic.lean:75`, `:129`, `:140`);
  - `TauCeti.LinearPMap.analyticAt_resolvent` (`Resolvent/Analytic.lean:58`);
  - `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, `spectrum_subset_im_eq_zero`, `IsFormalAdjoint.adjoint_resolvent_eq`, `IsSelfAdjoint.adjoint_resolvent` (`LinearPMap/Resolvent.lean:70`, `:76`, `:89`, `:114`);
  - `IsFormalAdjoint.norm_smul_sub_sq`, `isClosed_range_smul_sub`, `isSelfAdjoint_of_surjective_addSub` (`SelfAdjoint.lean:155`, `:216`, `:393`);
  - `IsRelativelyBounded` (`RelativeBound.lean:56`). It has no `b<1` field, so the Lean eigenbranch hypotheses are as general as the README's, or more.
  - `add_of_isRelativelyBounded` (`KatoRellich.lean:118`);
  - `IsReducing`, `IsReducing.isSelfAdjoint_restrict` (`Reducing.lean:59`, `:144`);
  - the `WithLp 2 (Complexification X)` instances, `complexification_norm_toLp_ofReal` and `complexifyL2_comp` (`InnerProductSpace/Complexification.lean:108`, `:136`, `:260`); `realPoints` (`LinearAlgebra/Complex/Conjugation.lean:128`);
  - the `ProjValMeasure` API names of `README.md:82–100`; `riemannianVolume` and `eq_riemannianVolume_iff` (`VolumeDensity/Volume.lean:82`, `:93`);
  - the four cellular declarations of §2.4; `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`;
  - `continuousAt_zero_iff_domain_eq_top` and `continuous_iff_domain_eq_top`. These are in namespace `TauCeti.Semigroups.StronglyContinuousSemigroup` (`UniformlyContinuous.lean:233`, `:249`).

**Cross-roadmap citations resolved.** Main at dcf5cfe; OperatorKTheory at its open head.
- SelfAdjointSpectralTheory: SA-A21 (`:225`), B14, B21, B25, B39, B40, B44, B45, B49–B57, B85, C39 (`:888`), C55 (`:929`), D17, D18, D20 (`:1103–1109`), E01, E05–E08 (`:1202–1217`), E26, E29, E43 and E44 (`:1316`).
- HilbertModules: H6 (`:705`) and H7 with the interval example (`:762`, `:794–806`).
- VonNeumannAlgebras: V2.RectangularL2 (`:634`); V10.ClosedOperators (`:2249`), with the Rudin 13.30 spectral representation and the interval derivatives; V10.Affiliation (`:2305`), with the product rule.
- BanachSpaceTheory B5: `hilbertBasis_lift_mk_eq` and `nonempty_linearIsometryEquiv_iff_lift_mk_eq` (`Suggested.lean:159`, `:165`).
- GeneralizedCohomology G5.5-RealHilbert (`:1939`; R01). OperatorKTheory §8.4 (`README.md:2088`; `essentialSpectrum` at `Suggested.lean:86`, namespace `TauCetiRoadmap.OperatorKTheory`).
- BanachAlgebras Layer 2 §2.1 (`:442`); PDE §§1.1, 1.3, 1.4 and 1.6 (`:677`, `:769`, `:803`, `:905`); LieGroups Layers 2 and 5 (`:356`, `:518`).
- PolarDecomposition PD-B23, B29, B32 and B34 (`:371–393`); OperatorAlgebraDynamics D8 (`:12`, `:693`); Completed/OrthogonalL2Bases Parts A and D.
- The resolver's one lead, `applyWord`, is `CommonInvariantDomain.applyWord` at `Suggested.lean:297`.

**Ownership and overlaps.**
- The overlap listing reports no other pull request changing this roadmap, no dropped ids, and no ids only an open revision defines. I confirmed all three.
- `roadmaps grep` over main and the open heads, for essential spectrum, Weyl's theorem, Friedrichs extension, Kato–Rellich, relatively compact, analytic vectors and holomorphic families:
  - OperatorKTheory owns the bounded Fredholm essential spectrum. It is a different carrier, and §3.2 now compares the two.
  - ToeplitzOperators uses bounded essential spectra.
  - QuantumFoundations, RelativisticQuantumFieldTheory, CongruenceSpectralGap, PositiveMass, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and VariationalMethods cite this roadmap as consumers and own none of its objects.
- No other `Suggested.lean` uses the namespace `TauCetiRoadmap.UnboundedOperators`.
- At the pin, the Cayley, compact-resolvent, pair-shift and graph-core files do not state any target of this roadmap. The one pinned result left uncited is R02.

**README form.**
- No LaTeX delimiters, `lemma`, `set_option`, pull-request number or machine path.
- Every layer ends with Examples and Dependencies.
- Imports are `import Mathlib` plus three existing `TauCeti.*` modules.
- Every Lean name of the file appears in the README.

## Not verifiable

- **The 225-page lecture packet** (`README.md:1469`). It is in neither the manifest nor the sources cache. Every Grundling, Exam, Assignment and Problems I page locator is unchecked; the mathematics stated beside them was tested where the table shows it. See R03.
- **Nelson (1959), Kato (1995) and Weidmann (1987).** All three are settled as uncertified and cited by locator or section only. The §2.3 supports and the §5.5 branch statements were checked mathematically in the table.
- **Eckhardt–Gesztesy–Nichols–Teschl.** §4.8 is outside the seeded sample, and its arXiv locators were not reread this round.

## Source issues

- **Misprint** in jones at Definition 12.1.13, printed p.87: the source says that, for ξ in the adjoint domain, one defines T*ξ = η, after naming the domain vector η and its representative σ; it should be T*η = σ; affects nothing.
- **Misprint** in teschl at Theorem 4.14 (proof), printed p.121: the source says the test vector is ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{1,k}; it should be ψ_k = ψ_{1,k} ⊗ ⋯ ⊗ ψ_{n,k}; affects nothing.
- **Gap** in teschl at Theorem 4.14 (proof), printed p.121: the source says Weyl sequences with (A_j − λ_j)ψ_{j,k} → 0 give (P − λ)ψ_k → 0 for a polynomial P of degree N; it should use vectors in the ranges of P_{A_j}((λ_j − 1/k, λ_j + 1/k)), since for N ≥ 2 the first-order condition does not control the higher powers; affects the proof.
- **Misprint** in teschl at Lemma 6.22 (proof), printed p.148: the source factors K R_A(λi) as (K R_A(i))((A + i) R_A(λi)) with R_A(z) = (A − z)⁻¹; it should be (A − i) R_A(λi), the printed product differing by a sign already for A = 0; affects nothing.
