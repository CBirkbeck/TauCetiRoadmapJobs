# Review of SemisimpleAlgebras (pull request #989 at 6045796)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** needs changes

🤖 Independent AI review. This is a full-folder review, including inherited content. The corrected A-linear Schur statement is supported by the pins; the findings below concern the complete acceptance specification. There are 11 findings: 3 P1, 3 P2, and 5 P3. No pull-request file was changed.

## R01 (P1) — Exclude zero-size blocks and zero-dimensional Brauer representatives

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:228`, `:235`, `:337`, `:370`. The presentation specifies “degrees `n : ι → ℕ`”; the example says “`Mₙ(K)` is central simple”.

**Claim:** Every presentation so defined has the same block data, and arbitrary finite-dimensional endomorphism algebras and matrix algebras represent the trivial Brauer class.

**Witness:** `K ≅ M₁(K) ≅ M₁(K) × M₀(K)`, with block counts 1 and 2. `M₀(K) = End_K(0)` has one element, so it is not simple and cannot be a `CSA`.

**Repair:** Require every presentation degree to be positive, and require `n > 0` and `Nontrivial V` in the matrix and endomorphism Brauer statements. Prefer the native presentation, which already enforces positivity, and the native nontriviality-qualified Brauer declarations. Retain the empty product for the zero semisimple ring: its block count is 0. Add the three negative controls above. The repaired claims admit `M₁(K)` and `End_K(K)`, with dimension 1 and trivial Brauer class, and exclude the appended zero block and `End_K(0)`. `Suggested.lean:78` already has the correct positivity hypothesis; the prose definition must agree with it.

Pinned witnesses: `TauCeti/RingTheory/Semisimple/Wedderburn/Presentation.lean:77` includes `instNeZeroDegree`; `TauCeti/Algebra/BrauerGroup/Trivial.lean:159` requires `NeZero n`, and `:186` supplies `Nontrivial V` for `isBrauerTrivial_end` at `:193`.

## R02 (P1) — Put scalar-extension simplicity before square dimension

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:281`, `:346`, `:402`. Square dimension uses “`A ⊗_K K̄` is central simple”; Layer 6 then says to “First prove” preservation under field extension.

**Claim:** Layer 4's square-dimension proof rests on earlier inputs, while Layer 6 depends on Layers 4–5.

**Witness:** The stated route has edges square dimension (Layer 4) → scalar-extension simplicity (Layer 6) → Layer 4. Tensor closure for two central K-algebras does not apply to K̄, whose K-center is K̄.

**Repair:** Consume `TauCeti.IsSimpleRing.tensorProduct_of_isCentral_right`, `TauCeti/Algebra/CentralSimple/TensorProduct.lean:227`, before the square-dimension argument. It needs the left factor simple, the right factor central simple, and does not require the extension field to be central over K. Alternatively move the general scalar-extension theorem before square dimension and state its independent inputs. Keep Brauer functoriality after the group construction. Test with `ℂ ⊗_ℝ ℍ ≅ M₂(ℂ)`: dimension over ℂ is 4, giving 4 = 2² without using Layer 6. The external dependency checker does not inspect this internal layer cycle.

## R03 (P1) — The admitted Brauer instance does not specify the tensor-product group

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:187`: `noncomputable instance brauerCommGroup ... : CommGroup (BrauerGroup ...) := sorry`.

**Claim:** This is an acceptance statement for multiplication by tensor product, identity [K], and inversion by the opposite algebra.

**Witness:** On Br(ℝ) = {0,h}, transport the group law by swapping 0 and h. The resulting commutative group has identity h and `0 ⋆ 0 = h`; tensor multiplication gives `0 + 0 = 0`.

**Repair:** Delete this admitted data instance and consume `TauCeti.BrauerGroup.instCommGroup` in `TauCeti/Algebra/BrauerGroup/Group.lean:174`. Its class formulas at lines 195, 200 and 206 fix tensor multiplication, [K], and opposite inversion. State any remaining new headline using that actual structure. For the witness, the native law has identity [ℝ] and [ℍ]² = [ℝ], so the transported wrong law is excluded. This also repairs the worker's `sorry-data` failure at line 187; replacing `sorry` with an arbitrary group structure would not repair the mathematical acceptance test.

## R04 (P2) — Restore the general Skolem–Noether and centralizer statements

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:324`, `:332`; `Suggested.lean:160`, `:168`, `:176`. The prose excludes a merely simple source and says it “needs a center-sensitive correction to the dimension formula”.

**Claim:** For central simple ambient A, the general centralizer dimension formula needs correction when B is not central, so only central B belongs in scope.

**Witness:** For ℂ ⊂ ℍ over ℝ, `C_ℍ(ℂ) = ℂ` and `dim ℂ · dim ℂ = 2·2 = 4 = dim ℍ`. Conjugation by j sends i to −i, realizing the two ℂ embeddings.

**Repair:** State the two-map Skolem–Noether theorem for simple B and finite-dimensional central simple A. State centralizer simplicity, the unchanged dimension product, and the double-centralizer equality for simple B. Reserve centrality of B for centrality of its centralizer and the tensor-factorization refinement. These repairs include the roadmap's own ℂ ⊂ ℍ example at line 393. The counterexample ℂ → ℂ at line 325 drops centrality of A as well; it cannot justify restricting B while A remains central. Cite [Stacks tag 074Q](https://stacks.math.columbia.edu/tag/074Q), chapter Theorem 6.1, printed p. 5, and [tag 074T](https://stacks.math.columbia.edu/tag/074T), Theorem 7.1, printed p. 6: `stacks-brauer line 215` and `stacks-brauer line 235`. Their hypotheses explicitly allow merely simple B. The retained tensor-factorization refinement is tag 074U, `stacks-brauer line 252`.

## R05 (P2) — Replace the claimed missing library with exact native contracts

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:122`, `:151`, `:287`, `:341`. In particular: “None of these is upstream as stated”.

**Claim:** The block dictionary, uniqueness, density assembly, tensor simplicity, centralizers, Brauer operations, splitting theory and real classification still need to be built here.

**Witness:** At the manifest's Tau Ceti pin, `TauCeti.card_blocks_eq`, `TauCeti.wedderburn_blocks_unique`, `TauCeti.centralizer_centralizer`, `TauCeti.BrauerGroup.instCommGroup`, finite separable splitting, and `TauCeti.Quaternion.brauerGroupMulEquiv` are implemented. The detailed declaration/file table below gives reproducible locators.

**Repair:** Put these existing objects and results in Scope and ownership and Exact supplier contracts, with their full native names and hypotheses. Delete their duplicate construction targets and private splitting predicate; retain only mathematically distinct extensions, including the general Layer 5 forms in R04. Layer 1.5's occurrence theorem is already Mathlib's `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule` at `Mathlib/RingTheory/SimpleModule/Basic.lean:416`. This is repairable reconciliation of an existing roadmap with its pins, not grounds to reject the Schur correction as a new competing roadmap. The native declarations handle the tested 0/1/2-block cases, ℍ, finite fields and finite separable splitting, with the hypotheses recorded below.

## R06 (P2) — Account for all statable headline results

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:21` and `:182`; `README.md:235`, `:330`, `:350`, `:355`, `:358`, `:360`.

**Claim:** The acceptance signatures cover the promised deep milestones, while other objects await expressible types.

**Witness:** Full block uniqueness, double-centralizer equality, finite separable splitting, finite-field Brauer triviality and Br(ℝ) ≃ ℤ/2 are absent. Each already has a native Lean statement at these pins; the module docstring names no missing carrier.

**Repair:** Reconcile the headline list after R05: explicitly consume implemented results instead of promising them again. State every remaining new headline at full generality, particularly R04's merely simple-source/subalgebra forms, using the native carriers. If retaining any of the listed headlines as new goals, state the actual theorem, not just block count or the quaternion tensor-square example. For example `Subalgebra.centralizer K (Set.centralizer (B : Set A)) = B` is directly statable; for ℂ ⊂ ℍ both sides are ℂ, whereas the currently stated dimension theorem alone does not express that equality. The real-group carrier and equivalence are likewise statable using the native group and `Multiplicative (ZMod 2)`. Update the docstring to distinguish consumed results from genuinely unstatable remaining headlines.

## R07 (P3) — Remove the admitted tensor-product instance

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:134`: `instance tensorProduct_isSimpleRing ... := sorry`.

**Claim:** Simplicity is supplied through an admitted instance.

**Witness:** The worker reports `sorry-data` at line 134. With `TauCeti.Algebra.CentralSimple.TensorProduct` imported, the identical declaration closes with `infer_instance` in the scratch probe.

**Repair:** Delete it from `Suggested.lean` and cite `TauCeti.IsSimpleRing.tensorProduct` in `TauCeti/Algebra/CentralSimple/TensorProduct.lean:185`. Keep the mathematical theorem in the README as consumed theory. This repairs the form rule and works for `M₂(𝔽₂) ⊗ M₂(𝔽₂) ≅ M₄(𝔽₂)`, of dimension 16. If there were a genuinely new instance-valued proposition to target, its admitted signature would be a `theorem`, but this one is already supplied.

## R08 (P3) — Delete the single-step and worked-example padding

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:39` through `:213`, specifically the 17 theorem rows marked “one-step” in the native-declaration table below.

**Claim:** These admitted declarations are new headline acceptance tests.

**Witness:** With the individual pinned Tau Ceti modules imported, all 17 close with one `exact` or `infer_instance`. Separately, `quaternion_finrank` closes with `exact Quaternion.finrank_eq_four`; it computes 4, a README worked-example value.

**Repair:** Delete these declarations from `Suggested.lean`; keep the mathematics as README targets/Checks or consumed contracts. Do not prove them in place. The 19 successful single-step probes include these 17 theorems and the two instances addressed separately in R03/R07. No single-step success is claimed for `simpleModule_linearEquiv_simple_submodule`, `toModuleEnd_bijective`, or `tensorOp_algEquiv_matrix`; their underlying native results are addressed by R05 instead. The successful probe file elaborates with only those three untouched admissions.

## R09 (P3) — Give the theorems exact source locators

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:298` and `:417`. The references list seven books with topic descriptions, without theorem/section/page locators for the targets.

**Claim:** The reader can verify the proposed theorems at their cited locations, including the seeded Skolem–Noether sample.

**Witness:** There is no theorem number or page to test for that sample. Gille–Szamuely Theorem 2.7.2 is on printed p. 40 and treats automorphisms; Proposition 2.7.3 concerns reduced norms, not two embeddings.

**Repair:** Add a precise locator at each mathematical target, and a `sources.toml` record for each cited work using the established source key. For the automorphism statement use Gille–Szamuely 2.7.2, pp. 40–41; for the two-map/general-centralizer forms use the exact Stacks locators in R04 or a legally verified book locator. Do not infer a two-embedding theorem merely from the title “Skolem–Noether”. The source verification and unavailable works are recorded below. No manifest was edited during this review.

## R10 (P3) — Supply definition APIs, discriminating Checks, and local dependencies

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:228`, `:232`, `:284`, `:351`, and the layer structure beginning at `:169`.

**Claim:** The presentation, intrinsic division ring/multiplicity, degree, splitting predicate and index have enough specification to support a reusable library.

**Witness:** None has a local API list and three discriminating Checks. There are no `*Needs:*` lines or per-layer Examples/Dependencies sections. The missing positivity law in R01 admits a presentation with an extra zero block.

**Repair:** Use the required Summary, Scope and ownership, Conventions, Exact supplier contracts and layer structure. For each genuinely retained definition, specify its API and at least three computed Checks; for native definitions, cite their API instead of inventing duplicate names. Include a noncommutative side-convention check: right multiplication by i composed with right multiplication by j sends 1 to −k in ℍ, whereas the unreversed product sends it to k. For splitting use `M₂(K)` (split), ℍ/ℝ (not split), and ℍ/ℂ (split); explicitly state the predicate's zero-algebra convention. Give individual theorem dependencies so R02 is visible. Scope the native finiteness of `isotypicComponents R M` accurately: Mathlib's instance at `RingTheory/SimpleModule/Isotypic.lean:302` assumes `IsNoetherian R M`; the regular semisimple-ring case satisfies it. A general-module class bijection does not itself assert finiteness. Remove or resolve undeclared private names such as `WedderburnPresentation`, `blockMultiplicity`, `brauerMul` and `splits_of_finrank`; use the native qualified names where available. Put the Layer 1.5 target before Layer 2 in the Lean layout if it survives the duplication audit.

## R11 (P3) — Remove the gate's process residue

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:36`: “the ‘`D` in `Type u`’ TODO”.

**Claim:** A historical TODO is part of the roadmap specification.

**Witness:** The worker's `residue` scanner reports this exact line. The pinned Mathlib existence theorem already returns `D : Type u` at `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:95`.

**Repair:** Delete the TODO narrative. State the universe convention directly in Conventions and cite the existing theorem if relevant. The requested universe is already realized by the native declaration. Also remove historical “once recorded”/“leaves open” wording when rewriting the supplier contracts.

## Verified sound

The following records successful checks and explicitly identifies failed controls; it is not a claim that the whole roadmap is sound.

**Reproducibility and scope.** Reviewed all 432 README lines and all 23 Lean declarations: 20 theorems, 2 instances, 1 real-bodied definition. The head is `6045796c796f8b79be6c14050819b341a4b3cdb2`. The checked library commits match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The requested outside-folder diff is empty, and `git status --short` is empty. The family index remains consistent about supplying the algebra foundation. No route-specific prime restriction, computational algorithm, copied source passage, `set_option`, forbidden import or new competing roadmap was found in this folder. This is an existing roadmap revision, so a Part II rename is not required merely to repair its statements and consumption inventory.

**Elaboration.** Ran `lake env lean` on the original `Suggested.lean`: exit 0, exactly 22 `sorry` warnings. Independently appended `#check @...` for every one of the 23 declarations in a scratch copy and elaborated it: exit 0. Compared the resulting types with the supplied signature report and the README; no section binder disappeared. All field, scalar-action, centrality and finite-dimension binders displayed in the original declarations remain present. The generality/completeness issues in R04/R06 are explicit signature restrictions or omissions, not silently dropped binders. Only individual missing native modules needed for probes were built; all three targeted builds succeeded. No Lean process was left running.

**Gate.** The worker's gate has `sorry-data=2`, `residue=1`, `depcheck=0`, `build=0`; all other counters are 0, and its verdict is FAIL. All three reported failures are covered by R03, R07 and R11. The successful Lean elaboration does not override the failed gate.

The independently rerun dependency check returned exactly:

```text
depcheck: 209 roadmaps, 1457 edges, 0 problem(s)
```

There is no UPWARD or CYCLE output for external suppliers. This roadmap is not listed separately in ORDER; that is not a finding. All explicit external inputs in the target are native libraries. CharacterTheory and ReductiveGroups are described as consumers, not suppliers. No `*Needs:*` line exists; R10 asks for local dependency statements. No declared gap was assumed. R02 is an internal layer dependency defect beyond this checker's result.

**Source sample.** All seven bibliographic works were attempted through the sources service. Read the legal institutional copy of [Gille–Szamuely (2006)](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf). `gille-szamuely line 957` imposes finite dimension for the chapter; `line 1847` is Theorem 2.7.2, printed p. 40; its proof continues on p. 41 at `line 1851`. It supports innerness of base-field algebra automorphisms of a finite-dimensional central simple algebra. The proof uses a finite Galois splitting field and Hilbert 90, not the roadmap's bimodule route. `line 1864` confirms that Proposition 2.7.3 is a different result. The README provides no locator to certify for its two-map statement. The independently fetched Stacks chapter supplies that statement at tag 074Q, `stacks-brauer line 215`, printed p. 5, with proof on p. 6. The source uses the opposite conjugation orientation; replacing its unit x by x⁻¹ gives the roadmap's `g = u f u⁻¹`. The centralizer theorem is tag 074T, `line 235`, printed p. 6. Its centrality refinement is tag 074U, `line 252`. Stacks uses right modules (`line 27`); the roadmap and Tau Ceti use left modules. The ring/center/dimension conclusions survive that translation. No README locator was explicitly marked unverified; the problem is absence of locators, not a passed check of unspecified numbers.

**Adversarial computations.** The table contains 55 rows. “Sound” means the displayed instance agrees with the stated mathematics; it does not replace a general proof. K denotes a field, 0 denotes the zero ring/module where appropriate, and ε denotes a nonzero square-zero element. These controls cover all Lean declarations, all headline results, and the defining/convention/API claims that affect them. Extra geometric or analytic controls from the generic rubric (DVR norms, compactness, fans, covers) have no corresponding object in this algebraic roadmap.

| # | Statement / location | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|---|
| 1 | Simple versus semisimple conventions, README 55–71 | 0, K, K×K | Simple: false, true, false; semisimple: true, true, true. For K×K there are 4 two-sided ideals; simple means exactly 2. | Native vocabulary sound; do not identify centrality with simplicity. |
| 2 | Radical criterion, Lean 39 | K, K[ε]/ε², 0 | `(semisimple, J=0)` = `(true,true)`, `(false,false)`, `(true,true)`; J is 0, Kε, 0 respectively. | Both directions agree. |
| 3 | Radical nilpotence, Lean 44 | K[ε]/ε²; 2×2 upper triangular matrices | J²=0 and J≠0 in both; nilpotence exponent 2. | Sound; consume native theorem. |
| 4 | Radical quotient, Lean 48 | Same two algebras | Quotients are K and K×K; semisimplicity true and true. | Sound. |
| 5 | Radical/opposite and semiprimary symmetry, README 184 | Upper triangular 2×2 matrices | J has dimension 1 on each side, J²=0 on each side; opposite is lower triangular, quotient K×K on each side. | Sound native symmetry. |
| 6 | Left-Artinian opposite Noetherian/Artinian iff, README 188 | M₂(K), triangular algebra | Right Noetherian=true and right Artinian=true in both finite-dimensional examples. | Hypothesis and equivalence match pin. |
| 7 | Schur vanishing, Lean 55 | Two distinct coordinate simples of K×K | Any map scalar c satisfies c=0 from the action of (1,0); Hom dimension 0. Same simple has Hom dimension 1, so non-isomorphism is necessary. | Sound. |
| 8 | Schur isomorphic Hom, README 193 | K×K, same coordinate simple twice | End=K, Hom=K, both dimension 1; between different simples both Hom and zero space dimension 0. | Sound, equivalence depends on a chosen isomorphism. |
| 9 | Division algebra over algebraically closed field, Lean 63 | D=k; drop closedness with ℍ/ℝ | Dimensions 1=1 for D=k; 4≠1 for ℍ/ℝ. | Closedness retained; native theorem supplies result. |
| 10 | Corrected A-linear Schur clause, README 194–206 | A=M₂(ℂ), S=ℂ² | End_A(S)=ℂ has dimension 1; End_ℂ(S)=M₂(ℂ) has dimension 4. | Correction is supported at the pins. |
| 11 | Finite-dimensionality in Schur | A=S=ℂ(t), as ℂ-algebra/module | S is simple over A, End_A(S)=ℂ(t); t is not a scalar in ℂ. Finite ℂ-dimension=false. | Excludes the infinite-dimensional negative control. |
| 12 | Isotypic class dictionary, README 207 | M=K² over K; M=K⊕K over K×K; M=0 | Isotypic-component counts and simple-submodule isomorphism-class counts are respectively 1=1, 2=2, 0=0. | Sound; distinct actual lines in K² are not distinct classes. |
| 13 | Finiteness of components, README 207 | Regular K×K; ⊕ₚ ℤ/p over ℤ | Counts 2 and infinitely many (one for each prime); Noetherian condition true and false. | Scope generic library contract as in R10. |
| 14 | Minimal-left-ideal realization, Lean 85 | M=K², R=M₂(K); zero ring | Matrices with only first column nonzero form a dimension-2 simple ideal, matching dim M=2. Zero ring has 0 simple modules, so the universal claim has no instance there. | Sound; already Mathlib. |
| 15 | Primitive idempotent dictionary, README 221 | E₁₁ and 1 in M₂(K) | E₁₁²=E₁₁; R E₁₁ has dimension 2 and is simple. 1²=1; R1 has dimension 4 and length 2, so 1 is not primitive. | Correct distinction; needs explicit API/Checks. |
| 16 | Chosen presentation, README 228 | K and K×M₀(K); 0 | Valid listed fields allow block sizes (1) and (1,0), counts 1 and 2. Empty product has count 0 and carrier 0. | Fails without positivity; R01. |
| 17 | Intrinsic division ring / opposite convention, README 59,232 | R=S=ℍ, right multiplication maps r_i,r_j | `(r_i∘r_j)(1)=j i=−k`; `r_(ij)(1)=k`. Thus End_R(S)=ℍᵒᵖ, and its opposite returns ℍ. | Convention correct; add this numerical sign Check. |
| 18 | Multiplicity and full block invariance, README 232–238 | M₂(K)×K, reordered factors | Simple dimensions 2,1; regular multiplicities 2,1; total dimension 2·2+1·1=5. Reordering gives degrees (1,2) and the same paired data. | Sound with positive blocks; full theorem absent/implemented natively. |
| 19 | Block count, Lean 75 | 0, K, K×K, M₂(K) | Number of positive blocks and simple classes respectively 0=0, 1=1, 2=2, 1=1. Appended zero block gives 1≠2 but fails `NeZero`. | Lean hypotheses correct. |
| 20 | Blocks enumerate simples, Lean 94 | M₂(K)×K; 0 | Representatives have dimensions 2,1; Hom between them is 0; count 2. Empty case has empty family and 0 simple ideals. | Sound. |
| 21 | General dimension count, Lean 104 | ℍ×ℝ over ℝ; zero-size block with D=K(t) | 5=1²·4+1²·1. A zero block contributes 0²·finrank_K K(t)=0·0=0. | Sound even though positive-block finiteness is not available at size 0. |
| 22 | Split dimension count, Lean 112 | k[S₃] in characteristic 0; k[C₂]; 0 | 6=1²+1²+2²; 2=1²+1²; 0=empty sum. | Sound; algebraic closedness unnecessary once split presentation is supplied. |
| 23 | Double-endomorphism bijection, Lean 125 | R=M₂(𝔽₂), M=𝔽₂² | D=𝔽₂; R and End_D M each have 16 elements and dimension 4; the action sends E₁₂ e₂ to e₁. | Sound; faithful action follows from simple R and nonzero M. |
| 24 | Faithfulness necessity, README 251 | R=K×K, M=K via first projection | Image=K, kernel=0×K; map surjective=true, injective=false. | Prose faithful hypothesis is needed and correct. |
| 25 | Density on independent vectors, README 264 | M=𝔽₂², basis e₁,e₂; dependent pair e₁,e₁ | Sending e₁→e₂ and e₂→e₁ is realized by [[0,1],[1,0]]. Sending the repeated e₁ to both 0 and e₂ gives 0≠e₂. | Independence condition correct; native corollary. |
| 26 | Simple-module dimension formula, README 267 | R=M₂(ℍ), M=ℍ² over ℝ | dim R=16; n·dim M=2·8=16; End_R(M)=ℍᵒᵖ. | Sound with compatible scalar actions. |
| 27 | Central division Wedderburn refinement, README 276 | M₂(ℍ), ℍ, K | (n,dim D)=(2,4),(1,4),(1,1); dimensions 16=4·4, 4=1·4, 1=1·1. | Sound; native ownership. |
| 28 | Tensor simplicity, Lean 134 | M₂(𝔽₂)² tensor; ℍ² tensor | Products split as M₄(𝔽₂), M₄(ℝ), dimensions 4·4=16; simple=true. ℂ⊗ℝℂ=ℂ×ℂ is not simple, but ℂ is not central over ℝ. | Sound hypotheses; R07 form defect. |
| 29 | Square dimension, Lean 140 | K, M₂(K), ℍ; ℂ/ℝ | 1=1², 4=2², 4=2². dimℝℂ=2 is not a square, and centrality=false. | Sound statement; route ordering R02. |
| 30 | Degree definition, README 284 | K, M₂(K), ℍ, 0 | sqrt dimensions =1,2,2,0; squares=1,4,4,0. Zero is outside CSA use; floor sqrt(2)=1 would not prove square dimension for ℂ/ℝ. | Native Nat.sqrt definition plus square theorem needed. |
| 31 | Opposite tensor isomorphism, Lean 145 | A=K; A=ℍ | Dimensions 1·1=1²; 4·4=16=dim M₄(ℝ). M₂(ℝ) would have dimension 4≠16. | Matrix size is dim A, correctly stated. |
| 32 | Azumaya left/right map, README 290 | A=M₂(K), a=E₁₂,b=E₂₁,x=E₂₂ | a x b=E₁₁; reversed b x a=0. End_K A has dimension 16 while dim A=4. | Correct left/right operation; parenthetical wording must not equate dim A with dim End A. |
| 33 | Endomorphism-matrix comparison, README 293 | V=K² and V=0 | End dimensions 4=dim M₂(K), 0=dim M₀(K); both equivalences exist. | Nonzero condition only needed on Brauer use, not this comparison. |
| 34 | Skolem–Noether, Lean 160 | M₂(K), g conjugation by permutation P; B=K | P E₁₁ P⁻¹=E₂₂=g(E₁₁). For scalar B, f=g and u=1 gives c=c. | Restricted signature true; consume pin and add general target. |
| 35 | Conjugation direction, README 303 | ℍ, u=1+i, x=j | u j u⁻¹=k; u⁻¹ j u=−k. Here u⁻¹=(1−i)/2 and 2≠0 in ℝ. | Direction matches displayed equation and pinned proof. |
| 36 | Merely simple source, README 326 | f,g:ℂ→ℍ, inclusion and conjugation | g(i)=−i=j i j⁻¹. Source center dimension 2, ambient center dimension 1. | Required generalization works; R04. |
| 37 | Removing both centrality conditions, README 325 | f=id,g=conjugation on ℂ over ℝ | Every inner automorphism sends i to i; g(i)=−i≠i. | Valid negative control only for the doubly weakened statement. |
| 38 | Skolem proof route / equal-dimensional modules, README 307–320 | B=K,A=M₂(K); also zero modules | The bimodule is regular over M₂(K)ᵒᵖ: dimension 4, length 2, not simple. Two such structures have dimensions 4=4; zero modules 0=0. | Classification route is correct; density-on-simple-module route would fail. |
| 39 | Centralizer simplicity, Lean 168 | B=K and B=A in A=M₂(K) | Centralizers are A and K; both simple=true, dimensions 4 and 1. | Sound. |
| 40 | Centralizer dimension product, Lean 176 | B=M₂(K)⊗1 inside M₄(K); B=ℂ⊂ℍ | 4·4=16; 2·2=4. The second B is noncentral but the formula is unchanged. | Restricted theorem sound; excluded general form R04. |
| 41 | Double centralizer, README 330 | Same two inclusions | Centralizers swap tensor factors in M₄(K), so twice gives B of dimension 4; for ℂ⊂ℍ, twice gives ℂ of dimension 2. | Sound; full headline absent. |
| 42 | Centrality and tensor-factorization refinement | ℂ⊂ℍ; M₂(K)⊗1⊂M₄(K) | C=ℂ has center dimension 2, not 1; ℂ⊗ℝℂ=ℂ×ℂ≠ℍ. In the central case dimensions 4·4=16 and multiplication is bijective. | Keep B-central only for this refinement. |
| 43 | Matrix/End Brauer triviality, README 337 | M₁(K),M₂(K),End(K),End(0) | First three classes=[K]; dimensions 1,4,1. Last dimension 0, 0=1, no CSA class. | False unqualified zero case; R01. |
| 44 | Matrix absorption, README 338 | m=2,n=3,A=B=K; m=0 | Dimensions (2²)(3²)=36=6²; with m=0 both sides have dimension 0. | Algebra equivalence sound even at zero size; distinguish Brauer use. |
| 45 | Brauer group laws / uniqueness, Lean 187, README 343 | Br(ℝ) classes 0=[ℝ],h=[ℍ] | h+h=0, −h=h; 0+h=h. Division representatives have dimensions 1,4. Transported law has 0⋆0=h. | Native operations correct; bare admitted group data underdetermines them, R03. |
| 46 | Scalar extension preserves CSA, README 346 | ℍ from ℝ to ℂ; inseparable negative control | ℂ⊗ℝℍ=M₂(ℂ), dimension 4. For L=𝔽₂(s),K=𝔽₂(t),s²=t, L⊗K L=L[ε]/ε² with ε≠0 and ε²=0; L is not central over K. | CSA hypothesis excludes failure under inseparable base change. |
| 47 | Brauer base-change homomorphism/kernel, README 349 | ℝ→ℂ | 0↦0 and h↦0; h+h↦0=0+0; kernel={0,h}, exactly the split-over-ℂ classes. Identity extension kernel={0}. | Sound; actual homomorphism must use native operations. |
| 48 | Splitting predicate, Lean 192, README 351 | M₂(K)/K; ℍ/ℝ; ℍ/ℂ; 0/K | Existential matrix sizes 2, none, 2, 0 respectively. ℍ is division and M₂(ℝ) has nonzero zero divisors, excluding a real splitting. | Real-bodied definition meaningful, including zero; duplicates native definition. |
| 49 | Algebraically closed splitting, Lean 198 | ℍ/ℂ; M₂(k)/k | Both become M₂, dimension 4=2²; split=true in both. | Sound; native separably closed theorem is stronger. |
| 50 | Maximal subfields split division algebras, README 354 | ℂ⊂ℍ; K⊂K | Extension dimensions 2=degℍ and 1=degK; resulting matrices M₂(ℂ), M₁(K). | Sound; native carrier and theorem available. |
| 51 | Finite and finite-separable splitting, README 355–357 | ℍ/ℝ; M₂(𝔽₂)/𝔽₂ | Extensions ℂ/ℝ of degree 2, separable=true; identity extension of degree 1, separable=true. | Both headlines statable; absent/implemented. |
| 52 | Index, README 357 | M₃(ℍ), M₂(K), K | Indices 2,1,1; degrees 6,2,1; 2 divides 6 and minimal splitting degrees 2,1,1. | Arithmetic meaning agrees; consume native index. |
| 53 | Finite-field Brauer group, README 358,389 | 𝔽₂,𝔽₃; drop centrality with 𝔽₄/𝔽₂ | Each Brauer group has 1 element. 𝔽₄ has dimension 2 and center dimension 2 over 𝔽₂, so is excluded as a central division algebra. q=1 is not a field. | Correct centrality control. |
| 54 | Quaternion targets and real summit, Lean 205,209,213; README 360–393 | ℍ/ℝ, ℍ² tensor, ℂ⊂ℍ | Center dimension 1; algebra dimension 4; tensor dimension 16=dim M₄(ℝ); class order 2; Br(ℝ) has 2 elements; j i j⁻¹=−i. | All computations sound; quaternion scalar targets are padding, real summit natively available. |
| 55 | Group algebra / Maschke / nonabelian dimension examples, README 381 | Trivial group,C₂,S₃,Q₈ over ℂ; C₂ over 𝔽₂ | Sum of squares: 1,2,6,8 respectively (Q₈: 1+1+1+1+4). In 𝔽₂[C₂], ε=g−1≠0, ε²=0, J has dimension 1; 2=0 so Maschke hypothesis fails. | Sound; no “good primes only” restriction added beyond the theorem's necessary hypothesis. |

**Native declarations opened and probe results.** Paths below are relative to the pinned library repositories. The following table records exact inputs, not a search on newer libraries. A “one-step” entry means the unchanged signature in a scratch copy closed with one tactic after importing individual native modules; it is evidence for deleting the duplicate, not a proposed proof to commit.

| Original Lean line/name | Native declaration and file:line | Result |
|---|---|---|
| 39 `isSemisimpleRing_iff_jacobson_eq_bot` | `TauCeti.isSemisimpleRing_iff_jacobson_eq_bot`, `TauCeti/RingTheory/Jacobson/FiniteOverArtinian.lean:51` | one-step `exact ... (K := K)`; native allows finite over an Artinian ring |
| 44 `isNilpotent_jacobson` | `TauCeti.isNilpotent_jacobson`, same file:57 | one-step `exact ... (K := K)` |
| 48 `isSemisimpleRing_quotient_jacobson` | `TauCeti.isSemisimpleRing_quotient_jacobson`, same file:62 | one-step `exact ... (K := K)` |
| 55 `hom_eq_zero_of_isEmpty_linearEquiv` | `TauCeti.hom_eq_zero_of_isEmpty_linearEquiv`, `TauCeti/RingTheory/Semisimple/Schur.lean:90` | one-step `exact ... h f` |
| 63 `algEquiv_self_of_finiteDimensional_divisionRing` | `TauCeti.nonempty_algEquiv_self_of_finiteDimensional_divisionRing`, same file:149 | one-step `exact` |
| 75 `card_blocks_eq` | `TauCeti.card_blocks_eq`, `TauCeti/RingTheory/Semisimple/BlockCount.lean:268` | one-step `exact ... e e'`; native does not need semisimplicity once presentations exist |
| 85 `simpleModule_linearEquiv_simple_submodule` | `IsSemisimpleRing.exists_linearEquiv_ideal_of_isSimpleModule`, `Mathlib/RingTheory/SimpleModule/Basic.lean:416`; transfer simplicity with `IsSimpleModule.congr`, :108 | `simp` probe failed; native theorem plus transfer supplies the conjunction |
| 94 `blocks_equiv_simpleModules` | `TauCeti.blocks_equiv_simpleModules`, `TauCeti/RingTheory/Semisimple/Wedderburn/Blocks.lean:180` | one-step `exact ... e` |
| 104 `finrank_eq_sum_sq_finrank` | `TauCeti.finrank_eq_sum_sq_finrank`, `TauCeti/Algebra/Matrix/Pi.lean:170` | one-step `exact ... K e`; native allows general coefficient algebras |
| 112 `finrank_eq_sum_sq_of_isAlgClosed` | `TauCeti.finrank_eq_sum_sq_of_isAlgClosed`, `TauCeti/RingTheory/Semisimple/DimensionCount.lean:75` | one-step `exact ... k e` |
| 125 `toModuleEnd_bijective` | `TauCeti.toModuleEnd_moduleEnd_bijective_of_isSimpleRing`, `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:172`; `IsSimpleModule.nontrivial`, `Mathlib/RingTheory/SimpleModule/Basic.lean:87` | single `exact` failed to infer Nontrivial M; supplying this native consequence gives the native theorem |
| 134 `tensorProduct_isSimpleRing` | `TauCeti.IsSimpleRing.tensorProduct`, `TauCeti/Algebra/CentralSimple/TensorProduct.lean:185` | one-step `infer_instance`; neither finiteness nor centrality of both factors is needed by native theorem |
| 140 `finrank_isSquare` | `TauCeti.IsSimpleRing.isSquare_finrank`, `TauCeti/Algebra/CentralSimple/Degree.lean:141` | one-step `exact ... K A` |
| 145 `tensorOp_algEquiv_matrix` | `TauCeti.IsSimpleRing.isAzumaya`, `TauCeti/Algebra/CentralSimple/Opposite.lean:177`; `TauCeti.Algebra.tensorOpAlgEquivMatrix`, :230 | `simp` failed; native equivalence needs the supplied Azumaya proof installed explicitly |
| 160 `skolemNoether` | `TauCeti.skolemNoether`, `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107` | one-step `exact ... K f g`; native assumes B central, A simple finite, not A central or B finite |
| 168 `centralizer_isSimpleRing` | `TauCeti.centralizer_isSimpleRing`, `TauCeti/Algebra/CentralSimple/Centralizer.lean:372` | one-step `exact ... B`; B central, A simple finite |
| 176 `finrank_mul_finrank_centralizer` | `TauCeti.finrank_mul_finrank_centralizer`, same file:392 | one-step `exact ... B` |
| 187 `brauerCommGroup` | `TauCeti.BrauerGroup.instCommGroup`, `TauCeti/Algebra/BrauerGroup/Group.lean:174` | one-step `infer_instance`; native same-universe group has real operations |
| 192 `IsSplittingField` | `TauCeti.Algebra.IsSplittingField`, `TauCeti/Algebra/CentralSimple/Splitting.lean:120` | definition bodies agree, using L⊗A with the L-algebra structure on the left |
| 198 `isSplittingField_of_isAlgClosed` | `TauCeti.Algebra.isSplittingField_of_isSepClosed`, same file:244 | one-step `exact ... K A L`; succeeds definitionally against the local duplicate |
| 205 `quaternion_isCentral` | `TauCeti.Quaternion.instIsCentral`, `TauCeti/Algebra/Central/Quaternion.lean:165` | one-step `infer_instance`; native needs no zero divisors and 2≠0 |
| 209 `quaternion_finrank` | `Quaternion.finrank_eq_four`, `Mathlib/Algebra/Quaternion.lean:931` | one-step `exact Quaternion.finrank_eq_four` |
| 213 `quaternion_tensor_self` | `TauCeti.Quaternion.tensorSelfAlgEquivMatrix`, `TauCeti/Algebra/CentralSimple/Quaternion.lean:110` | one-step `exact ⟨...⟩` |

Additional opened inputs and headline carriers:

- `Mathlib/RingTheory/SimpleModule/Basic.lean:60`, `:65`, `:73`: simplicity is a simple order on submodules, semisimplicity a complemented lattice, and semisimple ring means semisimple regular left module. The zero module is semisimple but not simple. `Mathlib/RingTheory/SimpleRing/Defs.lean:27` uses a simple order of two-sided ideals; centrality alone does not assert simplicity, finite dimension, or nontriviality (`Mathlib/Algebra/Central/Defs.lean:67`). `CSA` includes centrality, simplicity and finiteness at `Mathlib/Algebra/BrauerGroup/Defs.lean:39`.
- Schur's original library inputs: `LinearMap.bijective_or_eq_zero`, `Mathlib/RingTheory/SimpleModule/Basic.lean:499`; `linearEquiv_of_ne_zero`, :512. The changed README paragraph agrees with `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`, `Mathlib/RepresentationTheory/AlgebraRepresentation/Basic.lean:28`, including `IsScalarTower k A S`, simple A-module, finite k-dimension and algebraically closed k. The packaged inverse is `TauCeti.endAlgEquivSelfOfIsSimpleModule`, `TauCeti/RingTheory/Semisimple/Schur.lean:175`, with the binders at :159–161. It does not say End_k(S)=k.
- `IsSimpleRing.exists_ringEquiv_matrix_end_mulOpposite`, `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:86`, and `IsSemisimpleRing.exists_ringEquiv_pi_matrix_divisionRing`, :222, include positive sizes. `isSemisimpleRing_iff_pi_matrix_divisionRing`, :244, permits zero blocks for its existence-only equivalence, which cannot be reused unaltered for uniqueness. `TauCeti.wedderburn_blocks_unique`, `TauCeti/RingTheory/Semisimple/Wedderburn/Uniqueness.lean:47`, explicitly provides a permutation, equal sizes and ring equivalences of division coefficients.
- `TauCeti.simpleSubmoduleClassesEquiv`, `TauCeti/RingTheory/Semisimple/RegularIsotypicComponent.lean:156`, and the intrinsic `TauCeti.blockMultiplicity`, `TauCeti/RingTheory/Semisimple/Wedderburn/Canonical.lean:137`, already supply the class dictionary and multiplicity. `TauCeti.WedderburnPresentation.exists_equiv_degree_eq_blockMultiplicity`, :260, compares presentations with intrinsic data. Classes of simple submodules avoid quantifying a carrier over all universes.
- `jacobson_density`, `Mathlib/RingTheory/SimpleModule/Basic.lean:560`, assumes semisimplicity of M; `Module.Finite.toModuleEnd_moduleEnd_surjective`, :572, additionally assumes finiteness over End_R(M). The README's simple-module uses meet the semisimplicity hypothesis. `TauCeti.Matrix.mulOppositeRingEquivEnd`, `TauCeti/RingTheory/Semisimple/MatrixDivisionRing.lean:200`, requires a nonempty matrix index and identifies the coefficient opposite with endomorphisms of the column module. Its value is right multiplication (:231).
- `TauCeti.Ring.coe_jacobson_mulOpposite`, `TauCeti/RingTheory/Jacobson/MulOpposite.lean:129`; `TauCeti.isSemiprimaryRing_mulOpposite_iff`, :256; `TauCeti.IsSemiprimaryRing.mulOpposite`, :263; and `TauCeti.IsArtinianRing.isNoetherianRing_iff_isArtinianRing_mulOpposite`, :269, all exist and have the stated sided hypotheses.
- `TauCeti.IsSimpleRing.nonempty_linearEquiv_of_finrank_eq`, `TauCeti/RingTheory/Semisimple/SimpleArtinian.lean:115`, has simple finite-dimensional R and two finite-dimensional modules with scalar towers. `TauCeti.Bimodule.symm_apply_one_mul_eq_mul_symm_apply_one`, `TauCeti/Algebra/CentralSimple/Bimodule.lean:196`, gives u f(b)=g(b)u; `exists_symm_apply_one_mul_eq_one`, :216, needs 1 in the range and supplies a right inverse. The pinned Skolem proof explicitly supplies Artinian A before using Dedekind finiteness. These match the revised proof route.
- `TauCeti.centralizer_isCentral`, `TauCeti/Algebra/CentralSimple/Centralizer.lean:457`, and `TauCeti.centralizer_centralizer`, :479, cover the restricted central-subalgebra case. The subfield dimension formula `TauCeti.finrank_mul_finrank_centralizer_of_isField`, :357, already applies to ℂ⊂ℍ without centrality of ℂ over ℝ.
- The Azumaya direction was checked: `Algebra.IsCentral.instIsAzumaya`, `Mathlib/Algebra/Azumaya/Basic.lean:85`, concludes centrality FROM Azumaya and freeness, not Azumaya from centrality. The latter required input for finite central simple algebras is Tau Ceti's theorem at `Opposite.lean:177`. Mathlib's `tensorEquivEnd` at :45 is for the base algebra R itself, whereas Tau Ceti's `tensorOpAlgEquivEnd` at `Opposite.lean:199` has the required general algebra carrier.
- `TauCeti.Algebra.exists_subalgebra_isField_finrank_eq_deg`, `TauCeti/Algebra/CentralSimple/MaximalSubfield.lean:118`, and `exists_isSplittingField_finrank_eq_deg`, :135, expose subalgebras/fields and embeddings on native carriers. `TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable`, `TauCeti/Algebra/CentralSimple/FiniteSeparable.lean:45`, produces a finite intermediate field of the separable closure. `TauCeti.Algebra.index_eq_deg_of_algEquiv_matrix`, `TauCeti/Algebra/CentralSimple/Index.lean:112`, and `exists_isSplittingField_finrank_eq_index`, :255, supply the index interface.
- `TauCeti.subsingleton_brauerGroup_of_finite`, `TauCeti/Algebra/BrauerGroup/Trivial.lean:247`, handles finite fields. `TauCeti.nonempty_algEquiv_real_or_quaternion`, `TauCeti/Algebra/CentralSimple/Real.lean:346`, classifies finite-dimensional central real division algebras. `TauCeti.Quaternion.card_brauerGroup_eq_two`, `TauCeti/Algebra/BrauerGroup/Real.lean:90`, and `brauerGroupMulEquiv`, :102, supply the real summit. The equivalence is multiplicative, with target `Multiplicative (ZMod 2)`.

**Headline inventory.** The README's deep results are full Wedderburn invariance; the simple-module/block/primitive-idempotent dictionary; faithful finite-density double centralizer; central-division Wedderburn refinement; tensor simplicity; square dimension/degree; opposite tensor splitting; Skolem–Noether; centralizer simplicity/centrality/dimension and bicentralizer; the tensor-product Brauer group and base change; division representatives; algebraically closed, finite, finite-separable and maximal-subfield splitting; index; finite-field Brauer triviality; and the real Brauer group/classification. All have native carriers at the pins. The Lean file includes restricted or partial instances of the first, dictionary, density, tensor/square/opposite, Skolem–Noether, centralizer, and algebraically closed splitting results, plus the admitted group structure. It lacks full uniqueness, primitive-idempotent correspondence, bicentralizer, base-change/kernel, finite/separable/maximal-subfield splitting, index and both field-specific Brauer classifications. There is no genuine missing-carrier justification in its docstring. R05/R06 require separating already supplied results from the remaining new acceptance tests, rather than adding a second copy of all native results.

**Ownership and cross-roadmap audit.** Used the required `roadmaps grep` object search for Skolem–Noether, central simple algebras, Brauer groups, presentations and multiplicities across open heads and main, plus a direct search of board package READMEs/design plans. Read the relevant results rather than treating matches as ownership claims. The main `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/` is this existing owner. The main `TauCetiRoadmap/QuadraticFormInvariants/README.md`, Ownership and coordination at line 3333, explicitly leaves general central-simple and splitting theory to it and takes quaternion/Clifford/cohomological comparisons. Board package `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:104` consumes the semisimple owner's Layers 2–3 and 6; that is a consumer contract, not an input here. The supplied-head `TauCetiRoadmap/QuaternionArithmetic/README.md:21` uses the existing symbol-algebra carrier for arithmetic of orders; `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:324` treats symbol algebras and their Brauer classes. Neither claims a second general semisimple/Brauer carrier. No distinct roadmap-folder declaration collision was identified; occurrences of this same namespace in other checkouts are inherited copies of the existing SemisimpleAlgebras folder, not separate declarations to build.

Resolved CharacterTheory's citation on main at `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:221`: Mathlib supplies its decomposition, and SemisimpleAlgebras supplies the block dictionary. Also read the explicitly supplied open CharacterTheory head through `roadmaps show`: its exact contracts at lines 205–211 consume SemisimpleAlgebras Layer 1's A-linear Schur statement and Layer 2's block dictionary. These agree with the corrected paragraph. Its revision is not used as a supplier. The ReductiveGroups link resolves on main and is downstream context; no section of it is consumed by this roadmap. The family index `TauCetiRoadmap/RepresentationTheory/README.md:13` and :67 describes the same supply direction. Two main-roadmap shape examples were read: GrothendieckEulerForms and QuadraticFormInvariants. Open-work ownership was searched using the supplied-head index, not inferred from memory or an unaudited PR description.

## Not verifiable

- The README's seeded Skolem–Noether theorem number/page cannot be certified as written because none is provided. The actual Gille–Szamuely locator and the general Stacks replacement are verified above; this is R09, not a reason to park the review.
- `lam`: *A First Course in Noncommutative Rings*, second edition (2001). The sources service resolved a Springer DOI and returned `uncertified` (paywalled publisher). No paywall was bypassed; no text-level claim about that book is made.
- `farb-dennis`: *Noncommutative Algebra* (1993). Same `uncertified` outcome at Springer. No request to reopen access is made.
- `pierce`: *Associative Algebras* (1982); `curtis-reiner`: *Representation Theory of Finite Groups and Associative Algebras* (1962); `jacobson`: *Basic Algebra II*, second edition (1989). The sources service's bibliographic/legal-source resolution found no readable text. Exact target locators are also absent. These remain in the scratch missing-reference list, with the same keys.
- `herstein`: *Noncommutative Rings* (1968). The service led to a JSTOR landing page rather than a readable book text. It was not treated as the book or fetched past an access restriction; the missing-reference list records that attempt.
- The degree-three cyclic division algebra over ℚ used at README line 259 has no specified construction or local invariants. The assertion that Brauer order 3 excludes isomorphism with the opposite is mathematically valid (1 ≠ −1 in ℤ/3), but that particular claimed example has no supplied locator. The explicit ℍ multiplication computation in table row 17 independently verifies the necessary side convention without relying on this unspecified example.

No conclusion here relies on inaccessible book contents. No source manifest or pull-request file was modified, and the review is complete rather than parked for a reference.

## Source issues

- none
