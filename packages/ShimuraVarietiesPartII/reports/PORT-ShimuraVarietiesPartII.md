# PORT-ShimuraVarietiesPartII

- Branch: `roadmap/shimura-varieties-part-ii`, created from `4dc1e15`.
- Head commit: `53e61e396b4f889c5d501cfb63e8cef4fb2c19c8`, message `ShimuraVarietiesPartII: roadmap (README, Suggested.lean, metadata)`. It touches only `TauCetiRoadmap/ShimuraVarietiesPartII/{README.md,Suggested.lean,metadata.toml}`.
- Build (`lake build TauCetiRoadmap.ShimuraVarietiesPartII.Suggested`): `Build completed successfully (18239 jobs).` There are **0 warnings**: the file declares nothing, so there is no `sorry`. The package's plain `import Mathlib` header drew Lake's "designed for use with the module system" warning. The file now opens with `module` / `public import Mathlib`, as 105 of the 252 `Suggested.lean` files on main do. The gate accepts this (`imports=0`) and the warning is gone.
- Gate: `gate ShimuraVarietiesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (prescribed command, `--movable`), run on the final README:

```text
depcheck: 261 roadmaps, 2598 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. An earlier run in this job, before the index refresh, printed `264 roadmaps, 2603 edges, 0 problem(s)`.
- `roadmaps resolve` on the final README: no cross-roadmap citation and no Lean name is found nowhere. That check ran against the refreshed index (main `b8e8cd0`, 458 open heads, 2026-11-16T15:26:08Z). This worktree's `origin/main` is `4dc1e15`. I diffed the nine suppliers on main and the nineteen open-PR suppliers between the copy I checked and the refreshed index: all 28 are byte-identical.

## Draft pull request body

<!-- roadmap-summary -->
**What this roadmap builds.** It takes the canonical generic tower of ShimuraVarieties to integral models and their special fibres, at every prime p>2. For Hodge-type data with parahoric level it builds normalized integral models and their stacks at arbitrary prime-to-p level. It puts canonical étale, de Rham and crystalline tensors on them, constructs their local-model diagrams and characterizes them as canonical integral models in the sense of Pappas–Rapoport. It then builds very-good auxiliary Hodge covers and descends to integral models of every abelian-type Shimura variety at every connected parahoric level, ramified primes included (Kisin–Pappas–Zhou). On the special fibre it constructs Newton strata, the μ-ordinary locus and the tensor-preserving quasi-isogeny group of a point. It proves density of the ordinary locus, the Tate comparison for that group, integral functoriality, ordinary special lifts with the full isogeny action, Kottwitz–Rapoport strata and curves through every point over the original residue field. The end theorem is Kisin–Zhou's independence of ℓ (Theorem 5.1.4): for a strongly acceptable triple and a point of the special fibre over F_q, the geometric q-Frobenius classes of the ℓ-adic local systems, ℓ≠p, all come from one rational point of the conjugacy quotient Conj(G).

**Why Tau Ceti wants it.** ShimuraVarieties stops at canonical models over the reflex field. Reduction mod p of Shimura varieties beyond the PEL case needs the integral models, their local structure and their Newton and Kottwitz–Rapoport stratifications. That includes Honda–Tate-type statements, special lifts, compatible systems attached to Shimura varieties, and the abelian-variety form of independence of ℓ that ReductiveGroupsPartIII states with the geometric theorem as an explicit hypothesis. This roadmap supplies them for Hodge and abelian type.

**Approach and generality.** Full fixers stay distinct from connected parahorics throughout. Level is arbitrary prime to p, through quotient stacks. Canonical integral models are characterized by shtukas (Pappas–Rapoport; Daniels–van Hoften–Kim–Zhang), so no very-good hypothesis is imposed on the given Hodge datum. Very-goodness is used where the source needs it: the display-based local-model diagram and the auxiliary covers. The finite-period crystalline norm, its framing degree and the dual-representation convention are pinned by computed Checks. The p-adic and group-theoretic inputs that earlier roadmaps do not yet state are recorded as exact supplier contracts with locators.
<!-- /roadmap-summary -->

This pull request adds **Shimura varieties, part II — integral models and common Frobenius classes**. It continues ShimuraVarieties from the generic canonical tower to integral models and their special fibres, and ends with Kisin–Zhou's common rational Frobenius class in Conj(G).

Layer 0 builds the normalized Hodge-type models, inside the single-lattice Siegel models of PELModuli or the lattice-chain Siegel moduli. A Zarhin comparison shows they are quasi-projective schemes. Layer 0 also gives their quotient stacks at arbitrary prime-to-p level, the prime-to-p tower, and the canonical étale and crystalline tensors with the universal crystalline tensor functor. Layer 1 proves the local structure: pointwise integral tensor frames, adapted deformation branches, the extension of the de Rham tensors and the local-model diagram, the same-field henselian comparison, and the extension property over discrete valuation rings at pro-level and at neat finite level. It also proves canonical integral models with their uniqueness, functoriality and Hodge-type existence, and the strict comparison at lattice-chain level. Layer 2 constructs the auxiliary very-good Hodge covers, non-exceptional, exceptional and strongly acceptable. Layer 3 builds the integral component-action groups, conjugate-level gluing, freeness of the descent kernel, integral models of abelian type and the connected adjoint local-model diagrams. Layer 4 gives Newton classes, admissibility, Newton strata with closure containment and nonemptiness, the μ-ordinary locus and its density, the tensor quasi-isogeny group with its realizations and Rosati compactness, and the Tate comparison. Layer 5 gives integral functoriality, the matched-multiplier datum, Newton strata and isogeny groups for a chosen Hodge embedding of a strongly acceptable model, ordinary special lifts and the rational ordinary Frobenius. Layer 6 builds Kottwitz–Rapoport strata and curves over the original residue field. Layer 7 builds the group-valued tower local systems, Frobenius points in Conj(G), unit eigenvalues, representation-wise independence and the rational common class.

The roadmap states 22 supplier extensions as exact contracts with locators, across 11 earlier roadmaps. `Suggested.lean` states no theorem. None of the seven headline theorems is statable at the pins without a stand-in for a missing carrier: integral Shimura models, parahoric group schemes, Newton and Kottwitz–Rapoport strata, tower local systems, and the conjugacy quotient. Its docstring names the missing carrier for each.

## Dependencies that are still pull requests

ShimuraVarieties, ShimuraData, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusion, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, DiamondsAndVStacksPartII, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory, MotivesAndAlgebraicCycles, AutomorphicBundles, GlobalShtukasAndFunctionFieldLanglands, NeronModelsAndSemistableAbelianVarieties, ShimuraCompactifications, IgusaVarietiesAndTorsionConcentration.

All of these are new-roadmap pull requests, and all are earlier in the merge order. No id this README cites comes from an open revision.

The suppliers on main are AdelicAlgebraicGroups, AbelianSchemesAndArithmeticModuli, ReductiveGroupsPartII, EtaleCohomologyFoundations, CrystallineCohomology, SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, LefschetzPencilsAndVanishingCyclesPartII and ArithmeticGaloisRepresentations.

PELModuli §M2.16 is named only in Scope, as a kept variant; it is not consumed.

## What moved from the Lean to the README

Nothing. The package file already met the acceptance-test form: no declaration, and a docstring naming each non-statable headline and its missing carrier. Two changes were made:

- The import header became `module` / `public import Mathlib`.
- The docstring's claim about Tau Ceti was corrected (see below): the pin *has* Hilbert–Nagata finite generation and linear reductivity in characteristic zero.

No headline became statable. The common Frobenius class still needs integral Shimura models and tower local systems. Conj(G) itself is also not available at the pin: conjugation is not registered as a comodule algebra, and the classification of geometric points by semisimple classes is absent.

**Signature check.** There are 0 declarations, so the `#check @name` comparison has no inputs; nothing changed. `signatures.md` and `library-matches.md` are empty for the same reason.

## Supplier replacements, citation repairs and duplication

I re-checked every supplier citation against the 28 supplier READMEs at their current heads. Three locator agents found the headings; I re-read every line they cited. The descriptions that did not match the supplier text are now repaired:

- **Tau Ceti.** The package said the pin has no finite generation of the class functions. That is wrong. `TauCeti.ComoduleAlgebra.finiteType_coinvariants` (TauCeti/Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean:148) is Hilbert–Nagata finite generation for comodule algebras. `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` (TauCeti/Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:96) makes reductive groups linearly reductive in characteristic 0. What is actually missing is narrower: registering conjugation as a comodule algebra, naming the class-function subalgebra, and the semisimple-class classification. The contract, the Scope sentence and the `Suggested.lean` docstring now say exactly that. ArithmeticGaloisRepresentations §1.11 remains the supplier of Conj(G).
- **ShimuraVarieties.**
  - Hodge type and abelian type, with the Hodge-type witness, are §P.1's. The package wrongly attributed them to ShimuraData Layer 4. §P.1 is now cited in Scope, in the contract, in the §0.1 and §2.1 *Needs:* lines and in the Layer 0 and Layer 2 Dependencies.
  - The right-translation laws are §8.2, not §8.1: `T_g: M_K→M_L` is defined when `g⁻¹Kg⊂L`, with `T_h∘T_g=T_(gh)`. §8.2 is now cited in Scope, the contract, §0.2, §0.3 and Layer 0.
  - The §4.5 description "reciprocity at the reflex place" was replaced by "the Galois action given by reciprocity", which is what §4.5 says.
- **ShimuraData.** Layer 4's actual content is now listed. §4.2 shows that Hodge-type data satisfy SV2* and hence SV5. §§4.3–4.4 give the axioms and the discreteness criterion, and §4.6 lifts connected data. The freeness arguments of §0.3 and §7.1 ("Z_G(Q) is discrete in Z_G(A_f)") now cite ShimuraData §4.2, and Layer 4 is added to their *Needs:* lines. gap:hodge-cover-refinement now asks to refine "the Hodge-type witness (ShimuraVarieties §P.1)"; the package said "the connected Hodge lift", which ShimuraData does not define. §2.1, a definition, no longer lists that gap among its needs.
- **PELModuli §M6.4.** The unsupported gloss "finite flat polarization kernels" became "of finite type over Z including the characteristics dividing the degree".
- **GeometricSatakeAndFusion Layer GS0.** "Frobenius descent of Schubert indices" is not in the supplier. It now reads: Witt affine flags and components, Schubert cells with Bruhat closure, admissible loci, and Galois descent of Galois-stable unions of Schubert strata.
- **GeometricSatakeAndFusionPartII §7.7.** "On a direct sum of copies" is not in the supplier text. The `(V⊗K)^r` form is now attributed to the proof of KZ Proposition 3.1.12 (KZ line 931–935), which §7.7 refers to through "the representation replaced as in KZ Proposition 3.1.9" (KZ line 875–908).
- **ReductiveGroupsPartII §RG2.0.** "Closures" is not in RG2.0. It now reads: the point topology, the topological group of points over a local field, integral points and congruence subgroups, with closures taken in those topologies.
- **ReductiveGroupsPartIII §2.5.** "Not in general G(Q)-conjugate to T" is this roadmap's own remark, not the supplier's. It is now attributed to the Remark of §4.5, which carries the SL₂ witness.
- **PadicDifferentialEquationsAndRigidCohomology §RD.3.43.** The supplier's hypothesis is "of finite type over a perfect field", not "noetherian bases".
- **PadicHodgeTheory §5.5.** "Integral Kottwitz invariant equals the Hodge invariant" is not the supplier's statement. The description now gives what §5.5 states:
  - the tensor-isomorphism torsor and its Galois class;
  - `H¹(F,G)≅(π₁(G)_(Γ_F))_tors` for finite F/Q_p, nonzero for PGL₂ and norm-one tori;
  - the period-torsor class `κ(b)−μ^♮` of `Isom^⊗(ω_std,ω_(b,μ))`.
- **MotivesAndAlgebraicCycles Layer 6.** "Tensor-frame reconstruction" and "restriction from a tensor stabilizer" are not in the supplier. The description now gives what it states: Tannakian reconstruction (§§6.1–6.2), the Isom^⊗ torsor (§6.8) and §6.3's closed-immersion and finite-type criteria. One sentence explains how §6.3 makes the Tannakian group of ⟨D⟩ a closed subgroup of G (used in §0.6).
- **No restatement removed.** No declaration or target here duplicates a supplier, so no target was deleted.

**Duplication sweep, by object** (`roadmaps grep` over main and the 458 open heads, plus the 258 checkouts):

- *Integral models of Hodge or abelian type* and *canonical integral models*: no other owner. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §5.15 compares the tensors of a *given* model and leaves the model's existence and the global extension of its tensors downstream. Scope now says this roadmap supplies both (Layer 0, §1.4).
- *Kottwitz–Rapoport strata*: only GeometricSatakeAndFusionPartII, which owns local models and is cited.
- *Density of the μ-ordinary locus*: PELModuli §M2.16 states Wedhorn's density on PEL moduli with good reduction. It is kept as a variant, with one Scope clause saying how §4.7 differs.
- *Newton strata*: the PEL strata of IgusaVarietiesAndTorsionConcentration were already a kept variant.
- *Quasi-isogeny groups*: EndoscopicTransferAndUnitaryTraceComparison §7.6 is the local `J_b(Q_p)` for PEL BT groups, and PELModuliPartII has framing groups for uniformization. Neither is the global tensor group `I_x`, and uniformization is out of scope here.
- *Conj(G) and Conj′*: ReductiveGroupsPartIII and ArithmeticGaloisRepresentations, both cited.

Nothing was removed.

## Fixes from the upstream-reviewer read

1. **Title.** "shimura" is now "Shimura"; on main, proper nouns keep their capitals in the lower-case title.
2. **De Rham tensors over S (§1.4).** The local-model diagram used integral de Rham tensor frames, but no target extended the de Rham tensors over S, and FFG PartII §5.15 leaves that extension downstream. §1.4 now states it: S is normal, and the tensors are integral at every O_K-point by §1.1. The locator is KP Proposition 4.2.6 and its proof, journal p.186 (KP line 2668–2680). The frame torsor is now written with the linear dual `Hom(Λ,O_S)`, because `Λ^∨` means the symplectic dual elsewhere in the README. The *Needs:* line gains §0.4 and ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension).
3. **Scheme versus algebraic space (§0.1).** When p divides the polarization degree, PELModuli §§M6.2–M6.4 supply the single-lattice Siegel model only as a Deligne–Mumford stack with algebraic-space neat levels. §0.2 and §1.7 nevertheless use S as a scheme. The Zarhin finiteness argument used to sit inside the proof of the Hodge-type theorem of §1.7, which made this a forward reference. It is now a "Zarhin comparison" in §0.1: the map is finite to the principally polarized Siegel model of Zarhin's lattice, which is quasi-projective by ShimuraCompactifications §7.18. So S is a quasi-projective scheme. §1.7 now cites §0.1 for this step, and the *Needs:* lines of §0.1, §1.7 and Layer 0 were updated.
4. **Hecke direction in axiom (b) of §1.7.** The package copied PaRa24's `gK′g⁻¹⊂K` (PaRa24 line 3283–3285) without saying which map `[g]` is. The axiom now uses ShimuraVarieties §8.2's right translation `T_g`, `[x,a]↦[x,ag]`, defined when `g⁻¹K′g⊂K`, and records that PaRa24's form is the same axiom with g replaced by g⁻¹. Witness: for `K=GL₂(Z_ℓ)`, `g=diag(ℓ,1)` and `K′=K∩gKg⁻¹`, we get `g⁻¹K′g⊂K`, so `T_g` is defined.
5. **Two missing commas** from my own Scope and contract edits were fixed before the commit.

I also re-read the headlines against their sources:

| Headline | Source lines |
|---|---|
| §2.1, strongly acceptable | KZ line 1481–1490 |
| §7.6 | KZ line 2104–2106 |
| §7.1, product level | KZ line 2063–2079 |
| §5.4, normality and density | KZ line 1887–1896 |
| §5.9 | KZ line 1900–1903 |
| §5.10 | KZ line 2038–2042 |
| §5.6 | KZ line 1973–1976 |
| §1.6, finite level | HT line 764–773 |
| §4.13 | HT line 1095–1105, with Noot via HT line 1102 |

The README's hypotheses match the sources. Its generalizations are argued in the README with Checks: arbitrary K^p in §7.1 (KZ assumes a product level), and the framing degree in §4.9.

## Ownership against open pull requests

Checked: the 258 checkouts listed in `scratch/open-pull-requests.md`, plus `roadmaps show` and `roadmaps grep` over all 458 open heads. Suggested.lean declares no name, so no fully qualified name can collide.

## Adversarial mathematics pass

Every value below was recomputed in this job, by hand or with a scratch Python script (point counts, matrix conjugations, residue symbols, Teichmüller exponents, Frobenius traces).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: Hodge types, μ_h, slopes | elliptic H¹, H₁; GL₂ tower | μ_h(z) on H^(1,0),H^(0,1): z⁻¹,1; on H₁: z,1; det exponent of μ_h⁻¹ −1; D slopes ord (0,1), ss (½,½); tower (0,−1),(−½,−½); κ=−1 both | consistent | none |
| Conventions: multipliers, H₁ vs H¹ | y²=x³+x/F₅ | affine counts 1,0,1,1,0, #E=4, a=2; H¹ T²−2T+5 (roots 1±2i); H₁ T²−(2/5)T+1/5; multipliers 5, 1/5; roots·5 → 1∓2i | consistent | none |
| Conventions: group norm vs power, dual frame | ζ of order 24 in W(F₂₅), σζ=ζ⁵ | N₂(δ)=ζ⁶ vs δ²=ζ²; F_D²=ζ⁻⁶=ζ¹⁸; ratio ζ¹²=−1; over F₂₅: H¹ T²+6T+25 (−6=4−10), tower T²+(6/25)T+1/25 | norm ≠ power, ≠ crystalline matrix | none |
| Conventions: framing degree | same E, frames over Q₂₅ vs Q₅ | m₀=2: trace (2/5)²−2/5=−6/25, det 1/25; dual −6, 25; m₀=1: (2/5,1/5) | wrong degree changes the class | none |
| Conventions: rational points of Conj | SL₂(R), rotations ±π/2 | traces 0,0; conjugators diag(1,−1)·(a+bJ), det −(a²+b²)<0 | geometric ≠ rational conjugacy | none |
| Conventions: neatness | −1 at 7 in K(3) (p∉{3,7}); scalar −1; N=3,4,6,12 | order 2; eigenvalue group at 3 trivial ⇒ neat; scalar: {±1} at every ℓ ⇒ not neat; prime powers 3,4,3,3 or 4 ≥3; v(ζ_ℓ−1)=1/(ℓ−1)<k | statements hold; N≥3 always has ℓ^k≥3 | none |
| Conventions: quasi-tame | Res_(Q₉/Q₃)G_m; norm-one of Q₃(√3); of Q₃(∛3) | split/tame; tame; Galois image S₃ (order 6), wild; quasi-tame rank-2 images divide 8 | third not quasi-tame | none |
| Tau Ceti conjugation orientation | g=diag(2,1), x=[[1,1],[0,1]] | gxg⁻¹=[[1,2],[0,1]], g⁻¹xg=[[1,1/2],[0,1]] | left conjugation pinned | none |
| §0.1 Definition | GL₂ hyperspecial; GSp₄ Iwahori p=3; e₁ under [[1,ε],[0,1]]; Zarhin on E | normalization = id; y²=x³−x/F₃ counts 1,1,1, #E=4, a=0, ker F=α₃², order-3 subgroups P¹ ⇒ fibre dim ≥1 vs finite; [[1,−ε],[0,0]]; E⁸ dim 8 vs 2 | chain ≠ normalization | Zarhin comparison moved into §0.1; scheme property |
| §0.1 Zarhin comparison | GL₂×_(G_m)GL₂, ψ₁⊕p²ψ₂ | Λ^∨/Λ≅(Z/p²)²; M=⟨e₁,f₁,e₂/p,f₂/p⟩ unimodular; stabilizer det on V = c², so c a unit | proper and quasi-finite argument independent of §1.7 | moved from §1.7 |
| §0.2 stacks | K₁=K; GU(1,1) of Q(i), p=5 | trivial quotient = S_K; scalar i: i·ī=1, order 4, i^k∉K₁ (k=1,2,3) | inertia Z/4 | none |
| §0.3 tower, free action | neat K, Hodge type (SV5); Y(9)→Y(3) | Z_G(Q)∩K finite and torsion-free ⇒ 1; \|ker GL₂(Z/9)→GL₂(Z/3)\|=81=27·φ(9)/φ(3) | free; degree 81 | SV5 now cited (ShimuraData §4.2) |
| §0.4 étale tensors | E/F₅ | H₁⊗c⁻¹ roots (1∓2i)/5·5=1∓2i ⇒ T²−2T+5 | consistent | none |
| §0.5 lift independence | GL₂, ordinary E, two lifts | only tensor is the pairing ψ(e,f)=1 in D[1/p], same for both lifts | consistent | none |
| §0.6 crystalline functor | constant ordinary family | slopes (0,1), det slope 1; geometric monodromy 1; ⟨D⟩ ∋ 1(−1) ⇒ Tannakian group ⊇ G_m | H≠1, H⊂G | supplier wording (Motives §6.3) |
| §1.1 pointwise comparison | GL₂ hyperspecial, ordinary lift | Fil¹ rank 1 = rank ω_E; cocharacter type (−1,0) = μ_h⁻¹ | consistent | none |
| §1.2 adapted branch | modular curve | completion W[[t]]; deformation ring of E[p^∞] W[[t]]; dim G/P_μ=1 | equal | none |
| §1.3 tensors distinguish points | Siegel case, no normalization | map to closure is the identity ⇒ injective | trivially true | none |
| §1.4 local-model diagram | modular curve | dim GL₂=4, S 1, S̃ 5, rel dim q=5−1=4; the tensor is ψ, which extends over S | consistent | de Rham extension stated (KP Prop 4.2.6) |
| §1.5 same-field henselization | x∈S(F_p), M_loc=P¹ | #P¹(F_p)=p+1>0; GL₂-torsor over F_p trivial (Lang) | rational y exists | none |
| §1.6 extension | y²=x³+p, p≥5, level GL₂(Ẑ^p) | c₄=0, Δ=−16·27·p², v_p(Δ)=2 ⇒ additive; j=0 extends on coarse line; y²=x³+1 has Δ=−432, a unit | neatness needed | none |
| §1.7 Definition (a)–(d) | ordinary-locus model; blow-up at ss point; GSp₄ Iwahori normalization | (a) fails: ss curve over W(k)[1/p] has rational prime-to-p torsion; (d) fails: W[[t,u]]/(tu−p) vs W[[t]]; normalization would force a finite map with fibre dim ≥1 | each axiom needed | (b) direction pinned to SV §8.2 |
| §1.7 Hecke direction | K=GL₂(Z_ℓ), g=diag(ℓ,1) | gKg⁻¹∩K = {upper-right ∈ ℓZ_ℓ}; g⁻¹(K∩gKg⁻¹)g ⊂ K | T_g defined | convention stated |
| §1.7 Check 4 | GL₂×_(G_m)GL₂, p | stabilizer of a nondegenerate plane in GSp₄ has dim 3+3+1=7 = dim Borel (11+3)/2=7, not solvable ⇒ contains no Borel ⇒ no Iwahori | not quasi-parahoric | none |
| §1.8 strict comparison | Γ₀(p) point | both completions W[[u,v]]/(uv−p) | equal | none |
| §1.9 special fibre | Γ₀(p); nodal curve | two P¹ meeting transversally: reduced, components normal, not integral at the node (k[[u,v]]/(uv)) | as stated | none |
| §2.1 strongly acceptable | GU(1,1) of Q(i) at 5; GSp_(2g) | G_der=SL₂ split, Z^c=U(1)≅G_m at 5; Z^c=μ₂, not a torus | yes; no | *Needs:* now SV §P.1 |
| §2.2 reflex splitting | E₂=Q, E=Q(i), Q(√−2) | 5=(2+i)(2−i) splits; 3 inert (Q₉); −2≡1 mod 3 ⇒ 3 splits in Q(√−2) | as stated | none |
| §2.3–2.4 covers | PGL₁(D) over Q₃, index 3 vs 2 | 3\|3 exceptional; 3∤2 non-exceptional | as stated | none |
| §2.5 every abelian type | diag(2,1)⊕diag(3,1) | multipliers 2≠3 | no similitude | none |
| §2.6 connected fixer | GL₂ vertex | fixer GL₂(Z_p) connected; X_*(G_ab)_I=Z torsion-free | as stated | none |
| §3.1 A_int | GL₂ hyperspecial | Z_(p)^×∩∏Z_ℓ^×={±1} ⇒ discrete; A_int/A_int°≅∏_(ℓ≠p)Z_ℓ^×=Ẑ^×/Z_p^× | matches components | none |
| §3.2, §3.5 components | GL₂, level N, p∤N; p-level ker(GL₂(Z_p)→GL₂(F_p)) | (Z/N)^×, Q(ζ_N) unramified at p; (Z/Np)^×, Q(ζ_(Np)) ramified | parahoric hypothesis needed | none |
| §3.3 connected cover | G^fix=G° | identity cover | consistent | none |
| §3.4 twisting | γ=diag(ℓ,1) | γKγ⁻¹∋[[1,0],[ℓ⁻¹,1]]∉K | level conjugated | none |
| §3.6 gluing | w=[[0,1],[p,0]], j=diag(p,1), p=7, M=[[2,3],[5,7]] | wMw⁻¹=[[7,5/7],[21,2]]=[[d,c/p],[pb,a]]; jMj⁻¹=[[2,21],[5/7,7]]=[[a,pb],[c/p,d]] | w normalizes I; j does not (c=p↦1) | none |
| §3.7 freeness, §3.8 models | GU(1,1), K₁=K₂ | central i acts trivially, i∉K₁; trivial quotient = scheme | as stated | none |
| §3.9 connected adjoint | GL₂, edge midpoint | det w=−p (val 1) ⇒ fixer I; I/G_m dim 3; w²=p scalar ⇒ PGL₂ fixer has 2 components | G^fix/Z ≠ full fixer of x_ad | none |
| §3.10 strongly acceptable diagram | GU(1,1); CM torus | dims G_ad 3, S 1, S̃_ad 4; G 5, frames 6; rel dim 0 for torus; H¹(F_q,Z/2)=Z/2 | as stated | none |
| §4.1 Newton class | ordinary E | D slopes {0,1} ⇒ b_x slopes {0,−1} | consistent | none |
| §4.2 admissibility | B(GL₂,{μ⁻¹}) | diag(p⁻¹,1): slopes (0,−1), κ=−1; basic (−½,−½), κ=−1 | both admissible | none |
| §4.3 strata | B(PGL₂), basic | GL₂ slopes (0,0),(½,½) ⇒ ν=0, κ=0,1 in Z/2 | κ distinguishes them | none |
| §4.4 closure | elliptic | (½,½) ≤ (1,0) on D | ss in closure of ord | none |
| §4.5 nonemptiness | SL₂, T norm-one of Q(i), d=diag(3,1) | det(d/√3)=1; normalizer dets ±(a²+b²), even v₃; 1/3 has v₃=−1 | T′ not SL₂(Q)-conjugate | supplier wording (RG3 §2.5) |
| §4.6–4.7 ordinary locus | modular curve; PEL §M2.16 | complement of finitely many ss points: open dense | density holds | kept-variant clause (PELModuli §M2.16) |
| §4.8 I_x | p⁻¹, ℓ⁻¹; ss E | p⁻¹=f/n ⇒ n^(2d)=p^(2d)·deg f, contradiction; ℓ unit in Z_(p); I=B^×, B ramified at {p,∞} | p⁻¹∉I(Z_(p)), ℓ⁻¹∈ | none |
| §4.9 realizations | E/F₅; ss E/F₃; δ_D=[[0,−1],[5,0]]; N(z)=5 | γ_ℓ=(1∓2i)/5 independent ⇒ e=1, dim Z=2; X*(S)=Z⊕Z/2 ⇒ e=2, Z(γ) dim 2, Z(γ²) dim 4; δ_D²=−5, (δ_D⁻ᵀ)²=−1/5; unramified norms even valuation, uv=5 has (5,1) | positive exponent and framing degree needed | none |
| §4.10 Rosati | ss E | H^×/R^×≅SO(3) compact; R^× not compact | compact only modulo scalars | none |
| §4.11 Hecke orbit | GL₂, g₂=−g₁ | −1∈I_x(Z_(p)) | same class | none |
| §4.12 full rank | E/F₅; ss E/F₉ | I_x=Q(i)^× rank 2; B^× rank 2; rank GL₂=2 | equal | none |
| §4.13 Tate comparison | E/F₅, ℓ≠5 | Z(γ_ℓ)=Q_ℓ(i)^× dim 2 = dim I_x⊗Q_ℓ | iso | none |
| §5.1 functoriality | identity datum | identity extension | consistent | none |
| §5.2 matched datum | diag(2,1),diag(3,1); equal multipliers | 2≠3 no similitude; c₁=c₂ similitude | as stated | none |
| §5.3 matched geometry | K′=Q(√2), Q(√−2), Q(i) at 5; GU(1,1)(Q(i))×GU(1,1)(Q(√−11)) | 2,3 non-squares mod 5; complex place gives 2(Ψ(a,ha)−Ψ(b,hb)); 5 splits in Q(i); −11≡4; rank Z=2+2−1=3=2+1 | total reality, single place, non-simple adjoint all needed | supplier wording (GS2 §7.7) |
| §5.4 Siegel map | torus T⊂GL₂ at 5; GU(1,1) | ψ(1,i)=Tr(i·1·(−i)/2)=1; f₁=e₁+e₂/5: Gram det u²; t=(1,2): tf₁=f₁+(1/5)f₂; GU p-ranks 2 and 0; y²=x³+x/F₃ counts 1,0,2, a=0 | lattice hypothesis needed | none |
| §5.5 product | ι₃⊕ι₃ | dim doubles | ι₃, not the defining embedding | none |
| §5.6 exact sequences | G₁=G₂=Res_(Q(i)/Q)G_m, G₃ = equal norms | dim I_(x3)=3 = dim C_i (1) + dim I_(x_i) (2) | exact | none |
| §5.7–5.9 ordinary lifts | E/F₅ canonical lift | End=Z[i] lifts (Serre–Tate) | as stated | none |
| §5.10 rational Frobenius | torus point | γ₀=(1∓2i)/5∈T(Q); T(R)/R^× compact | elliptic | none |
| §6.1 KR strata | GU(1,1) hyperspecial | 1 KR stratum vs 2 Newton strata | different stratifications | none |
| §6.2 rational lifting | connected group vs Z/2 | Lang ⇒ H¹=1; H¹(F_q,Z/2)=Z/2 | connected group needed | none |
| §6.3 curves | marked point of degree 2 | T²+(6/25)T+1/25 ≠ T²−(2/5)T+1/5 | residue field must stay F_q | none |
| §7.1 local systems | GU(1,1), χ₃χ₇ level; Hilbert datum | projection onto G(Z₃), intersection index 2 ⇒ not a product; units ≡1 mod N infinite | product hypothesis removable; Hodge type needed | SV5 cited |
| §7.2 Frobenius point | diag(1,1/5); torus over F₅, F₂₅ | (T−1)(T−1/5)=T²−(6/5)T+1/5; traces/dets (2/5,1/5), (−6/25,1/25) | det(T−g) convention | none |
| §7.3 unit eigenvalues | π=1+2i | π⁻¹=(1−2i)/5, unit away from 5 | as stated | none |
| §7.4–7.5 independence | torus, any character | χ(γ)∈Q, the same for all ℓ; (trace, det)=(2/5,1/5)∈Q | as stated | none |
| §7.6 headline | uniqueness; torus | Conj(G)(Q)→Conj(G)(Q_ℓ) injective; Conj(T)=T, γ_y∈T(Q) | unique; consistent with KZ line 2104–2106 | none |
| Downstream: H¹ convention | inversion on Conj(GL₂) | (2/5,1/5)↦(2,5)=(trace, det of 1±2i) | consistent | none |

## Unresolved, for the worker and the human reviewers

1. **gap:rational-stack-presentation versus main.** LefschetzPencilsAndVanishingCyclesPartII on main (README line 691–693) says the rational lift to a smooth atlas belongs to the Shimura roadmaps. This README instead asks AlgebraicModuliForArithmeticGeometry Layer 4 for it. That layer's heading is "gerbes, bands and profinite stages", and the supplier uses pointed atlases only as hypotheses (its line 9703, 9960). KZ cites Laumon–Moret-Bailly Théorème 6.3 for it (KZ line 2341–2343). I kept the accepted design.
   - For the finite quotient stacks used here, the twist `Y^P=(P×Y)/Γ` would give the presentation directly.
   - It is a scheme when Y is quasi-projective. The abelian-type models of §3.8 are not documented as quasi-projective, so restating the target here would need an algebraic-space version or a quasi-projectivity input.
   - This is a scope decision for the human reviewers.
2. **ReductiveGroupsPartIII Layer 2.** gap:rg3-r-smooth-tori, gap:rg3-r-smooth-abelian-type, gap:rg3-r-smooth-central-quotient and gap:compact-quotient-borel ask for new targets in a layer headed "Global tori and real cocharacter adjustment". "R-smooth" occurs nowhere in that roadmap. ReductiveGroupsPartII on main lists R-smoothness outside its scope (lines 85–99) without naming an owner. I kept these as accepted.
3. **22 gaps on 11 suppliers.** The headlines hold only once those suppliers accept them. GeometricSatakeAndFusionPartII §7.7, which §5.3 consumes, itself rests on two contracts of its own (gap:r-smooth-full-fixer-embeddings, gap:wild-admissible-closedness).
4. **Noot's comparison.** ArithmeticGaloisRepresentations on main (line 195) assigns "Noot's specialization" to NeronModelsAndSemistableAbelianVarieties §6.0. That is Noot 1995 closed-point specialization, not the Noot 2009 Conj′ Frobenius comparison (HT line 1102) that gap:noot-coarse-comparison asks of ArithmeticGaloisRepresentations Layer 6, so the gap stands. Reviewers may prefer a different owner; ReductiveGroupsPartIII §4.5 takes it as a hypothesis.
5. **GlobalShtukas mentions this roadmap.** GlobalShtukasAndFunctionFieldLanglands' Downstream consumers (its line 2240) says ShimuraVarietiesPartII takes the GL_r correspondence from AutomorphicLFunctionsAndLocalFactors §AL.3. This roadmap uses only companions on curves (§§6.1–6.2, gap:open-curve-companions), not the correspondence itself. That sentence belongs to the supplier's file and was not edited.
6. **Unverified texts.** The published versions of KZ, HT and K17 were not collated (as in `sources.toml`). HT Appendix A was not read beyond the locators.

No passage in any file read during this job tried to instruct the agent; nothing suspicious to quote.


Pull request: #2463 (roadmap/shimura-varieties-part-ii at 53e61e3)
