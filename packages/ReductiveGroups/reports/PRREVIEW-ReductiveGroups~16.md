# Review of ReductiveGroups (pull request #1676 at 72e4141)

**Verdict:** needs changes

## R01 (P2) — The companion files still admit mathematical data

**Location:** `TauCetiRoadmap/ReductiveGroups/SpecialLinearCoordinateTargets.lean:16`, “noncomputable def coordinatePresentation”; also `SignedADETargets.lean:143`, `FoldingADETargets.lean:190`, and `SpectralWeylTargets.lean:63` in the same folder.

**Claim:** The form rules apply to all nine listed Lean files. Eight companions remain construction/API catalogues. Several import roadmap modules and individual Mathlib modules; they admit equivalences, bases, homeomorphisms and other data, rather than state headline existence theorems. Suggested's passing gate does not validate these companions.

**Witness:** The bodies of `coordinatePresentation`, `rootLineQuotientEquiv`, `fixedIntegralBasis`, and `centerHomeomorph` are `sorry`. `CoverLiftTargets.lean:1` imports a roadmap module; its lines 30–38 additionally refer to unavailable `CoverLifts.LiftGroup` and `CoverLifts.projection`.

**Repair:** Delete the eight obsolete companion catalogues, preserving their specifications and Checks in the README. Any genuinely statable endpoint belongs in Suggested with only simple real definitions; name unstatable endpoints and missing carriers in its docstring. Do not relocate admitted data. The existing existential SL headline at `Suggested.lean:213` demonstrates the repair: n=0,1,2 give ℤ, ℤ[x]/(x−1), and ℤ[a,b,c,d]/(ad−bc−1), without an admitted equivalence definition. When consolidating, explicitly account for the Levi-complement and finite Harish–Chandra endpoints as well as the already-listed missing carriers.

## R02 (P2) — Rational cohomology and cotensor induction have an earlier owner

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:17`, “Layer 1.1 owns rational cohomology and cotensor induction”; construction at 439–545; reversed downstream claim at 3655–3656.

**Claim:** This duplicates IntegralHeckeAndGaloisDeterminants §0.7, including its generality over arbitrary commutative bases and nonflat coefficient modules. Calling the supplier a consumer reverses the existing contract. This is not an extension requiring a new owner.

**Witness:** `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1146–1174,1210–1225` specifies the same cofree complex, enough injectives, tensor permutation, cotensor equalizer, reciprocity and antipode conversion. ReductiveGroups on main, README 221–225, already imports that section.

**Repair:** Restore §0.7 as a named supplier. Remove the duplicate generic targets and the reversed downstream assertion; retain the group-scheme/rational-representation adapters and reductive applications. The proposed import handles the actual separating instances: weight one over ℤ[t,t⁻¹] gives d⁰(1)=t−1 and d¹d⁰(1)=0; H=ℤ, M=ℤ/2 gives H⁰=ℤ/2 and Hⁿ=0 for n>0. Neither supplier requires M flat. The source sample supports the mathematics but does not change its ownership.

## R03 (P2) — The complex topology and smooth charts duplicate ComplexComparisonPartII

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:19`, “Layer 3A.5 owns the classical complex-point topology”; construction at 790–821 and downstream claim at 3656–3661.

**Claim:** ComplexComparisonPartII C−1.1 supplies the same underlying topological carrier, gluing, smooth charts and separated/proper comparisons. Forgetting its analytic ring sheaf does not make these new constructions. ReductiveGroups on main already imports this interface.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:774–803` supplies these comparisons for locally finite-type complex schemes, allowing infinite affine covers, nilpotents and nonseparated schemes. `TauCetiRoadmap/ReductiveGroups/README.md:342–348` on main consumes its complex-point interface.

**Repair:** Import C−1.1's underlying topology and smooth-chart comparisons; delete their reconstruction and reversed supply claim. Keep the group, orbit, stabilizer and tangent comparisons. Test the imported carrier on Spec ℂ[ε]/ε² (one point, ring dimension 2) and the doubled affine line (two distinct nonseparable origins). Both are already in the supplier's stated domain. Taking its topology requires no proper-GAGA theorem.

## R04 (P2) — The Kummer exact sequence needs a positive exponent

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:997–999`, “the exact sequence `0 → ℤ → ℤ → ℤ/n → 0` (multiplication by `n`) corresponds to `1 → μ_n → 𝔾_m → 𝔾_m → 1`”.

**Claim:** Neither this Check nor the standing conventions assumes n>0. The claimed exact sequences fail at n=0, even though the character-group dictionary still makes sense there.

**Witness:** At n=0, ker(ℤ —0→ ℤ)=ℤ, while im(0→ℤ)=0. The power map t↦t⁰ has image {1}; the section 2∈𝔾_m(ℚ) has no preimage even after a faithfully flat extension.

**Repair:** State n≥1 for the two short exact sequences. Separately retain D(ℤ/0ℤ)=𝔾_m and the negative control that the zero-power map is not an epimorphism. At n=1 both middle maps are identities. At n=2 multiplication on ℤ is injective with cokernel ℤ/2 and squaring has kernel μ₂ and is fppf-surjective, including characteristic 2. Do not replace fppf surjectivity by surjectivity on rational points or invert n.

## R05 (P3) — The companions retain one-tactic and Check padding

**Location:** `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:85`, `FoldingADETargets.lean:329`, and `BruhatCoordinateTargets.lean:119`.

**Claim:** Quotient-map continuity, the fixed-submodule kernel equation and evaluation of a just-defined covering homeomorphism are not deep acceptance endpoints.

**Witness:** The first closes with `exact continuous_quotient_mk'`; the second with `exact LinearMap.fixedSubmodule_eq_ker _`. Both library probes elaborated without warnings at the pins. The third is already proved by `rfl` in its file.

**Repair:** Delete these from the companion acceptance material; if migrated, delete it from `Suggested.lean`. Keep the mathematical statements/Checks in the README, rather than proving them in place. For −id on ℤ, fixed points and ker(−2) are both 0; on ℤ/2 both are the whole module. On the identity covering both evaluation expressions are e. These are library/definition consequences. R01's deletion also resolves this finding.

## Verified sound

**Re-review of the previous eight findings.** These dispositions were checked before the full pass. Four are repaired; four remain. No supplied repair report designates any as “not actionable in this package”.

| Previous finding | Current passage and verified witness | Disposition |
|---|---|---|
| R01, companion form | `SpecialLinearCoordinateTargets.lean:16–20`: “noncomputable def coordinatePresentation” still has body `sorry`. | Not repaired; R01 above. |
| R02, duplicate cohomology | README 3655–3656: “are outputs for IntegralHeckeAndGaloisDeterminants §0.7”. Both copies construct the same flat-Hopf theory. | Not repaired; R02. |
| R03, duplicate topology | README 3656–3658: “are outputs for ComplexComparisonPartII C-1.1”. The supplier already includes this topology and these charts. | Not repaired; R03. |
| R04, native unipotent radical | README 45–48: “The native k-unipotent radical, its maximality, uniqueness and isomorphism transport”; declarations at 226–243, actual residual targets at 1034–1048 and 2895ff. Suggested 44–46 identifies the missing represented quotient. | Repaired. 𝔾_a gives ideal 0; SL₂ gives the augmentation ideal. |
| R05, native kernel differential | README 258–269 consumes `lieSubalgebra_kernelHopfIdeal` and `kernelLieEquiv`; 609–620 retains the “compatibility” with scheme transport. | Repaired. Frobenius on 𝔾_a gives Lie α_p=k=ker(0); identity gives 0=ker(id). |
| R06, non-Noetherian relative bases | README 2851–2856: “an arbitrary commutative ring”; Checks 2948–2957 include “𝔽₂[x₀,x₁,…]” and the zero ring. | Repaired. SL₂ has relative dimension 3 and centre μ₂ of rank 2 over that non-Noetherian ring. |
| R07, missing Lang headline | `Suggested.lean:191–199` states `lang_surjective`; README 1527–1531 names it. Smoothness, geometric connectedness and q-power Frobenius are explicit. | Repaired. θ²+θ+1=0 gives θ²−θ=1; disconnected constant C₂ still has Lang image {1}. |
| R08, padding | The three declarations in current R05 remain. | Not repaired; R05. |

**Scope, gate and build.** The checked head is 72e414118fa7940f8ae0d3b0e1dcdc30ef8f2a65. All ten requested files were read. The diff outside this roadmap folder is empty and the worktree remains clean. The worker's gate reports every listed check passing, including build, stray-files, outside-folder and dependency checks. I reran `lake build TauCetiRoadmap.ReductiveGroups.Suggested` and direct `lake env lean` on Suggested: both exited 0 with only its **11 intentional sorry warnings**. No PR files, manifests, toolchain files or merge-order files were changed.

The dependency command's complete diagnostic output was:

```text
depcheck: 204 roadmaps, 1619 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The scanner's result does not settle semantic ownership: R02 and R03 are reversed supplier assertions, even though the syntactically declared edges pass. No undeclared supplier gap is used as an excuse for either duplication. Internal routes place exponential/logarithm before Bruhat and Levi applications, integral group construction before Steinberg endomorphisms, and distributions before integration before contraction; the inspected routes do not reintroduce the previously repaired layer cycles.

**Elaborated signatures and padding.** All **24 named Suggested declarations**, including all **11 headlines**, were checked using `#check @name` in a scratch copy. The five orbit headlines retain their actual action, affine smooth quasi-compact group, algebraically closed field and separated finite-type quasi-compact target. The unpointed closed-orbit existence theorem retains `Nonempty (Points X)`. Linear reductivity retains characteristic zero; the native Borel predicate supplies algebraic closedness. Lang retains the finite field, smoothness, geometric connectedness, algebraically closed extension, algebra homomorphism F and its value equation F(a)=a^q. SL coordinates allow every n; braid nonsplitting retains 2≤n. No needed binder was lost and no change is required to these signatures.

The 11 Suggested headlines were each probed with `rfl`, `simp` and `infer_instance` alternatives; all still required `sorry`. The nearest native Borel theorem additionally assumes containment, and the native reductivity theorem goes in the opposite direction. Neither is a one-lemma proof of the headline. The successful one-lemma companion probes are R05. A separate scoped, combined scratch copy appended probes for **297 named declarations across all nine files**. Its only error cluster concerns CoverLiftTargets' unavailable lift group/projection and dependent declarations. This is not a failed Suggested build; it prevents certification of those companion signatures. No fictitious replacement carrier was inserted.

**Required source sample.** Two legal texts were fetched through the sources service: the MPI institutional copy of Jantzen's 1985 Part I preprint, and Conrad's author-hosted *Reductive Group Schemes*. No source was copied into the repository and no source manifest was edited. The README contains no explicitly unverified locator requiring an additional sample. The following six entries cover all three seeded targets:

| Target | Exact locator and source extraction inspected | Result |
|---|---|---|
| 1.1, rational action/comodule dictionary | Jantzen, §2.8, printed pp.36–39; `jantzen` lines 1070–1210 | Universal-point/coaction description supports arbitrary modules. |
| 1.1, enough injectives | §3.9, printed p.60; `jantzen` lines 1688–1707 | Flat affine group scheme; embed in cofree on an injective underlying module. No flatness assumption on coefficients. |
| 1.1, rational cohomology and cofree acyclicity | §§4.2,4.7,4.14–4.16, printed pp.69–70,72–73,77–79/79a; `jantzen` lines 1923–1939,1994–2020,2102–2155 | Derived invariants and the cofree complex agree. Printed p.77 was also visually read because OCR loses some tensor equations. |
| 1.1, induction and reciprocity | §§3.3–3.7, printed pp.53–57, continuing p.58; `jantzen` lines 1494–1645 | Subgroup induction, counit evaluation and inverse covariance agree. README explicitly supplies the equalizer proof for the wider arbitrary-Hopf-map form rather than attributing that wider form verbatim to Jantzen. |
| 8.1, split data | Conrad, Definition 5.1.1, printed p.136; `conrad` lines 5651–5669 | Nonempty base, split maximal torus, constant roots **and coroots**, and free rank-one root spaces; no omitted connected-base condition. |
| 8.2, pinnings | Definition 6.1.1 and Remark 6.1.2, printed p.186, within the cited pp.186–187; `conrad` lines 7725–7751 | Constant positive system and simple-root generators. An arbitrary Borel chosen differently on two components need not give this pinning. |

Jantzen pagination here is the explicitly cited 1985 preprint, not the later edition. Conrad Definition 3.1.1, printed p.81 (`conrad` lines 3334–3338), was also reread for the repaired arbitrary-base scope: its base is any scheme. Source correctness does not resolve the duplicate ownership of §1.1.

**Headline inventory.** The end results are: the three-way Hopf/scheme/points and rational-comodule dictionaries; locally closed/reduced orbit models, strict boundary dimension and closed-orbit existence; homogeneous quotient representability and Matsushima affineness; Jordan/torus and unipotent structure; characteristic-zero linear reductivity and Levi complements; Borel conjugacy, root extraction, parabolics and Bruhat coordinates; Lang and Lang–Steinberg; Harish–Chandra adjunction, Mackey, common-Levi independence and its Gassmann consequence; pinnings and Chevalley–Demazure existence/classification; integral full-lattice PBW/distributions; signed ADE, lifts and folding; arbitrary-field pseudo-reductive examples; rational highest weights, Steinberg, contraction and Peter–Weyl; SL coordinates; plane braids, finite Weyl arrangements and spectral/Weyl monodromy.

Suggested contains the five orbit headlines at 106–151, linear reductivity at 166, Borel conjugacy at 178, Lang at 191, SL coordinates at 213, plane braids at 261 and nonsplitting at 267. Its docstring now correctly distinguishes the existing radical from its missing represented quotient. It names missing rational-module, quotient/comparison, pinned-group, integral-realization, fixed-algebra and spectral-action carriers. The Levi-complement and finite Harish–Chandra endpoints should be named explicitly when R01 consolidates the acceptance files. Native PBW, root classification, embedding and Tannakian reconstruction are suppliers, not additional missing acceptance theorems. The plane headline uses the actual quotient of injective configurations; Lang fixes F by its pointwise value, not by assuming the desired surjectivity.

**Adversarial calculations: 163 rows.** Each row gives actual values for the indicated assertion, definition or convention. A passing instance is evidence about that instance, not a proof of the general target. The signed A₂ cocycle bracket was evaluated on all 512 basis triples; every Jacobi vector is the zero 8-tuple. Folded Cartan matrices, finite SL₂ counts and the modular fixed kernel were independently computed. Other entries are direct symbolic calculations. Definitions using admitted data have no implemented values: their rows test the README specification only (R01).

| Statement | Instances tried | Computed values on the two sides / negative control | Result; change |
|---|---|---|---|
| 0: convolution realizes group multiplication | 𝔾_a, parameters 1,2 | Δx=x⊗1+1⊗x evaluates to 3; (1+2)=3; multiplying evaluations would give 2 | Pass |
| 0: sheaf quotient versus point quotient | 𝔾_m/μ₂ over ℚ | Square class 2 has 0 rational square roots, 2 over ℚ(√2); (√2)²=2 | Pass |
| 0: base change and nonreduced test algebras | μ₂ over 𝔽₂[ε]/ε² | (1+ε)²=1; 1+ε≠1, although μ₂(𝔽₂)={1} | Pass |
| 1: rational action/comodule comparison | 𝔾_m weight m=1, trivial weight | ρ(v)=v⊗t gives g·v=gv; ρ(v)=v⊗1 gives g·v=v | Pass |
| 1: Tannakian points transport | Trivial group; 𝔾_m | Tensor automorphism on every weight n is aⁿ; on weight 0 it is 1; trivial group yields only 1 | Pass; native theorem consumed |
| 1.1: invariant equalizer | ℤ[t,t⁻¹], weights 0 and 1 | ker(ρ−id⊗1)=ℤ for weight 0 and 0 for weight 1 | Pass; R02 ownership |
| 1.1: Hochschild differential sign | Weight-one generator | d⁰(1)=t−1; d¹(t−1)=(t⊗t−t⊗1)−(t⊗t−1⊗1)+(t⊗1−1⊗1)=0 | Pass; R02 |
| 1.1: trivial-group derived invariants | H=ℤ, M=ℤ/2 | Differentials alternate 0,id,0,id; H⁰=ℤ/2, H¹=H²=0 | Pass; no coefficient flatness |
| 1.1: cofree acyclic need not injective | Trivial group, cofree ℤ | Positive cohomology=0; extension of 2ℤ→ℤ, 2↦1 would require 2f(1)=1 | Pass |
| 1.1: enough injectives route | M⊂I, flat H | M⊗H→I⊗H has kernel 0; arbitrary noninjective cofree ℤ still fails the preceding extension | Pass; hypotheses distinguished |
| 1.1: coefficient-last comparison | m⊗h₁⊗h₂ | τ gives h₁⊗h₂⊗m with coefficient +1; reversing h₁,h₂ is a different tensor | Pass |
| 1.1: cotensor induction dimension | H=1⊂C₂; C₂⊂S₃, trivial coefficient | Dimensions 2 and 3 equal indices 2 and 3 | Pass; R02 |
| 1.1: induction for a non-surjective Hopf map | ℤ→ℤ[t,t⁻¹], weight 1 | Cotensor with ℤ equals invariants=0; weight 0 gives ℤ | Pass |
| 1.1: reciprocity/evaluation | Identity subgroup inclusion, sign character of C₂ | Evaluation recovers v; generator acts by −v on both modules | Pass |
| 1.1: antipode covariance conversion | G=𝔾_m, character g↦g | F(hg)=hF(g); f(g)=F(g⁻¹)=g⁻¹ gives f(gh)=h⁻¹f(g) | Pass |
| 2: tangent/I-over-I² comparison | 1, 𝔾_a, 𝔾_m, μ_p | Tangent dimensions 0,1,1,1; dim μ_p=0, so smooth dimension equality is unavailable there | Pass |
| 3: kernel differential | Frobenius 𝔾_a, identity | Lie(α_p)=k=ker(0); Lie(1)=0=ker(id) | Pass; repaired native transport |
| 3: homogeneous quotient representability | SL₂/U over a field | Quotient is A²∖{0}, dim 2; affinization is A² and adds one point | Pass; quotient not assumed affine |
| 3A: geometric orbit uses all scheme points | 𝔾_m on A¹, x=1 | Image=D(t), contains its generic point; rational-points-only subset omits that point | Pass |
| 3A: locally closed orbit | 𝔾_m on P¹, x=1 | Orbit=P¹∖{0,∞}, open in closure P¹ | Pass; Suggested headline |
| 3A: reduced orbit model | Trivial action on dual-number point | Reduced model Spec k has length 1; ambient local ring length 2; same singleton image | Pass; Suggested headline |
| 3A: strict boundary dimension | Same P¹ orbit; a closed point | dim boundary=0<1; empty boundary dimension ⊥<0 | Pass; Suggested headline |
| 3A: boundary orbit dimension | 0 in closure of 𝔾_m·1⊂A¹ | dim orbit(0)=0<dim orbit(1)=1 | Pass |
| 3A: closed orbit in closure | 𝔾_m·1 in A¹ | Closure=A¹, closed orbit {0}⊆A¹ | Pass; Suggested headline |
| 3A: nonempty closed-orbit existence | Empty X; singleton X | Empty X has 0 points and fails Nonempty; singleton supplies 1 closed orbit | Pass; Suggested hypothesis excludes false case |
| 3A.5: classical point topology | A¹ℂ, P¹ℂ, dual-number point | ℂ is noncompact; P¹(ℂ) compact; dual-number space singleton with ring dimension 2 | Pass mathematics; R03 |
| 3A.5: Hausdorff comparison | Doubled affine line | Two distinct origins have intersecting every pair of punctured neighborhoods | Pass; separatedness needed |
| 3A.5: smooth orbit manifold/tangent | SL₂ on nonzero vectors | dim G=3, dim stabilizer=1, dim orbit=2=3−1 | Pass |
| 3A.5: properness comparison | P¹→point; A¹→point | P¹(ℂ) compact, ℂ noncompact; only first map proper | Pass; supplier already owns this |
| 4: multiplicative Jordan decomposition | [[2,1],[0,2]] over ℚ | s=2I, u=[[1,1/2],[0,1]], su=original, [s,u]=0 | Pass; 2 invertible |
| 4: Jordan decomposition field restriction | k=𝔽₂(a), matrix [[0,1],[a,0]] | Characteristic polynomial X²−a; required scalar √a is not in k | Pass; geometric decomposition/descent distinguished |
| 4: nonsplit torus Galois lattice | Norm-one torus over ℝ | Complex character lattice ℤ; conjugation n↦−n, invariant rank 0 | Pass |
| 5: Lie–Kolchin hypotheses | S₃ over ℂ; real rotation torus | Standard S₃ representation dim 2 has no invariant line; rotation by 90° has no real eigenline | Pass; connected/closed-field hypotheses necessary |
| 5: unipotent radical maximality | 𝔾_a, SL₂ | Radical dimensions 1 and 0; defining ideals 0 and augmentation | Pass; repaired native supply |
| 6: characteristic-zero linear reductivity | Torus weights; SL₂ in characteristic 2 control | Weight spaces split over char 0; Sym²(k²) in char 2 has dimension 3 and simple socle dimension 2 | Pass; Suggested retains CharZero |
| 6A: cocycle sign/change of section | t=2, v=1, a(t)=(t−1)v | a(2)=1; conjugating standard complement by (−1,1) gives translation coordinate 1 | Pass |
| 6A: complement conjugacy versus uniqueness | L×G_a with trivial action | Every u centralizes L, so all uLu⁻¹=L; conjugating element not unique | Pass |
| 6B: Matsushima invariant convention | GL₂/O₂, g=diag(2,1), right swap matrix | ggᵀ=diag(4,1) unchanged; gᵀg becomes diag(1,4) under right swap | Pass |
| 6B: reductivity of stabilizer matters | SL₂/U | Quotient A²∖{0} is not affine; U unipotent not reductive | Pass |
| 7: Borel conjugacy | SL₂, upper/lower Borels; trivial group | Weyl representative conjugates B⁺ to B⁻; trivial group has exactly one Borel | Pass; Suggested headline |
| 7: standard parabolics | GL₃ | Subsets of 2 simple roots give 4 standard parabolics; Weyl group has 6 elements | Pass |
| 7: full root datum | SL₂ versus PGL₂ | Root has index 2 in SL₂ character lattice, index 1 for PGL₂; same A₁ diagram | Pass |
| 7: Levi decomposition | Upper GL₂ Borel | Dimensions dim T=2, dim U=1, dim B=3=2+1; T∩U={1} | Pass |
| 7: Bruhat dimensions | SL₂/B=P¹ | Cells A⁰ and A¹ have complex dimensions 0 and 1 | Pass |
| 7C: rank-one open chart | SL₂, a=2 | u(2)n₀B⁺ maps to [2:1]; u(2)B⁺=[1:0] is constant | Pass |
| 7a: Lang surjectivity | 𝔾_a over 𝔽₂, θ²+θ+1=0 | θ²−θ=1; over constant C₂, F=id and g⁻¹F(g)=1 only | Pass; connectedness separates cases |
| 7a: rational quotient lifting | Stable μ₂-coset {a,−a}, q odd, a^q=−a | F fixes the coset; neither point is fixed; H¹ obstruction nontrivial | Pass; connected stabilizer hypothesis matters |
| 7c: Harish–Chandra induction | GL₂(𝔽_q), trivial T-module | Induced dimension q+1; U-invariant dimension 2, including q=2:3 and 2 | Pass |
| 7c: biadjunction identity case | P=L=G, U=1 | e_U=1; induction and restriction are identity, both Hom sets equal Hom(V,W) | Pass |
| 7d: Mackey Weyl terms | GL₂ split torus, character θ | Restricted induced module has terms θ and θ^w; dimensions 1+1=2 | Pass |
| 7e: conjugation twist | GL₂(𝔽₃), t=diag(2,1), swap w | wtw⁻¹=diag(1,2); untwisted second columns (2,0)≠(1,0) | Pass; twist retained |
| 7e: same-Levi independence | GL₃ point/plane parabolics | Both indices q²+q+1; at q=2 both 7, though the subgroups are not conjugate | Pass |
| 7f: almost conjugacy transport | Identity equivalence; conjugation | Each class-intersection cardinality is unchanged; S₃ transposition subgroups give (1,1,0) in the three classes | Pass; existing InductionRestriction endpoint |
| 8.1: split root datum | Rank-0/rank-1 torus | X=Y=0 or ℤ; root sets empty in both; pairing rank 0 or 1 | Pass; seeded sample |
| 8.1: central isogeny data not diagram | SL₂/PGL₂ | X/root lattice indices 2/1, same Cartan matrix [2] | Pass; seeded sample |
| 8.1: nonreduced residue fibres | SL₂ over 𝔽₂ | dim G=3; centre length 2, tangent dimension 1 | Pass; smooth centre not required |
| 8.1: empty base convention | Zero ring | Spec 0=∅, geometric fibre set empty; no root datum recoverable from fibres | Pass; nonempty base retained |
| 8.2: pinning generator | SL₂ over ℤ/4 | x(t)=I+tE₁₂; tangent at 0 is E₁₂ with coefficient 1 | Pass; seeded sample |
| 8.2: rescaled pinning is different | Over ℚ, x(2t) | Tangent 2E₁₂≠E₁₂; over ℤ/4 coefficient 2 is not a basis generator | Pass |
| 8.2: empty simple-root set | Torus | Exactly one empty family of root generators | Pass |
| 8.2: disconnected-base positive system | SL₂ over k×k with B⁺,B⁻ | Signs (+,−), not constant (+,+) or (−,−) | Pass; arbitrary Borel not a pinning of constant data |
| 9A: commutator and central sign | Adjacent simple lifts; empty lattice | Commutator=−1=(−1)^−1; empty cover has two elements ±1 and central τ²=1 | Pass |
| 9A: signed root-line quotient | One root, two lifts | Relation e₊+e₋=0 leaves ℤ, with e₋↦−1; mod 2 both signs map to 1 | Pass |
| 9A: Cartan/root bracket | A₂, H₁,x_α₂ | [H₁,x_α₂]=−x_α₂; opposite order gives +x_α₂ | Pass |
| 9A: integral alternation and Jacobi | A₂ basis of rank 8 | 512 basis triples have Jacobi vector (0,0,0,0,0,0,0,0); [x,x]=0 | Pass; integral calculation also reduces mod 2/3 |
| 9A: lift torsor/kernel | A₁ lattice | Hom(ℤ,{±1}) has 2 elements; lattice isometry group has 2; lift group has 4 | Pass |
| 9A: Weyl/based factorization | A₁ −1; A₁² component swap | Pairs (−1,1) and (1,swap); each product recovers original isometry | Pass; owned factorization adapter |
| 9A: signed-cycle invariants | Length-2 cycle with signs +,+ | Fixed vectors (c,c); integral rank 1, equal to orbit-sum span | Pass |
| 9A: invariant formation and base change | Length-one cycle acting by −1 | (fixed over ℤ)⊗𝔽₂=0; fixed after tensor=𝔽₂ | Pass; bad-prime enlargement retained |
| 9A: folded A₂ normalization | e=e₁+e₂,f=f₁+f₂,h=h₁+h₂ | [h,e]=e,[e,f]=h; (2h,e,2f) satisfies sl₂; sublattice index 4 | Pass |
| 9A: folded Cartan orientation | A₃ and A₄ reversals | Matrices [[2,−2],[−1,2]] and [[2,−1],[−2,2]]; they are transposes, not identical conventions | Pass |
| 9A: triality Cartan convention | D₄ order 3 | Matrix [[2,−3],[−1,2]]; product of off-diagonal entries 3 | Pass |
| 9A: exceptional fixed dimensions | D₄ triality, E₆ involution | 2+6+18/3=14; 4+24+48/2=52; identity on D₄ instead gives 28 | Pass |
| 9A: modular toral fixed kernel | γ=[[0,−1],[1,−1]] over ℤ, 𝔽₂, 𝔽₃ | Integral and 𝔽₂ kernels 0; 𝔽₃ kernel {(0,0),(1,2),(2,1)}, dimension 1 | Pass |
| 9A: fixedCartan kernel formula | −id on ℤ and ℤ/2 | Fixed=ker(−2)=0 over ℤ, whole module over ℤ/2 | Pass mathematics; R05 padding |
| 9A: integral PBW divided powers | sl₂ | E·E=2E^(2); coefficient 2 becomes 0 mod 2, not division by 2 | Pass |
| 9A: PBW triangular order | sl₂, one E and F | EF=FE+H; coefficient of H is +1 | Pass |
| 9B: integral Chevalley construction | A₁, simply connected versus adjoint | SL₂ and PGL₂ have dimension 3; centres μ₂ and 1 | Pass; full datum distinguishes them |
| 9B: special isogeny square | B₂ in characteristic 2 | τ*=[[0,2],[1,0]], (τ*)²=2I; geometric composite is Frobenius | Pass |
| 9C: finite-order distribution definition | 𝔾_a, δₙ extracting xⁿ | δₙ annihilates (x)^(n+1); δₙ(xⁿ)=1, so it does not annihilate (x)^n | Pass |
| 9C: distribution multiplication | 𝔾_a | δ₁*δ₁=2δ₂; at p=2 product 0, while δ₂≠0 | Pass |
| 9C: Frobenius-kernel dimension | SL₂ and rank-one torus | Distribution dimensions p³ and p; at p=2 values 8 and 2 | Pass |
| 9D: pinned classification | Root datum A₁ with character indices 2,1 | Recovered groups SL₂,PGL₂; pinning-preserving automorphism with fixed full datum is identity | Pass |
| 9D: relative reductivity | R=𝔽₂[x₀,x₁,…], SL₂,R | Smooth relative dimension 3, centre rank 2; ring fails Noetherian condition | Pass; repaired arbitrary-base scope |
| 9D: pseudo-reductive versus reductive | K/k purely inseparable of degree p | k-unipotent radical dimension 0; after algebraic closure kernel 1+nilradical has dimension p−1 | Pass; repaired native radical contract |
| 9E: Steinberg extension and twists | F^m=Frob_q, trivial group; split SL₂ | Trivial fixed group order 1; split SL₂(q) order q(q²−1), at q=2 gives 6 | Pass; after carrier construction |
| 10A: rational/distribution integrability | G_m weight m | Toral distributions act by binom(m,n), with m integral; arbitrary Lie eigenvalue 1/2 cannot be a character weight | Pass; no arbitrary-Lie-module substitute |
| 10A.1: contraction weights | Weight p and weight 1 | Contracted weights 1 and absent, respectively | Pass |
| 10A.1: contraction not monoidal | p=2, two weight-one modules | Each contraction 0; tensor has weight 2 and contraction dimension 1 | Pass |
| 10B: Δ/∇/L in small characteristic | SL₂, p=2, highest weight 2 | Weyl/induced dimensions 3; simple dimension 2 | Pass |
| 10B: Steinberg algebraic theorem | SL₂, p=2,3; rank 0 | (p−1)ρ has dimensions 2 and 3, equal p^1; rank 0 gives 1=p^0 | Pass |
| 10B: tensor-product digits | SL₂, p=3,n=4 | Digits (1,1), simple dimension (1+1)(1+1)=4; Weyl dimension 5 | Pass |
| 10C: Peter–Weyl left/right conventions | G_m, coefficient t^n | Left/right weights (−n,+n), Δt^n=t^n⊗t^n, S(t^n)=t^−n | Pass |
| 11A: orbit quotient/forget-order | n=2, (0,1),(1,0) | Two ordered points, one unordered orbit; quotient projection continuous | Pass; companion continuity is padding |
| 11A: plane-braid fundamental group | n=0,1,2 | π₁=1,1,ℤ; B₀=B₁=1, B₂=ℤ | Pass; Suggested headline includes degenerate n |
| 11A: permutation-map nonsplitting | B₂=ℤ→S₂ | Map m↦m mod 2; section would require 2m=0 and m odd, impossible | Pass; Suggested n≥2 |
| 11B: finite arrangement topology | A₁; empty roots with central direction | A₁ complement ℂ×, quotient z↦z², π₁=ℤ; empty arrangement ℂ^r gives π₁=1 | Pass |
| 11C: cameral Weyl action | A₁ Weyl lift n with n²=−I | n²≠I in G, but [gn²]=[g] in G/T; quotient action squares to identity | Pass |
| 11C: G/T simply connected | PGL₂(ℂ) | π₁(G)=C₂; G/T has contractible fibre over P¹ and π₁=0 | Pass; no simply-connected-G assumption |
| 11C: monodromy endpoint inversion | A₂ loop lifting to endpoint w=(012) | Recorded group action is w⁻¹=(021), distinct from w | Pass |
| SL coordinate presentation | n=0,1,2 | Relations 0, x−1, ad−bc−1; rings ℤ,ℤ,ℤ[a,b,c,d]/(ad−bc−1) | Pass; Suggested headline, R01 |
| Companion covering evaluation | Identity covering e↦e | Constructed homeomorphism sends e to e; displayed RHS e | Pass; R05 delete padding |
| 0: group law need not commute | Upper/lower SL₂ unipotents with entry 1 | Products [[2,1],[1,1]] and [[1,1],[1,2]] differ | Pass; commutative coordinate ring does not mean commutative point group |
| 0: proper group commutativity hypothesis | Constant S₃ versus trivial group | S₃ products (12)(23)=(123), (23)(12)=(132); trivial commutator=1 | Pass; geometric integrality excludes S₃ |
| 0: covariant points/contravariant coordinates | 𝔾_a doubling, value 3 | Pullback x↦2x gives evaluation 6; forward point map 3↦6 | Pass |
| 1: faithful embedding includes zero rank | Trivial group, zero comodule | GL₀=Spec k, coordinate map k→k=id, closed immersion | Pass |
| 1.1: induction transitivity | 1⊂C₂⊂S₃ | Ranks 2·3=6=[S₃:1] | Pass; R02 supplies generic theorem |
| 1.1: coefficient-map functoriality | Trivial Hopf algebra, m=3, f=2·, g=3· | g(f(3))=18=(g∘f)(3); on m⊗1 same coefficient 18 | Pass |
| 2: dual-number tangent derivation | k[x], point 0, D(x)=1 | f(x) evaluated at ε equals f(0)+f′(0)ε; x² gives 0 and D(x²)=0 | Pass |
| 2: differential scalar extension | 𝔾_a identity over k⊂K | k⊗kK=K, derivative 1 becomes 1 | Pass; general cotangent dual base change retains projectivity |
| 3: kernel need not be smooth | Frobenius 𝔾_m in characteristic p | Kernel μ_p has dimension 0, tangent dimension 1; df=0, kernel tangent dimension 1 | Pass |
| 3A: disconnected smooth acting group | Constant S₃ acting regularly on six points | Orbit cardinality 6, dimension 0, empty boundary dimension ⊥ | Pass; connectedness not needed |
| 3A: smoothness of orbit map is separate | t·x=t^p x on 𝔾_m in characteristic p | Orbit dimension 1, derivative rank 0, stabilizer μ_p tangent dimension 1 | Pass; characteristic-zero analytic route avoids inseparability |
| 3A: minimal dimension is sufficient, not necessary | 𝔾_a: s·(x,y)=(x+sy,y) | y≠0 orbits are closed lines of dimension 1; y=0 orbits closed points of dimension 0 | Pass |
| 3A.5: complex-linear tangent convention | z↦bar z on ℂ | D(i)=−i while iD(1)=i | Pass; real smoothness is insufficient |
| 4: exact diagonalizable dictionary | n=0 | ker(0:ℤ→ℤ)=ℤ≠0; image(t⁰)={1}≠𝔾_m | Fails; R04 adds n≥1 |
| 4: repaired Kummer boundary/control | n=1, n=2, characteristic 2 | n=1 kernels 0/1; n=2 cokernel ℤ/2, group kernel μ₂ of length 2; squaring fppf-surjective | Pass after R04 |
| 4: character/cocharacter pairing | t↦t², t↦t³ | Composite t↦t⁶, pairing 2·3=6; reversing a sign gives −6 | Pass |
| 5: infinitesimal unipotence | α_p and μ_p | α_p has additive coordinate t with t^p=0; μ_p has p group-like basis vectors and is diagonalizable, despite one geometric point each | Pass; point-count definition rejected |
| 5P: exponential denominator | N=E₁₂+E₂₃ over ℚ | N²=E₁₃, exp N=I+N+E₁₃/2; exp0=I | Pass; 2 invertible only in stated characteristic-zero lane |
| 6A: semidirect action term | 𝔾_a⋊𝔾_m, (v,t)=(1,2), (w,s)=(3,4) | Product (7,8); action-free wrong product (4,8) | Pass |
| 6A: two-cocycle section change | Trivial action, additive H, b(g)=g² | db(g,h)=−2gh; at g=h=1 gives −2, matching b(1)+b(1)−b(2) | Pass; s_(−a) has zero cocycle if c=da |
| 6A: degenerate Levi factors | G reductive; G=𝔾_a | First U=1,L=G; second U=G,L=1; multiplication is identity in both cases | Pass |
| 7C: retained/inverted root definitions | A₂, w=s₁ | Retained {α₂,α₁+α₂}; inverted {α₁}; cardinalities 2+1=3 | Pass |
| 7C: complement direction | w=s₁, longest w₀ | Left choice w₀s₁ retains α₂ too; right choice s₁w₀ retains α₁ | Pass; wrong complement has nonempty intersection |
| 7C: noncommutative coordinate law | U₃, (a,b,c)=(2,3,5), (a′,b′,c′)=(7,11,13) | Product (9,14,40), since 5+13+2·11=40; reversed central entry 39 | Pass |
| 7C: complement-first inverse | U₃ point (2,3,5) | Recovered stabilizer coordinate 5−2·3=−1; assembly −1+2·3=5 | Pass |
| 7C: action inverse | Stabilizer right multiplication j⁻¹ | (h₁,j₁)(h₂,j₂) sends u to h₁h₂u j₂⁻¹j₁⁻¹; matches (j₁j₂)⁻¹ | Pass; h u j alone requires opposite group |
| 7C: tangent rank argument | SL₂, w=s | dimH=0, dimJ=1, derivative rank1=dimU; identity w gives dimensions1,0 | Pass |
| 7a: multiplicative Frobenius convention | θ∈𝔽₄, θ²+θ+1=0 | θ⁻¹θ²=θ; inverse convention gives θ²≠θ | Pass; Suggested Lang equation fixes direction |
| 7a: noncommutative Lang calculation | u(θ)∈SL₂(𝔽₄) | u(θ)⁻¹F(u(θ))=u(θ²−θ)=u(1) | Pass |
| 7a: extension field with q=3 | η∈𝔽₉, η²=−1 | η³−η=−2η=η; q=1 impossible for a field | Pass |
| 7c: averaging denominator | U=C₂ over ℂ, over 𝔽₂ control | ((1+u)/2)²=(1+u)/2; in 𝔽₂, (1+u)²=0 and 2 is not a unit | Pass; coefficients retained |
| 7f: common-Levi concrete count | GL₃(𝔽₂), point/plane parabolics | Ambient order 168, each parabolic order24, each index7; degree-zero class count1 | Pass |
| 8.1: roots and coroots must both be constant | A₁ root data on two components | SL₂ data (root2,coroot1), PGL₂ data (root1,coroot2); same Cartan entry2 but different full data | Pass; seeded definition excludes silent mixing |
| 8.2: bad root-line generator | SL₂ over ℤ/4, parameter 2t | Image tangent coefficients {0,2}, not full ℤ/4; coefficient1 has image {0,1,2,3} | Pass |
| 9A: norm shell | A₁, a=0,1,2 | B(a,a)=0,2,8; only ±1 are roots | Pass |
| 9A: root-sum criterion | A₂ simple roots; a and −a | B(a,b)=−1, a+b root; B(a,−a)=−2, sum0 not root | Pass |
| 9A: cocycle associativity | A₂ a=(1,0), b=(0,1), c=(1,0) | ε(a,b)ε(a+b,c)=−1=ε(b,c)ε(a,b+c) | Pass |
| 9A: opposite lift is not arbitrary negative section | a=(1,1) | ε(a,−a)=−1; u_a u_−a=τ, whereas u_a u_a⁻¹=1 | Pass |
| 9A: ordered section homomorphism | A₂ versus A₁ | ε(α₂,α₁)=−1 in A₂; ε(a,b)=1 for all a,b in A₁ | Pass |
| 9A: change of vertex order | A₂, a=α₁,b=α₂ | ε′/ε=−1; σ(a)σ(b)/σ(a+b)=1·1/(−1)=−1 | Pass |
| 9A: integral full-Y distinction | SL₂ and PGL₂ | Simple coroot primitive in first Y; coroot twice a generator in second; index1 versus2 | Pass |
| 9A: negative signed cycle | γ(e₁)=e₂, γ(e₂)=−e₁ | Equations y=x, x=−y give 2x=0; ℤ solutions0, 𝔽₂ solutions(0,0),(1,1) | Pass |
| 9A: projection versus distinct/full sum | D₄ outer-root orbit of length3, period6 | Distinct sum S; projection S/3; six-term sum2S | Pass; integer lattice is not identified with projection lattice |
| 9A: PBW toral binomial | Weight3, degree2 | binom(3,2)=3; after reduction mod3 value0, mod2 value1 | Pass; integral coefficient precedes reduction |
| 9B: elementary chart over a local ring | SL₂(ℤ/4) | 48 determinant-one matrices; primitive first column always has a unit entry | Pass |
| 9B: chart cover not pointwise unit over every ring | [[2,1],[3,2]]∈SL₂(ℤ) | det=1, ideal(2,3)=ℤ, neither2 nor3 is a unit | Pass; principal opens cover |
| 9B: central quotient on field points | SL₂→PGL₂ over ℚ | Kernel ±I; class diag(2,1) would require λ²·2=1, no λ∈ℚ | Pass; fppf surjectivity does not force point surjectivity |
| 9D: relative zero-ring case | R=0 | SpecR empty, geometric fibres0; relative fibre condition vacuous, unlike nonempty split-datum extraction | Pass; scopes separated |
| 9E: special isogeny not invertible | B₂ characteristic2 matrix [[0,2],[1,0]] | Determinant−2; square2I, not I; modulo2 determinant0 | Pass |
| 10A: torus characters constrain integration | Lie eigenvalues1 and1/2 | Eigenvalue1 comes from character t; no t^(1/2) regular character of 𝔾_m | Pass |
| 10B: simply connected Steinberg weight | PGL₂, p=2 | X=root lattice=2ℤe, ρ=e∉X; on SL₂, ρ=e∈X | Pass; cover hypothesis matters |
| 10D: rank-one right-U quotient | SL₂ matrix [[a,b],[c,d]] | Right u(t) leaves (a,c) fixed, sends (b,d) to (b+at,d+ct); det unchanged | Pass |
| 10D: local-section transition sign | a=c=1 | s_a=[[1,0],[1,1]], s_c=[[1,−1],[1,0]]=s_a u(−1); −1/(ac)=−1 | Pass |
| 10D: constant coefficient and counit | 𝔾_m coefficient t⁰ | Δ1=1⊗1, ε1=1, S1=1 | Pass |
| 11A: left action convention | σ=(012), z=(0,1,2) | σ·z=(2,0,1); forward-index choice gives(1,2,0) | Pass |
| 11A: configurations exclude collision | n=2, z=(0,0) | Injectivity false since z0=z1 and0≠1; n=0 has one empty configuration | Pass |
| 11A: centering | n=2,z=(1,3); n=0 | Centroid2, centered(−1,1), inverse(1,3); 1/0=0 cannot give ℂ×singleton≃singleton | Pass; centerHomeomorph requires n>0 |
| 11B: rank-one reflection covering | z↦z² on ℂ×, loop once | Lift endpoint−1; twice gives1; Weyl group C₂ and Artin groupℤ | Pass |
| 11C: regular semisimple restriction | GL₂ regular nilpotent versus scalar | Nilpotent centralizer ℂ××ℂ dimension2 but not torus; scalar centralizer dimension4 | Pass; regular alone is insufficient |
| 11C: spectral projectors | A=diag(1,3) | P₁=(A−3I)/(−2)=diag(1,0), P₂=(A−I)/2=diag(0,1); P₁+P₂=I, P₁P₂=0 | Pass; denominators nonzero |
| 11C: repeated eigenvalue control | A=I₂ | λ₁−λ₂=0; characteristic polynomial (T−1)² not separable | Pass; excluded by actual separability subtype |


**Pinned-library audit.** The checked checkouts match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 21 entries record declarations whose definitions/signatures were opened, not merely name-search hits. Paths beginning `Mathlib/` or `TauCeti/` are relative to their respective repositories.

| Pinned file and line | Declaration(s) and scope checked |
|---|---|
| `Mathlib/AlgebraicGeometry/Group/Affine.lean:187,482` | `hopfSpec.fullyFaithful`, `essImage_hopfSpec`: essential image is affine group schemes. No finite-type or smoothness assertion is built into affineness. |
| `Mathlib/AlgebraicGeometry/Group/Smooth.lean:29,63` | `smooth_of_grpObj`: field, locally finite type, group object, geometrically reduced. This is not smoothness of every finite-type group scheme. |
| `Mathlib/AlgebraicGeometry/Group/Abelian.lean:132` | `isCommMonObj_of_isProper_of_geometricallyIntegral`: both properness and geometric integrality; constant S₃ is not a counterexample under those hypotheses. |
| `Mathlib/LinearAlgebra/FixedSubmodule.lean:42` | `LinearMap.fixedSubmodule_eq_ker`: native equation for every module endomorphism over a ring; no ADE assumption. |
| `Mathlib/Topology/Constructions.lean:742` | `continuous_quotient_mk'`: quotient topology supplies continuity; no free-action or covering hypothesis. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:118,213` | `exists_coordinateBialgHom_surjective`, `exists_isClosedImmersion_generalLinear`: finite-type regular-comodule generation/affine group embedding. Kept as suppliers. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138` | `pointsFunctorIsoTensorAutFunctor`: includes the explicit `GrpCat.uliftFunctor`; not an unlifted equality of carriers. |
| `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean:261,360` | `Derivation.cotangentLinearEquiv`; `tangentScalarExtensionEquiv` explicitly requires finite projective cotangent module. |
| `TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean:148` | `IsBorelOverAlgClosed` is `IsAlgClosed k ∧ Minimal (IsBorelCandidate k H) I`. Hopf-ideal minimality reverses subgroup maximality. |
| `TauCeti/Algebra/AlgebraicGroup/Borel/Conjugation.lean:161` | Native `exists_conjugate_eq_of_isBorelOverAlgClosed` requires `hcontain`; it does not prove the unconditional Suggested headline. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,78` | `reductiveCommHopfAlgProperty` and its iff include smoothness, geometric connectedness and triviality of specified normal subgroups after algebraic closure. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/LinearlyReductive.lean:337` | `of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive` proves the converse direction to Suggested's characteristic-zero target. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38,82` | Relative predicate and `baseChange`, over arbitrary commutative rings (repaired relative scope). |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean:138,154` | `schemeEquivalence`, `schemeEquivalence.functorCompιIso`; finitely generated commutative groups, including torsion. |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/ClosedSubgroup.lean:56,67` | `groupLikeSpannedProperty.of_surjective`, `.quotient`; coordinate quotients mean closed subgroups, not quotient groups. |
| `TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean:72,79,91,102,132` | Native radical construction, candidate, maximality, uniqueness and coordinate carrier (repaired radical contract). |
| `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Tangent.lean:132,175` | `lieSubalgebra_kernelHopfIdeal`, `kernelLieEquiv`, on counit derivations (repaired kernel contract). |
| `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:154`; `TauCeti/Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean:61` in the same algebraic-group directory | `TauCeti.AlgHom.mapValue` is postcomposition; geometric connectedness quantifies over field extensions. These suffice for the compiled Lang signature (Lang headline). |
| `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:380,445,574` | `pointsMulEquiv`, `pointsMulEquiv_mapValue`, `pointsNatIso`: actual determinant-one matrices and naturality, not yet the chosen polynomial presentation. |
| `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:216`; `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Basic.lean:92` in the same directory | `fppfHomogeneousQuotient` is sheafification; `coinvariants` is the equalizer `(id⊗π)Δ(h)=h⊗1`. Neither definition asserts quotient representability. |
| `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:153,166`; `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:304` | Native `isometryGroup`/membership needs no positive-definiteness; `BraidGroup.permHom` is the generator-to-transposition homomorphism. |

CoverLiftTargets also reconstructs the native isometry subgroup; R01 removes that duplication.

**Supplier and ownership audit.** Object searches used the roadmap index (`roadmaps grep`/`show`), the main checkout, readable board packages and the supplied open heads. The two duplicated suppliers are new-roadmap owners absent from main, so their indexed heads were inspected; revisions of existing roadmaps were not substituted for main. The main ReductiveGroups also records both imports. The resolver's **22 name leads** consist of 21 local Suggested names and the InductionRestriction declaration resolved below, not 22 missing dependencies. The following 16 rows record the resolved interfaces. A consumer's broader theorem was not used as a premise here.

| Owner and repository-relative locator | Interface and boundary resolved |
|---|---|
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:551,755,798` | §§0.3,0.7,0.8: relative Proj, local dimension and étale coordinates. The orbit proof uses dimension over a field, not an arbitrary non-Noetherian dimension assertion. |
| Same file `:2071,2167,2418,2458,2502` | §§1.1,1.5,1.13–1.15: descent, quotient sheaves, group spaces, stabilizers, torsors. Torsor interfaces retain the stated flatness/local finite-presentation hypotheses; no universal quotient representability is inferred. |
| Same file `:3437,5613` | §§2.6,4.12: projective-space cohomology and Chow lemma; the complex finite-type use has a Noetherian base. |
| `TauCetiRoadmap/ModularCurves/README.md:386,412` | §§0E–0F: effective affine descent and finite-locally-free affine Weil restriction. The source is affine finitely presented, as required in 9D. |
| `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319` | Layer 4 is chamber/simple-transitivity theory; there is no 4A. Layers 1–2 and 5–6 supply finite root/Coxeter and classification/numbering inputs, not the automorphism adapter newly owned here. |
| `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405,537,931` | Layers 3–4 and 7: PBW/highest weights and Serre/Harish–Chandra comparisons. Group integral forms and rational positive-characteristic representations are different remaining objects. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275,407,428` | Layers 2,7,8: finite-dimensional closed subgroups, reductive compact-form comparison, complex flag cells. No infinite-dimensional or positive-characteristic theorem imported. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md:221,315,421` | B1.0/B1.1/B1.4: regular fibres, principal structures, homogeneous quotients. Regular-fibre statements allow non-Hausdorff ambient manifolds; proper quotient assertions retain properness. |
| `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:346–385` | Layer 2.1 explicitly owns `Gassmann.almostConjugate_iff_permutation_equiv`, using fixed-coset counts and native representation equivalences. |
| `TauCetiRoadmap/GroebnerGeometry/README.md:394` | G5 owns polynomial minors, signs, straightening and initial algebra. ReductiveGroups retains group/function comparisons, not a second generic straightening theorem. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:306`; `TauCetiRoadmap/SchubertGeometry/README.md:17–23` | Graded module-scheme/relative linear objects and existing flag/coherent ownership. SchubertGeometry explicitly consumes ReductiveGroups' algebraic Steinberg theorem; its later geometry is not a premise of that theorem here. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:289`; `TauCetiRoadmap/DGFloer/README.md:461–490` | Van Kampen/CW interfaces and Layer 1 item 2's based fibration exact sequence, including components. No claim that connectedness of G alone proves π₁(G/T)=0. |
| `TauCetiRoadmap/ReflectionInvariantTheory/README.md:129–150`; `TauCetiRoadmap/IntegralLattices/README.md:590` | Reflection invariant-degree/coinvariant theory and integral-lattice carrier dictionary. Reflection coinvariants are not Hopf-ideal right invariants. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1145–1174,1209–1224` | Open new-roadmap owner of arbitrary-base rational cohomology/cotensor induction; actual overlap R02. |
| `TauCetiRoadmap/ComplexComparisonPartII/README.md:774–803` | Open new-roadmap owner of the classical complex-point topology and smooth charts; actual overlap R03. |
| `TauCetiRoadmap/RootSystemsPartII/README.md:9,19,57–61` at the supplied open head | Explicitly imports ADE signed fixed-algebra/projection comparisons from ReductiveGroups and extends root combinatorics. Its root-row convention is the transpose of this roadmap's H-row convention; A₃ outer-first entries −2,−1 agree after the indicated transport. No second owner for the signed Lie algebra was inferred. |

RootSystemsPartII's supplied open README and its readable board package agree that ReductiveGroups owns the signed ADE fixed-Lie constructions; its unsigned root-sum extension is a different object. The available cameral/spectral searches also distinguish the Lie regular-semisimple cover here from spectral curves and Hitchin Picard-stack constructions. No kept Suggested fully qualified name was found in another roadmap. This is an audit of the provided/indexed readable context, not a claim about inaccessible private work.

**Shape and principles.** RootSystems, ReflectionInvariantTheory and Completed/EffectiveBounds were consulted as main-branch shape examples. The seeded definitions have APIs and at least three discriminating Checks. All `*Needs:*` lines and the explicit supplier contracts were read against the layer order. The arbitrary-field and bad-characteristic lanes remain; characteristic-zero exponential and analytic comparisons are expressly separate applications. No good-prime-only replacement, computational algorithm replacing a theory, copied source passage, `set_option` in the nine reviewed files, or outside-folder edit was found. This is repairable within the existing roadmap: the two duplicated foundational blocks can be restored to their existing suppliers rather than rejecting the whole scope. Companion form and padding remain R01/R05 even though the worker's Suggested-focused scanners pass.

## Not verifiable

- Complete CoverLiftTargets signature elaboration is not certifiable: its imports do not provide `CoverLifts.LiftGroup` or `CoverLifts.projection`. The scoped combined source probe confirms the problem after removing missing-roadmap-object-file obstacles. R01's deletion is the proposed repair; no claim is made that Suggested's gate failed.
- An admitted basis, equivalence or homeomorphism has no implemented value to inspect. Companion rows evaluate the README specification, not `sorry` data. They cannot certify the implemented behavior absent a real construction.
- No required sampled source was inaccessible. The source-certified scope of this round is the Jantzen/Conrad sample and Conrad's relative-base definition. Other bibliography entries and previously checked locator repairs were read as roadmap statements but not independently source-certified this round. No new missing-reference request was necessary and no manifest was edited.

## Source issues

- none
