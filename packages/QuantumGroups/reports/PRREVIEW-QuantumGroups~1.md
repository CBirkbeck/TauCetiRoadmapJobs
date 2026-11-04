# Review of QuantumGroups (pull request #1649 at d7a6c54)

**Verdict:** needs changes

:robot: Independent AI review. This is the requested whole-folder review, including inherited content. The actual diff adds only Q1.ClassicalMultipliers and its scope qualification; it does not replace the existing roadmap. No pull-request files were changed.

## R01 (P1) — Replace admitted coproduct and basis data

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:249` and `:266`: `quantumSL2Comul` and `quantumSL2PBWBasis`.

**Claim:** These declarations supply an algebra homomorphism and a basis, with subsequent theorems about their values.

**Witness:** Both data bodies are `by sorry`; the generator and basis evaluation theorems depend on those admitted objects. The gate records two `sorry-data` failures.

**Repair:** Delete both admitted definitions and their dependent statements. State existence of a coproduct satisfying the three generator equations and existence of a basis whose values are the PBW monomials. Keep the genuine quotient, generators and K unit. A scratch existential PBW signature elaborated against the pins. At q=1/2 its (0,0,0) monomial is 1 and its (0,−1,0) monomial is K⁻¹; no placeholder basis is needed. Keep heavy Hopf construction in the README.

## R02 (P1) — Resolve the obsolete Temperley–Lieb supplier sections

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:43`, also `:599`: “TemperleyLiebOperatorAlgebras A1–A6”.

**Claim:** Those sections supply the positive quotient, trace and unitary tensor category used in Q7.

**Witness:** The supplied open head has Layers 1–4, not A1–A6: `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md:348`, `:1106`, `:1223`, `:1396`.

**Repair:** Cite §§1.1–1.4 for the Hermitian forms/quotients/finite models, §2.1 for sign comparison, and §§3.1–3.4 for the unitary category and fusion. Resolve each actual input separately. At q=1/2 the signed loop is −5/2 and the positive loop is 5/2; §2.1, rather than a nonexistent A-section, supplies the sign comparison. The algebraic diagrams and Jones–Wenzl objects remain TemperleyLieb Layers 0–7. This is supplier drift, not a missing mathematical theory.

## R03 (P2) — Resolve the four backward supplier edges reported by the gate

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:40` through `:43`.

**Claim:** The existing QuantumGroups roadmap consumes VonNeumannAlgebras, HilbertModules, CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras.

**Witness:** The required dependency command reports four `UPWARD` lines with QuantumGroups marked “on main”; all four suppliers are absent from the supplied content main.

**Repair:** Resolve ownership/placement of these exact interfaces before accepting this folder: supply the needed foundations earlier, or put new work requiring them in a Part II after its suppliers, retaining the existing roadmap. Do not edit ORDER.txt as a content repair. These edges are inherited, and the brief also lists these suppliers as allowable earlier work; this discrepancy needs explicit resolution by the worker/operator. Re-run the dependency gate and require those four lines to disappear or an explicit tooling correction. The interface checks below establish what the four edges actually consume; scalar and two-dimensional tests do not remove their analytic/category prerequisites.

The separate `CYCLE among: CategoricalOperatorAlgebras, QuantumGroups, TemperleyLiebOperatorAlgebras` line is a **false positive on the inspected supplied heads**. CategoricalOperatorAlgebras names QuantumGroups as its downstream consumer at lines 54 and 1624; TemperleyLiebOperatorAlgebras consumes CA1a/CA2a at lines 1290 and 1323 and has no QuantumGroups supplier citation. The actual foundation direction is CA1a/CA2a → TL Layer 3 → Q7, with Q6 also consuming CA1a/CA2a. No actual circular proof input was found. Do not move mathematical ownership merely to erase that scanner line.

## R04 (P2) — State the available headline theorems

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:701` and `Suggested.lean:21`.

**Claim:** Q8 proves complete reducibility of every finite-dimensional generic U_q(sl₂)-module, the full center theorem and PBW, among its main outcomes.

**Witness:** The file states only Casimir commutation; it has no complete-reducibility or center-generation theorem. A scratch complete-reducibility signature elaborated with native `IsSemisimpleModule` on the existing quotient.

**Repair:** Add complete reducibility with q≠0, non-root-of-unity, complex module, U_q-module, scalar-tower and finite-dimensional hypotheses. State PBW existentially as in R01 and the center-generation theorem on the actual quotient. Audit the other headlines listed below: state those needing only short genuine definitions; name every remaining headline and its missing carrier in the module docstring. Do not replace a classification with unrelated equations. The scratch complete-reducibility statement retains all hypotheses; at q=1/2, L₀⁻ and L₁⁺ are included, and their direct sum has dimensions 1+2=3 and is semisimple. Zero-dimensional modules are also included and semisimple.

## R05 (P2) — Consume the generic commutative pullback theorem

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:86`: “Prove nondegeneracy by compact-set cutoffs”.

**Claim:** Q1 reconstructs the pullback/nondegeneracy/strict-extension machinery for multiplication, inversion, diagonal restriction and the two unit slices.

**Witness:** `TauCetiRoadmap/CStarAlgebras/README.md:251`–262, C1.CommutativeMultiplierMorphisms, already owns general continuous pullbacks, compact-cutoff nondegeneracy, properness and composition through multiplier extensions.

**Repair:** Import that named target in the exact supplier contract and specialize it to these continuous maps. Keep the group-specific coproduct, counit, antipode and comparison identities here. Do not re-plan the generic cutoff proof. For G=ℤ and f=1_{0}, this specialization gives Δf(m,n)=1_{m+n=0}, a bounded multiplier that is not in c₀(ℤ²), and both inverse composites equal the constant 1. Thus the intended mathematics survives the ownership repair.

## R06 (P3) — Restore the definition APIs, discriminating Checks and local dependencies

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:13`, `:79`, `:168`, `:476`, `:634`.

**Claim:** The prose describes an implementable layered library.

**Witness:** There are zero `*Needs:*` lines, zero `**Checks.**` blocks, and no per-layer Examples/Dependencies sections. Q1.ClassicalMultipliers has no three-test suite.

**Repair:** Use the required scope/conventions/contracts/build/layer headings and opening Summary. Give each definition its API bullets and at least three discriminating Checks; attach dependencies to individual targets and end every layer with Examples and Dependencies. For the new definition use the trivial group, ℤ with 1_{0}, and S₃ with an ordered-product indicator: they respectively give scalar identities, a multiplier outside C₀, and distinguish gh from hg. The table below supplies numerical/sign controls for the other layers. Preserve the full scope while restructuring.

## R07 (P3) — Supply identifiable, claim-level source locators

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:116`–119 and `:857`–916: “Rieffel main pp122–125 / archive 0210_001 pp20–23”.

**Claim:** This identifies the source of the sampled classical multiplier diagrams; the final source list supplies the other targets.

**Witness:** Rieffel has no title, year, theorem/section identifier or retrievable link in the README references. The sources service could not identify the citation or the archive filename.

**Repair:** Give a complete bibliographic identity, legal URL and exact section/equation or theorem locator, explaining the printed/archive page correspondence. Record it under one source key. Attach precise locators to theorem claims throughout Q1–Q8, including original extensions with a clear derivation from cited inputs. Record all works in sources.toml when authoring; this read-only review did not edit a manifest. The ℤ and S₃ computations below validate the formulas independently, but cannot certify what the unidentified Rieffel text says. No theorem number can honestly be reported for this sample yet.

## R08 (P3) — Use the required import header

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:5`–19.

**Claim:** The file is the pinned acceptance test.

**Witness:** It has 13 `Mathlib.<submodule>` imports, no `import Mathlib`, and begins with a Tau Ceti import. These are the gate's `imports`, `mathlib-subimports` and `no-import-mathlib` failures.

**Repair:** Replace the Mathlib subimports with one initial `import Mathlib`, followed by only used individual TauCeti modules. Re-elaborate at the pins. The original header does elaborate, so this is a form failure, not a failed-build finding.

## R09 (P3) — Replace process and commit-pinned roadmap links

**Location:** `TauCetiRoadmap/QuantumGroups/README.md:43`, `:48`, `:49`.

**Claim:** These identify the TemperleyLieb, AmenableGroups and PivotalSpherical suppliers.

**Witness:** The first two contain pull-request references; the third links a historical roadmap commit. The gate reports two `prnum` failures and one `blob` failure.

**Repair:** Link repository-relative roadmap paths and cite resolved section names. TemperleyLieb Layers 0–7 and PivotalSpherical Layers 0–2,7 resolve on main. For AmenableGroups cite Layer 1 for means, Layer 5 for the discrete Følner criterion and Layer 7 for the locally compact formulation. The discrete ℤ Følner test |((F_N+1)△F_N)|/|F_N|=2/(2N+1)→0 then points to its actual owner.

## R10 (P3) — Remove padding and definitions unused by headlines

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:35`–68 and `:173`–179.

**Claim:** The category helpers and `freeOrthogonalCup_zigzag` belong in the acceptance test.

**Witness:** No theorem in this file uses FiniteHopfModuleCat or its functors. The zigzag theorem is precisely the (j,k) entry of its matrix hypothesis; its existing proof only extracts that entry.

**Repair:** Delete these declarations from `Suggested.lean`; keep the mathematical targets and the zigzag Check in the README. Do not replace the zigzag admission/proof with a longer proof in place. With F=[[0,1],[−2,0]], F·bar(F)=−2I and the displayed sum is −2 on the diagonal and 0 off it: the conclusion adds no content to the hypothesis. None of the eight sorried theorems closed with the tested single `simp` tactic, so this finding does not label those eight as one-tactic padding.

## R11 (P3) — Align the Lean namespace, documentation and README names

**Location:** `TauCetiRoadmap/QuantumGroups/Suggested.lean:21`–31, `:45`, `:229`, `:243`, `:271`, `:279`.

**Claim:** The file documents and names the roadmap's target signatures.

**Witness:** The namespace is `QuantumGroups`, not `TauCetiRoadmap.QuantumGroups`; several declarations lack docstrings, and names such as `schur_orthogonality` and `quantumSL2Casimir_commute` do not occur in the README.

**Repair:** Use the required namespace and module-docstring form, document each retained declaration, add layer comments in README order, and mention each retained Lean name beside its mathematical statement. Remove unused definitions rather than documenting a catalogue. Re-run all signature checks after renaming. This does not require changing the verified column-coaction or antipode conventions.

## Verified sound

**Verification limits.** The rows below are computed adversarial instances and algebraic consistency checks, not proofs of all the general theorems. No false mathematical identity was found in the target under the stated standing hypotheses. The blockers above concern admitted data, missing acceptance statements, supplier drift/order and duplicated ownership. Inherited content is explicitly included because this job requests a full review.

**Gate/build/scope.** HEAD is d7a6c540ec8968b4f9f18f46428f9787e76176e4. The outside-folder diff is empty. The recorded targeted build passes; the complete recorded gate is FAIL. After building `TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive`, `lake env lean` on the requested original file exits 0 with ten `sorry` warnings and no other warnings. No `set_option`, admitted examples, computational algorithm target, source-text dump or extra changed file was found. The diff preserves the pre-existing roadmap; this is not a rejection for wholesale re-planning.

I read the repository README's normative writing section and CONTRIBUTING, and main's PivotalSpherical, RepresentationTheory/CompactGroups and Completed/OrthogonalL2Bases for shape. The supplied content checkout HEAD equals its origin/main, fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. Mathlib and Tau Ceti checkout hashes match lake-manifest.json: 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

**Elaborated context and padding probes.** A scratch copy appended `#check @...` for all 31 named top-level declarations and elaborated successfully. The generated name of the anonymous category instance was also checked explicitly, giving 32 elaborated top-level declarations in total. The Schur theorem retains star/scalar compatibility, the comodule instance, orthonormal basis and simple-subcomodule hypothesis; finite dimensionality follows from the finite basis. The coproduct retains `Fact (q ≠ 0)`; PBW and Casimir retain both parameter hypotheses. AlgebraicHaar and the relation predicates drop unused section instances, but every retained theorem requiring StarModule explicitly retains it. No lost-hypothesis counterexample was found and no file was changed. Eight separate admitted theorem bodies were replaced by the single tactic `simp` in a scratch copy; all eight failed to close, as expected for nontrivial equations/existence. The two admitted data bodies were left distinguishable in that probe. The complete-reducibility and existential-PBW repair signatures separately elaborate with `sorry` only.

**Headlines and acceptance coverage.**

| README headline | Acceptance-file assessment |
| --- | --- |
| Q1.ClassicalMultipliers: nondegenerate coproduct, counit and inverse multiplier diagrams | Pointwise maps on native C₀ and multiplier carriers are meaningful; the complete tensor-comparison headline also needs the C5 completed minimal tensor carrier. It is not accounted for in the module docstring. |
| Q1 Haar existence/uniqueness, including arbitrary nonseparable compact quantum groups | Missing native completed minimal C*-tensor/CQG carrier; name it and this missing carrier explicitly in the docstring. |
| Q2 arbitrary-Hilbert complete reducibility and analytic Peter–Weyl density | Missing analytic free-Hilbert-module/coaction carrier; name both headlines explicitly. |
| Q3 Hopf core, weighted Schur orthogonality, Plancherel and modular/Kac comparison | Algebraic Schur orthogonality is stated. Core construction, analytic completion and Tomita comparison are not; identify the missing analytic carriers. |
| Q4 compact-type characterization, universal/reduced completions and coamenability criteria | The analytic completion comparisons lack carriers. The algebraic characterization can use native comodules plus genuine star/positivity definitions; audit it separately rather than declaring the whole layer unstatable. |
| Q5 SUq(2) and free orthogonal universal presentations | Only generator relations and their consequences are stated; universal C*-algebra constructions are missing carriers, not those relation predicates. |
| Q6 Tannaka–Krein reconstruction and commutative reconstruction | Missing C*-tensor category/fiber-functor and analytic CQG carriers; name these headlines and carriers. |
| Q7 fusion, Haar laws, dimensions and coamenability of SUq(2)/O_F⁺ | Missing constructed analytic quantum-group carriers; none is replaced by a valid headline in the file. |
| Q8 PBW/domain and full center theorem | The quotient exists. PBW is currently forced through admitted data; domain/center generation are not stated. |
| Q8 signed finite-simple classification and finite complete reducibility | Native quotient, modules, linear maps and finite-dimensionality exist; complete reducibility was scratch-elaborated. Classification needs the actual ladder modules, not free predicates. |
| Q8 locally finite/type-1 classification, tensor/dual/CG and spherical structure | Native algebraic modules exist; use small genuine weight/local-finiteness predicates where sufficient. Heavy new monoidal structure must be documented, not admitted as data. |
| Q8 compact-real and classical comparisons | Compact comparison lacks its analytic SUq carrier; classical finite-module comparison needs the actual family and LieModule adapter. These are absent from the docstring's per-headline accounting. |

**Computed adversarial table.** Indexing is 0-based for two-by-two matrices. Unless indicated otherwise q=1/2, the fundamental SUq matrix is [[a,−q c*],[c,a*]], and F=[[0,1],[−2,0]], so F·bar(F)=−2I. “Pass” means the listed instance agrees; the Change column records the corresponding review action, not an edit made here.

| Statement | Instances tried | Values on the two sides / positive and negative controls | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: column coefficients and tensor order | C₃ character z=e^(2πi/3); S₃ permutation module | δ(e_j) has column j; Δu_ij(g,h)=Σ_k u_ik(g)u_kj(h); for g=(12),h=(23), u_13(gh)=1 while u_13(hg)=0 | Pass | Keep order Check |
| Conventions: matrix star versus entrywise star | [[0,i],[1,0]] | Adjoint=[[0,1],[−i,0]], entrywise star=[[0,−i],[1,0]]; unequal | Pass | Keep discriminating Check |
| Conventions: morphism reversal | Inclusion {e}→C₂ | Function map ℂ²→ℂ is (a,b)↦a, opposite to group inclusion | Pass | Keep domain/codomain |
| Q1.ClassicalMultipliers: scalar base case | G={e}, f(e)=2+i | Δf=2+i, εf=2+i, S f=f, ηεf=2+i | Pass | R06–R07 |
| Q1: multiplication pullback and norm | G=ℤ, f=1_{0} | Δf(m,n)=1_{m+n=0}; supremum norms both 1; values at (N,−N) stay 1 | Pass, multiplier not C₀ | R05 |
| Q1: nondegeneracy | G=ℤ, b=1_{(r,s)} | Δ(1_{r+s})b=b, value 1 at (r,s), 0 elsewhere; zero homomorphism gives 0 | Pass | Import C1 |
| Q1: coassociativity | ℤ; S₃, g=(12),h=(23),k=(23), f=1_{(12)} | f((gh)k)=f(g(hk))=1; on ℤ both evaluate f(m+n+p) | Pass | R06 |
| Q1: counit slices | ℤ, f=1_{0}; C₂, f=(2,3) | Δf(m,0)=Δf(0,m)=f(m); C₂ slices both (2,3) | Pass | Keep both counits |
| Q1: inversion proper, isometric, involutive | ℤ, f=1_{1}; C₃ generator | S f=1_{−1}; S²f=1_{1}; norms 1=1; generator maps to its distinct inverse | Pass | Keep inverse control |
| Q1: diagonal pullback | ℤ, a=1_{2}, b=1_{3} | d(a⊗b)=0=ab; for a=b=1_{2}, both equal 1_{2} | Pass | Import proper-pullback API |
| Q1: r₊ and r₋ elementary tensors | ℤ, a=1_{1}, b=1_{−1} | r₊(a⊗b)=1_{1}=aS(b); r₋(a⊗b)=1_{−1}=S(a)b | Pass | Keep orientation test |
| Q1: inverse diagrams | ℤ, f=1_{0}; f=1_{1} | Both inverse composites are constant 1 for f=1_{0}, constant 0 for f=1_{1}; same as ηε | Pass | Constants must stay in M(A) |
| Q1: noncommutative multiplication excluded | M₂, x=e₁₂⊗1, y=1⊗e₂₁ | m(xy)=e₁₁ but m(yx)=e₁₁ whereas m(y)m(x)=e₂₂; multiplication cannot be an algebra map | Pass negative control | Keep commutative qualification |
| Q1: cancellation definition | C(C₂); functions on monoid {1,0} with absorbing 0 | Group cancellation spans have dimension 4. For the monoid each relevant span has dimension 3, not 4 | Pass | R06 |
| Q1: opposite/co-opposite and tensor | C(S₃); C(C₂)⊗C(C₂) | Flip replaces gh by hg (indicator values 1 versus 0 above); tensor algebra dimension 4 and cancellation tensor dimension 16 | Pass | Keep distinct coproducts |
| Q1: convolution associativity and states | Probability measures δ_g,δ_h,δ_k on S₃ | δ_g*δ_h=δ_gh; both associativity products δ_ghk; total mass 1·1=1 | Pass | Keep nonabelian control |
| Q1: Haar existence/normalization/one-sided uniqueness | C(C₂), h(a,b)=(a+b)/2 | h(1)=1; slices of Δ1_{e} both constant 1/2; invariance forces weights p=1−p, hence p=1/2 | Pass | Headline carrier accounting |
| Q1: Cesàro fixed points | C₂, convolution by δ_s | Even N average=(1/2,1/2); odd N weights differ by 1/N; limit fixed by δ_s | Pass | R06 |
| Q1: domination input | C₂, h=ρ=uniform, ω=tδ_e, 0≤t≤1/2 | h*ω=ω*h=t h=ω(1)h; t=1 fails ω≤ρ | Pass | State positivity/domination explicitly |
| Q1: GNS null ideal and reducedness | C(C₂), a=(1,0) | h(a*a)=1/2>0; GNS norm=1/√2; zero vector norm=0 | Pass | Keep normalized Haar |
| Q1: Haar tensor and morphism caveat | C₂×C₂; evaluation C(C₂)→ℂ | Product Haar of 1_{(e,e)}=1/4=(1/2)²; evaluation of 1_e=1 differs from Haar 1/2 | Pass | No arbitrary Haar pullback |
| Q1: classical coefficient crosswalk | C₃ character z | ⟨1,z⟩=z; ⟨z,1⟩=bar(z)≠z; conjugating twice returns z | Pass | Preserve supplier conjugation |
| Q1: group Δ and absorption W | ℂS₃; basis δ_g⊗δ_h | W(λ_s⊗1)W* sends (g,h) to (sg,sh), exactly λ_s⊗λ_s | Pass | Keep W direction |
| Q1: group Haar | ℂC₃ and ℂS₃ | h(u_e)=1, h(u_g)=0 for g≠e; h(u_g*u_h)=δ_g,h | Pass | Keep noncommutative algebra case |
| Q2: coaction/operator equivalence | Trivial group, H=ℂ²; H=0 | Dense-range isometry forces U=I; U=0 fails inner product 1=0 on a unit vector; on H=0 identity and zero coincide | Pass | No nonzero-H requirement for definition |
| Q2: intertwiners, dagger, kernels and sums | C₂ representation diag(1,−1) | Intertwiner algebra diagonal; projection diag(1,0) has rank 1, complement rank 1; off-diagonal e₁₂ gives TV=−VT | Pass | R06 |
| Q2: unitarization | C₂, involution U=[[1,1],[0,−1]] | T=(I+U*U)/2=[[1,1/2],[1/2,3/2]]; U*TU=T; det(T)=5/4>0 | Pass | Keep invertibility hypothesis |
| Q2: finite subrepresentation and arbitrary sums | Direct sum of C₂ signs over arbitrary index I | Every coordinate line has dimension 1; multiplicity is cardinality of each sign's index set, not necessarily countable | Pass | Keep arbitrary Hilbert sums |
| Q2: regular coaction | C₂ with normalized Haar | Δ1_e has two point masses; squared module norm integrates to constant 1/2=h(1_e); both irreducibles occur once | Pass | Keep right-invariance convention |
| Q2: coefficient density versus one coefficient | C₂, 1+sign | Span has dimension 2; 1+sign=(2,0) is neither a scalar constant nor scalar sign | Pass negative control | Keep span formulation |
| Q3: conjugate coaction and row map | SUq fundamental, q=1/2 | For row 1, h(cc*)+h(a*a)=4/5+1/5=1; row map not zero | Pass | Keep pre-antipode construction |
| Q3: F̃ normalization and uniqueness | SUq fundamental | F̃=diag(2,1/2); Tr F̃=Tr F̃⁻¹=5/2; rescaling by 2 gives traces 5 and 5/4 | Pass | R06 |
| Q3: first Schur formula / Lean schur_orthogonality | SUq fundamental; trivial one-dimensional corepresentation | h(a*a)=1/5=(F̃⁻¹)₀₀/(5/2); h(c*c)=4/5; trivial case 1=1/1 | Pass | Keep headline |
| Q3: second Schur formula | SUq fundamental | h(aa*)=4/5=F̃₀₀/(5/2); h(cc*)=4/5; h(aa*+q²c*c)=4/5+1/5=1 | Pass | Keep index placement |
| Q3: inequivalent coefficient orthogonality/direct sum | C₂, trivial and sign | h(sign)=0; Gram matrix of {1,sign} is I₂; coefficient span dimension 2 | Pass | Keep inequivalent qualifier |
| Q3: Hopf core counit and antipode | C₃ character z; S₃ group algebra | ε(z)=1, S(z)=z⁻¹; S(u_g u_h)=u_h⁻¹u_g⁻¹, reversing order | Pass | Consume native Hopf API |
| Q3: counit-star and S-star-S-star | C₃ group algebra, a=i u_g | ε(a*)=−i=bar(εa); S(star(S(star(a))))=i u_g=a | Pass | No one-tactic shortcut found |
| Q3: coefficient inverse/adjoint | C₃ character z; unitary S₃ permutation matrix | S(z)=bar(z); permutation inverse=transpose=adjoint, and inverse·matrix=I | Pass | Library inverse identity resolved |
| Q3: F̃=Fᵗ and S² | SUq fundamental | F=diag(2,1/2); F u F⁻¹ scales c by 1/4; S²(c)=q²c=c/4 | Pass | Keep convention |
| Q3: weighted Plancherel | a and c in fundamental first column | ‖a‖²=1/5, ‖c‖²=4/5, ‖a+c‖²=1; cross term 0 | Pass | Keep weights, not ordinary 1/2 |
| Q3: f_z convolution and star laws | Fundamental diagonal coefficients, z=1,2 | f₁(a)=2, f₂(a)=4=f₁*f₁(a); f₁(a*)=1/2=bar(f₋₁(a)); off-diagonal values 0 | Pass | Keep unbounded-character caveat |
| Q3: modular identity θ | Take a and b=a* | h(aa*)=4/5; θ(a)=4a; h(a*θ(a))=4·1/5=4/5 | Pass | Keep sign of θ |
| Q3: Vandermonde step | Positive bases λ=2,3; m=0,1 | Matrix [[1,1],[4,9]] has determinant 5; two zero samples force both coefficients 0 | Pass | Distinct positive bases essential |
| Q3: reducible F and tensor dimensions | 1⊕fundamental; fundamental tensor square | Tr F=1+5/2=7/2; tensor trace=(5/2)²=25/4; block rescaling would break f₁ definition | Pass | Do not use trace equality alone on reducibles |
| Q3: dual/pivot Hilbert metrics | Fundamental, F=diag(2,1/2) | Double-dual metric F⁻²=diag(1/4,4); j*F⁻²j=I; ordinary Euclidean j*j=diag(4,1/4)≠I | Pass | Keep transported metrics |
| Q3: dimension inequality and Kac equivalences | F=I₂ versus diag(2,1/2) | d=2=dim for I₂; d=5/2>2 otherwise; h(aa*)−h(a*a)=3/5 and S²(c)=c/4≠c | Pass | Keep non-Kac control |
| Q3: σ,τ and analytic continuation | Fundamental a,c | σ₋ᵢ(a)=4a=θ(a); τ₋ᵢ(c)=c/4=S²(c); σ_t(a)=4^(it)a | Pass | Keep KMS sign |
| Q3: Tomita/GNS comparison | C(C₂), uniform state | S conjugates coordinates; modular operator I; σ_t=id; vector (1,1) separating | Pass instance only | Use full V10–V11 contract |
| Q4: compact-type equivalences | ℂC₃, coefficient basis {1,g,g²} | h(x*x)=&#124;x₀&#124;²+&#124;x₁&#124;²+&#124;x₂&#124;²; all comodules split by three group-like grades | Pass | Native comodules retained |
| Q4: averaged positive form | C₂ involution diag(1,−1), arbitrary positive Gram [[2,1],[1,2]] | Average Gram diag(2,2), determinant 4>0; zero form would fail normalization/faithfulness | Pass | Keep injective-coaction input |
| Q4: algebraic cancellation inverses | Group algebra, g⊗h | T(g⊗h)=g⊗gh; inverse sends g⊗k to g⊗g⁻¹k; both composites g⊗h | Pass | Keep antipode inverse |
| Q4: universal/reduced norm and embeddings | ℂC₂, x=α+βg | Both norms max(&#124;α+β&#124;,&#124;α−β&#124;); x=1+g has norm 2 and Haar square 2 | Pass | Do not identify all completions generally |
| Q4: regular unitary, pentagon and implemented Δ | ℂS₃, basis (g,h,k) | U maps (g,h)→(g,gh); both pentagon sides (g,gh,ghk); conjugated λ_s⊗1 sends (g,h)→(sg,sh) | Pass | Keep U convention |
| Q4: coamenability four-way equivalence | C(C₂); C*(F₂) and C*r(F₂) | C₂ quotient is identity, counit norm 1, Haar faithful. Free adjacency has ε=4 and reduced norm 2√3<4 | Pass | Keep reduced qualifier |
| Q4: intermediate-completion criterion | A=C*r(F₂) | Haar is faithful, but bounded counit fails since 4>2√3; conjunction false, coamenability false | Pass negative control | Do not omit bounded counit |
| Q4: character translation | C(C₂), character evaluation at s | Translation swaps (a,b); inverse is same swap; Haar (a+b)/2 unchanged; recovered ε evaluates at e | Pass | Keep norm extension |
| Q4: ordinary compact-group completion | C₂; trivial group | A_u=A_r=C² for C₂, ℂ for trivial group; all nonempty-point Haar weights positive | Pass | Classical comparison owned here |
| Q5: matrix coefficient criterion | C(C₂), generator u=sign | u=u*, u²=1; coefficients of powers span {1,sign}, cancellation spans C⁴ | Pass | Keep dense-generation condition |
| Q5: SUq presentation, unitarity iff | q=0, a=1,c=0; q=1, a=0,c=1; invalid a=c=0 | Matrices I₂ and [[0,−1],[1,0]] are unitary and relations hold; zero matrix has U*U=0≠I | Pass both directions on controls | q=0 only algebraic relation test |
| Q5: SUq coproduct/counit | q=1/2, evaluate one leg at a=1,c=0 | Both counit composites send a→a,c→c; Δc=c⊗a+a*⊗c | Pass | Keep coefficient formula |
| Q5: SUq antipode | q=1/2 | S(c)=−c/2, S(c*)=−2c*, S²(c)=c/4; swapped q powers would fail coefficient inverse | Pass | Keep inverse parameter |
| Q5: SU₁ classical comparison | a=0,c=1 | u=[[0,−1],[1,0]], determinant 1 and u*u=I; at q=0 no classical/CQG claim | Pass | Keep endpoint distinction |
| Q5: O_F relation and scalar rescaling | F as above; 3F; U=I₂ | F barF=−2I; (3F)bar(3F)=−18I; both conjugation relations give I₂ | Pass | Keep scalar invariance |
| Q5: cup invariance / freeOrthogonalCup_invariant | SUq, coefficient (0,0) | −2·a·(−c*/2)+(−c*/2)·a=ac*−c*a/2=0, matching cup's (0,0) entry | Pass | Keep transposed F indexing |
| Q5: zigzag / freeOrthogonalCup_zigzag | F=[[0,1],[−2,0]] | Cup coefficients (0,−2,1,0); each diagonal zigzag −2, off-diagonal 0; FbarF=−2I | Pass, definition-level | R10 |
| Q5: signed J and antiunitarity | Same F; F₀=[[0,1],[−1,0]] | J²=−I in both; first J has squared norms 2 and 1/2 on basis vectors, F₀ case both 1 | Pass | Distinguish anti-linear from antiunitary |
| Q5: dimension bound and AM–GM | Same F; I₃ | ‖cup‖²/&#124;c&#124;=5/2≥2; for I₃ value 3=3 | Pass | Keep equality criterion |
| Q6: coefficient algebra and unit | Hilb_f with identity fiber functor; zero generator | Reconstructed core ℂ, Δ1=1⊗1; zero-generator truncations dimension 1, not 0 | Pass | Keep explicit H=0 branch |
| Q6: finite-stage annihilator/coideal | H=ℂ, cup=1, O₁⁺ | A=ℂ[t], ideal (t²−1); dimensions of degree≤n quotients are 1,2,2,2; ε(t²−1)=0 | Pass | Truncation is coalgebra, not algebra |
| Q6: filtered reconstruction | Characters of product of arbitrarily many C₂ factors | Each character has finite support; union of finite-subset character groups is direct sum of C₂; no finite generator covers infinite support set | Pass | Keep filtered union |
| Q6: full faithfulness and uniqueness | Hilb_f; C₂ representations | Hom(1,sign)=0, End(sign)=ℂ; reconstructed C₂ core dimension 2; Hilb_f core dimension 1 | Pass | Keep fiber-compatible equivalence |
| Q6: symmetric reconstruction | C₂ and nonabelian S₃ | Function algebras dimensions 2 and 6 are commutative; S₃ coproduct not cocommutative, with ordered indicator values 1 and 0 | Pass | Do not conflate commutativity/cocommutativity |
| Q6: compact cancellative semigroup criterion | C₂; absorbing monoid {1,0} | C₂ translations bijective; in monoid 0·1=0·0=0 with 1≠0, so cancellation fails | Pass | Keep both cancellation laws |
| Q7: SUq simple dimensions/fusion | k,l=0,1,2 | r₀⊗r_k=r_k; r₁⊗r₁=r₀⊕r₂, dimensions 4=1+3; r₂⊗r₁ dimensions 6=2+4 | Pass | Keep exhaustive-family target |
| Q7: interior Haar geometric series | q=1/2, f=1,t,t² | Values 1,4/5,16/21; geometric sums (3/4)/(1−1/4), (3/4)/(1−1/16), (3/4)/(1−1/64) | Pass | Do not substitute q=±1 |
| Q7: classical endpoint Haar | q=1; f=1,t,t², nonzero phase monomial | Integrals 1,1/2,1/3,0; not the interior sums at q=1 | Pass | Keep phase integration |
| Q7: negative endpoint model | q=−1, t=1/2,z=w=1 | a=σ₃/√2,c=σ₁/√2; ac=−ca; a*a+c*c=I; normalized trace 1 on I | Pass | Keep signed endpoint |
| Q7: endpoint Haar and character | q=−1, t=0,z=1 | c=0,a=σ₃; +1 eigenspace character sends a→1,c→0; ∫t dt=1/2 | Pass | Keep reduced model identification |
| Q7: interior Toeplitz route | q=1/2, diagonal weights √(1−q^(2n)) | At n=0 weight 0; weights→1, so D−I has entries→0; symbol(a₀)=z⁻¹, value at z=1 is 1 | Pass | Compactness is on ℓ²(ℕ) |
| Q7: multiplicative-domain step | State with φ(a)=1, q=1/2 | Cauchy–Schwarz and contractions force φ(a*a)=φ(aa*)=1, hence φ(c*c)=0 | Pass | Keep both generator defects |
| Q7: TL projection normalization | d=5/2, ε=−1 | β=25/4; p_i p_(i+1) p_i=(4/25)p_i; δp_i=−(5/2)p_i versus positive (5/2)p_i | Pass | R02 |
| Q7: Catalan/intertwiner dimensions | k=0,1,2,3, n≥2 | Catalan numbers 1,1,2,5; End(u)=ℂ dimension 1; End(u²) dimension 2 | Pass | Keep n≥2 |
| Q7: free-orthogonal fusion | n=3, r₁⊗r₁ and r₂⊗r₁ | Hilbert dimensions 9=1+8; 24=3+21 | Pass | Keep infinite-fusion range |
| Q7: Hilbert versus intrinsic recurrence | n=2, d=5/2 | Hilbert 1,2,3,4; intrinsic 1,5/2,21/4,85/8; tensor square 25/4=1+21/4 | Pass | Keep two dimension scales |
| Q7: semicircle and noncoamenability | n=3; character moments 0,1,2,5 | Reduced norm 2 but ε(χ)=3; m₂=1,m₄=2,m₆=5 | Pass | Keep faithful-Haar support argument |
| Q7: n=2 normal form | F=I₂; F=[[0,1],[−2,0]] | First has positive sign and q=−1; second negative sign and q=1/2; both n=2 cases coamenable | Pass | Keep sign(q)=−sign(c) |
| Q7: n=1 boundary | F=[1], group C₂ | Exactly two irreducibles; χ²=1, m₄=1≠2; extending recurrence gives 1,1,0,−1, impossible dimensions | Pass negative control | Source erratum below |
| Q8: quantum integers and denominators | q=1/2, r=−2,−1,0,1,2,3 | Values −5/2,−1,0,1,5/2,21/4; denominator −3/2≠0; q=1 would give totalized 0/0=0 | Pass | Keep generic hypothesis |
| Q8: quotient degeneracies | q=0,1,−1 | q=0 forces E=F=0 with K invertible; q=±1 yields commuting E,F,K and denominator inverse 0 | Pass | Not U(sl₂) at q=1 |
| Q8: PBW and Ore relation | q=1/2, b=a=1 | FK=K F/4, hence KF=4FK=q^(−2)FK; δ_E(F)=−(2/3)(K−K⁻¹) | Pass | R01/R04 |
| Q8: general σ-derivation API | σ=id, δ=d/dx on ℂ[x]; σ=id,δ=0 | Tx=xT+1 in first model, Tx=xT in second; zero derivation cannot model Weyl relation | Pass | General extension differs from SkewPolynomial |
| Q8: σ injectivity domain qualification | R=ℂ[x], σ(p)=p(0), δ=0 | T·x=0 although T,x nonzero; violates domain if injectivity is omitted | Pass negative control | Keep injectivity assumption |
| Q8: σ_E compatibility | q=1/2 on FK=q²KF | δ_E(FK−q²KF)=D K−K D=0, D=(K−K⁻¹)/(q−q⁻¹) | Pass | Keep extension check |
| Q8: Hopf generator laws and antipode | q=1/2, E and F | m(S⊗id)ΔE=−K⁻¹E+K⁻¹E=0=εE; for F, S(F)K⁻¹+F=−F+F=0 | Pass | R01; retain exact ΔF |
| Q8: S² and pivot | q=1/2, E,F,K | S²(E)=4E=K⁻¹EK; S²(F)=F/4; S²(K)=K | Pass | Keep pivot K⁻¹ |
| Q8: q inverse algebra comparison | q=1/2, K↦K⁻¹ | Source ΔE maps to E⊗1+K⁻¹⊗E; target ΔE=E⊗1+K⊗E, unequal on L₁⊗L₁ | Pass negative control | Do not call it Hopf isomorphism |
| Q8: weight shifts | L₂⁺, q=1/2 | K weights 1/4,1,4; E sends weight 1 to 1/4=q²·1; F sends 1 to 4=q⁻²·1 | Pass | Keep orientation |
| Q8: Verma module normalization | λ=1, q=1/2 | E(Fv)=(λ−λ⁻¹)/(q−q⁻¹)v=0; v and Fv have weights 1 and 4 | Pass | Highest-weight quotient is tied to generators |
| Q8: signed ladder relations | m=0,1,2; q=1/2 | EF−FE diagonals: (0), (1,−1), (5/2,0,−5/2), matching (K−K⁻¹)/(q−q⁻¹) | Pass | Keep out-of-range vectors zero |
| Q8: signed simplicity/classification control | L₀⁺ and L₀⁻ | K=1 versus −1, E=F=0; Hom between them is 0; End of each is ℂ | Pass | Do not drop negative sign |
| Q8: Casimir scalar and centrality | m=0,1,2 positive sign | Scalars 10/9,17/9,65/18; on L₁, FE+diagonal term gives diag(17/9,17/9) | Pass | Full center missing in Lean |
| Q8: generic separation of Casimir scalars | m=0,1,2, both signs | Values ±10/9,±17/9,±65/18 distinct; root-of-unity hypothesis removal permits collisions | Pass | R04 |
| Q8: generalized-weight splitting route | m=0, K=εI+N, N²=0 | K²−I=2εN; relation with E=F=0 forces N=0 in characteristic 0 | Pass | Characteristic hypothesis is ℂ |
| Q8: commutator at r=2 | L₁⁺, v₀, m=1 | F²v₀=0; [2]_q F(q⁻¹K−qK⁻¹)v₀/(q−q⁻¹)=0 since q⁻¹q−q q⁻¹=0 | Pass | Keep termination step |
| Q8: finite semisimplicity | L₀⁻⊕L₁⁺; zero module | Dimensions 3 and 0; complementary summands dimensions 1,2; zero submodule lattice singleton is complemented | Pass | R04, scratch signature succeeds |
| Q8: local finiteness and direct sums | Infinite algebraic sum of L₀⁻ | Every vector has finite support, cyclic dimension ≤1; entire module can have infinite dimension | Pass | Do not impose global finiteness |
| Q8: type-1 iff and signed variant | L₀⁻, q=1/2; L₁⁺ | First has nilpotent E,F and local finiteness but K=−1 not in {2^k}; second weights 1/2,2 are powers of q | Pass both directions/control | Keep unsigned restriction |
| Q8: finite Hopf category carrier | H=k[C₃], k=ℂ; trivial module | Base-field dimension 1; unit and dual dimension 1; tensor of dimensions 2,3 has base dimension 6 | Pass | R10 removes unused acceptance helpers |
| Q8: faithful forgetful maps | Scalar endomorphisms 2id and 3id on unit | Underlying maps take 1 to 2 and 3; remain distinct after both forgetful functors | Pass | No headline currently uses these definitions |
| Q8: tensor/dual triangle and group-algebra comparison | C₃ character z | Dual character z⁻¹; evaluation on basis/dual basis 1; triangle composite 1; double dual z | Pass | Native right-dual and shrink APIs resolved |
| Q8: CG highest-vector recurrence | m=n=j=1, positive signs | α=(1,−1/2); ΔE on v₀⊗v₁ contributes 1/2, on −v₁⊗v₀/2 contributes −1/2, sum 0 | Pass | Keep normalization |
| Q8: sign tensor order | L₀⁻⊗L₁⁺ versus reverse | First E action gains −1, second F action gains −1; diagonal rescaling (1,−1) compares ladders | Pass | Keep basis rescaling |
| Q8: symmetric q-binomial ΔE²,ΔF² | q=1/2,r=0,1,2 | r=0 gives 1⊗1; r=1 gives two generator terms; r=2 mixed coefficient q[2]_q=5/4=1+q² | Pass | Keep ordering and exponent |
| Q8: CG inverse/associator/6j pentagon | All four factors L₀⁺; unit with L₁⁺ | Every 6j matrix is [1]; both pentagon composites [1]; unit tensor identification sends v↦v | Pass boundary only | General 6j proof not certified by this control |
| Q8: pivotal traces and spherical dimensions | L₁⁺ and L₀⁻ | tr K⁻¹=tr K=5/2 on L₁⁺; both traces −1 on L₀⁻, agreeing with ε[m+1]_q | Pass | Distinguish positivity from algebraic sphericality |
| Q8: compact star form | L₁⁺ with Gram diag(1,1/2) | E* has lower entry 2=KF; F* has upper entry 1/2=EK⁻¹; K positive | Pass | Keep positive-K category |
| Q8: compact pairing/cup | Orthonormal L₁⁺ basis | E₀₁=√2, F₁₀=1/√2; ladder cup (1,−1/2) becomes proportional to orthonormal cup (1,−1/2) | Pass | Keep h₁=1/2 basis conversion |
| Q8: Hopf-pairing product check | E applied to ac*=q c*a | E(c*)=−2√2; E(ac*)=−√2=q E(c*a); using opposite coproduct gives wrong factor | Pass | Keep pairing orientation |
| Q8: classical specialization | m=2, evaluate quantum integers at v=1 | E ladder entries 2,1; F entries 1,2; H diagonal 2,0,−2; [E,F]=H | Pass | Use Laurent family, not totalized quotient |
| Lean schur zero-index exclusion | H=0, empty basis | Subcomodule lattice has one element, so IsSimpleOrder cannot hold; no 0/0 headline instance admitted | Pass | Keep simplicity binder |
| Lean freeOrthogonalRelation empty index | ι=∅ | Unique 0×0 matrix is identity/unitary; cup=0; sums have no indices, no nonempty quantum-group claim | Pass | README group requires n≥1 |
| Lean SUqRelations generality | Zero ring; q arbitrary | 1=0, all five relations and matrix unitarity hold in zero ring; this predicate does not assert a nonzero CQG | Pass | Keep nonzero analytic assumption separate |
| Gate source/supply controls | C1 specialization; TL sign; four upward edges | C1 has one generic pullback owner; TL old A-section count 0; UPWARD count 4; actual inspected reverse supplier edges 0 | Fail interfaces/form | R02/R03/R05 |

**Pinned library objects opened and resolved.** Paths below are relative to the pinned library repositories. These are native carriers/results actually inspected, not claims about a newer library.

| Pin | File and line | Declaration/content checked and limitation |
| --- | --- | --- |
| Mathlib | `Mathlib/Analysis/CStarAlgebra/Multiplier.lean:67` | `DoubleCentralizer`: a pair of continuous linear centralizers with compatibility. It does not install the strict topology; that is explicitly still a TODO at line 47. |
| Mathlib | `Mathlib/RingTheory/HopfAlgebra/Basic.lean:65` | `HopfAlgebra`: bialgebra plus linear antipode and two convolution inverse laws; no analytic C*-completion or star compatibility. |
| Mathlib | `Mathlib/RingTheory/HopfAlgebra/Convolution.lean:57` | `HopfAlgebra.antipode_mul_antidistrib`, the reversed product law. |
| Mathlib | `Mathlib/RingTheory/HopfAlgebra/GroupLike.lean:37` | `GroupLike.toUnits`: group-like element's inverse is its antipode. |
| Mathlib | `Mathlib/Algebra/SkewPolynomial/Basic.lean:62`, `:221` | Twist uses MulSemiringAction of Multiplicative ℕ; no added derivation term. This does not supply the requested general σ-derivation extension. |
| Mathlib | `Mathlib/Algebra/RingQuot.lean:471` | `RingQuot.mkAlgHom_rel`, used to prove both K-unit equations with actual proof bodies. |
| Mathlib | `Mathlib/RingTheory/SimpleModule/Basic.lean:65` | `IsSemisimpleModule`: complemented submodule lattice. No topology or finite-dimensionality is built into this predicate; the scratch theorem carries finite-dimensionality separately. |
| Mathlib | `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:906` | `Subalgebra.center`, enabling a genuine center-generation signature. |
| Mathlib | `Mathlib/RepresentationTheory/FDRep.lean:63` | FDRep is Action on FGModuleCat, with objects in the scalar universe; the abstract carrier alone does not build the new Hopf-module tensor structure. |
| Tau Ceti | `TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68`, `:100`, `:117`, `:173` | `coefficientMatrix`, counit, coproduct and left antipode-inverse identity; confirms column indexing and removes the need for a second algebraic coaction carrier. |
| Tau Ceti | `TauCeti/Algebra/Coalgebra/Comodule/MatrixCoefficient/FromMatrix.lean:196`, `:204` | `matrixComodule_coact` and `coefficientMatrix_matrixComodule`, the inverse construction. |
| Tau Ceti | `TauCeti/Algebra/Coalgebra/Comodule/Convolution.lean:49`, `:91` | `convolutionAction` and its slice formula; uses WithConv. |
| Tau Ceti | `TauCeti/Algebra/Coalgebra/Comodule/LinearlyReductive.lean:104`, `:227` | `IsCompletelyReducible`, `IsLinearlyReductive`; these are algebraic comodule notions, not compact-Haar analytic theorems. |
| Tau Ceti | `TauCeti/Algebra/Coalgebra/Comodule/Finite/RightRigid.lean:262` | RightRigidCategory for finite comodules; antipode bijectivity not required for the chosen right dual. |
| Tau Ceti | `TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.lean:43`, `:47` | RigidCategory uses commutative Hopf coefficients; does not justify the noncommutative left-dual construction without bijectivity. |
| Tau Ceti | `TauCeti/Algebra/HopfAlgebra/Antipode.lean:88`, `:97` | `TauCeti.HopfAlgebra.antipode_antipode`, `antipodeAlgEquiv` in the commutative case. |
| Tau Ceti | `TauCeti/RepresentationTheory/FDRep.lean:224`, `:230` | `FDRep.ofShrink`, `FDRep.ofShrinkEquiv`; these are Tau Ceti extensions in the FDRep namespace, not missing Mathlib declarations. |
| Tau Ceti | `TauCeti/RepresentationTheory/GrothendieckGroup/GroupAlgebra/Equivalence.lean:46`, `:93` | `TauCeti.fdRepEquivalence` assumes Finite G and identifies FG modules over k[G]. It does not subsume Q8.5 for arbitrary G with finiteness over k, nor its monoidal/dual comparison. |

Object searches used both pinned libraries, `roadmaps grep`, the supplied main, the named sibling heads and available package README/plan files. No second generic compact quantum-group owner was found among those permitted sources. QuantumGroups already owns generic rank one on main; QuantumEnvelopingAlgebras QEA1 explicitly consumes Q8.1 and compares the higher-rank torus rather than replacing it. HopfologicalAlgebra lines 37 and 134 consumes Q8.5's finite Hopf-module category. The derivation-only Ore item found in PadicDifferentialEquationsAndRigidCohomology does not supply arbitrary noncommutative R and arbitrary σ. Q8's general σ-derivation construction remains genuinely broader. The new classical group-specific diagrams belong here, but their generic pullback proof belongs to CStarAlgebras C1 (R05). No code from an external formalization was imported or executed.

**Resolved roadmap contracts.** All 11 supplier-table entries were inspected; these are the relevant locators, with main preferred over revisions of an existing roadmap.

| Supplier | Resolved input |
| --- | --- |
| CStarAlgebras, supplied new head | C1 lines 237–261: multipliers, bounded strict topology, extensions and generic commutative pullbacks. C5 lines 546–575: spatial tensors and C₀(X)-valued tensors. C2/C4/C8 contain the state extension, multiplicative domain and Toeplitz inputs. |
| VonNeumannAlgebras, full supplied new head | V0/V1: state/GNS/bicommutant inputs; V11 lines 2794–2812: full left Hilbert algebra, full closure, Tomita, canonical-weight recovery and KMS uniqueness. The other supplied V0–V4-only proposal does not contain V10/V11; the contract must retain the full provider. |
| HilbertModules, supplied available new head | H1 line 162: free H⊗A; H2 lines 201–210: compact/adjointable multiplier realization; H3 line 259 onward: interior tensor product. The second named checkout was unavailable; the available head supplies the contract. |
| CategoricalOperatorAlgebras, supplied new head | CA1a line 152 and CA2a line 302: dagger/finite-Hilbert interfaces, balanced duals, signed self-duality and dimensions. Lines 385–393 contain explicit ± sign controls. No reverse QuantumGroups dependency. |
| TemperleyLiebOperatorAlgebras, supplied new head | Actual Layers 1–3 and sign §2.1 replace the nonexistent A1–A6 citation, as R02 specifies. |
| TemperleyLieb, main | Layers 0–7; Layer 6 line 680 begins Jones–Wenzl, Layer 7 the envelope/category work. This is the extra algebraic supplier nested in the TL operator-algebra table row. |
| RepresentationTheory/CompactGroups, main | Layer 0 line 205, Layer 4 line 295, Layer 5 line 318; SU(2) engine line 390. Coefficients use the conjugate of Q1's convention. |
| RepresentationTheory/LieHighestWeight, main | Layer 0 line 319: sl₂ weight strings, classification and actual V(n); the Q8.7 comparison is to this engine. |
| OperatorAlgebraDynamics, main | D1 line 75, D2 line 143; lines 180–187 explicitly supply P₁/P₂ and the discrete ℓ² specialization. Open revisions were not used as extra prerequisites. |
| FreeProbability, main | F3 lines 303–314: 2√3 versus 4 and the noninjective full/reduced quotient; F6 lines 534 onward: semicircle law and variance convention. |
| AmenableGroups, main | Layer 1 line 98: means; Layer 5 line 289: discrete Følner criteria; Layer 7 line 415: locally compact Haar L∞. The current table's Layer 1,7 citation should name Layer 5 when using Følner. |
| PivotalSpherical, main | Layers 0–2 lines 257–350: double-right-dual, pivot and traces; Layer 7 line 477: FDRep and left-rigid completion. No need for the historical commit link. |

There are no declared gaps to waive. No `*Needs:*` lines exist in this README; all supplier mentions and proof-route inputs above were instead read in their prose context. Ownership against the supplied open-head files was checked. Unavailable named heads are disclosed here; unprovided open heads were not pursued as alternate owners.

Required dependency command output (unmodified; the numbers in parentheses are order positions):

```text
UPWARD: QuantumGroups (on main) -> CategoricalOperatorAlgebras (#211) at README lines [42]
UPWARD: QuantumGroups (on main) -> HilbertModules (#9) at README lines [41]
UPWARD: QuantumGroups (on main) -> TemperleyLiebOperatorAlgebras (#227) at README lines [43]
UPWARD: QuantumGroups (on main) -> VonNeumannAlgebras (#3) at README lines [40]
CYCLE among: CategoricalOperatorAlgebras, QuantumGroups, TemperleyLiebOperatorAlgebras
depcheck: 205 roadmaps, 1510 edges, 5 problem(s)
```

**Sources actually read.** There are no README locators explicitly marked unverified. The seeded Q1.ClassicalMultipliers source remains unidentified, as recorded below. Eight distinct cited works were submitted to the sources service; six were retrieved, two remain unreadable/unidentified. Retrieved texts were kept outside the repository.

- `bmt` lines 257–258 (Theorem 2.2, printed p.6), 461–483 (Theorem 2.8/Corollary 2.9, pp.10–11), and 858–865 (Theorem 3.6, pp.18–19) support the precise faithful-Haar/counit/character/universal-reduced distinctions in Q4. The fetched version is arXiv:math/0010248v1. Its theorem numbering and printed pages match the cited locators. The interior SUq result is at lines 614 and 645; it is not an endpoint substitution.
- `banica` lines 54–72 (Proposition 1/Lemma 1, printed p.2) confirm the F_ji cup, zigzag sign and β normalization. Lines 42–46 give Theorem 1; lines 9–11 impose n≥2 in the abstract, and lines 138–139 distinguish n=2 in the dimension formula. The fetched version is arXiv:math/9806063v5. Q7 correctly excludes n=1 from infinite fusion despite the theorem's unqualified n in the source.
- `malacarne` lines 52–60 (Theorem 1.1), 183 (Lemma 2.1) and 285–312 (Theorem 4.1 and finite-subset proof) were read in arXiv:1602.04807v1. They support the specified finite construction and general essentially-small reconstruction. The preprint has seven pages; the README's journal pp.152–159 were not independently matched. Its finite-sum/subobject convention is explicit at lines 290–291. Q6 correctly states uniqueness of the Hopf core separately from analytic completions.
- `virelizier` lines 348–359, §2.3, printed p.8, give the same generic presentation, Δ and S, including S²=Ad(K⁻¹). Q8's symmetric quantum integer differs from the source's nonsymmetric number by the factor q^(r−1); at r=2 the values are 5/2 versus 5/4. The roadmap explicitly develops its extra signed/Verma/local-finiteness results rather than falsely attributing them all to §§2.3–4.1.
- `algebraic-analysis` at the pinned external commit: Associativity lines 26,168,194,338 provide the ring-general derivation-only normal forms, associativity and universal map. LeftPBW lines 38,63,74 impose Field K and give the left basis. IteratedTower lines 39,45–49,100 use Ring B and a finite list of commuting derivations. These support the limited provenance claim, not arbitrary σ. The files were read as text and never executed.
- `egno` was fetched legally from the author's page. It is only a supplementary pointer in this README, with no precise theorem attributed to it; no EGNO theorem was certified in this review.

## Not verifiable

- **Seeded Q1.ClassicalMultipliers citation:** the README's “Rieffel main” and “0210_001” do not identify a work or legal archive. I tried the sources service with the citation and filename, the [Rieffel author publication list](https://math.berkeley.edu/~rieffel/), and searches for the archive identifier and page numbers. No source text, theorem number, printed-page match or source-hypothesis comparison can be certified. The mathematical identities were independently tested above. R07 requests the missing bibliographic information; the review is completed, not parked.
- **Timmermann:** the sources service resolved DOI 10.4171/043 to the [publisher's book page](https://ems.press/books/etb/44), which requires a subscription. Proposition 2.2.4, Remark 2.2.2(iv)(c) and the listed Chapter 3/5/6 locators remain uncertified. No paywall was bypassed and no manifest was changed.
- **Malacarne journal pagination:** the legal preprint's theorem numbering was inspected, but the correspondence with journal pp.152–159 was not checked in the published PDF.
- **Generality beyond the computed controls:** the table does not constitute proofs of the nonseparable Peter–Weyl theorem, Tannaka reconstruction, all compact-type equivalences, generalized-weight splitting or general 6j pentagon. Those are assessed through their hypotheses, constructions, owned inputs and the source readings described above. Unread Timmermann proof steps remain unverified.
- **Alternate HilbertModules checkout:** one of the brief's named paths did not exist; the available supplied new-roadmap head was read. The two alternative VonNeumannAlgebras proposals have different scope; only the full one supplies V10–V11.

## Source issues

- **Error** in banica at Theorem 1, printed p.2 (banica line 42): the source says the infinite SU(2)-type classification applies to arbitrary n; it should be restricted to n≥2, as its abstract already specifies; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8 (virelizier line 349): the source says all displayed q-numbers lie in the unit group; it should be the field, with nonzero restrictions before claiming invertibility, since the zero-index number is zero; affects nothing.
