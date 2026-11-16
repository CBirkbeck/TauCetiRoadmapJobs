# PORT-PELModuliPartII

- Branch: `roadmap/pel-moduli-part-ii`, from main `d68af47`; head commit `33e4234`
  ("PELModuliPartII: roadmap (README, Suggested.lean, metadata)"). Files: `TauCetiRoadmap/PELModuliPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder.
- Build: `lake build TauCetiRoadmap.PELModuliPartII.Suggested` → `Build completed successfully (18239 jobs).` Warnings: 0. The file has no `sorry` because it declares nothing.
- Gate: `gate PELModuliPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), exact output:

  ```text
  depcheck: 257 roadmaps, 2445 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

Build the integral and formal moduli of unitary type that the arithmetic of unitary Shimura varieties uses, continuing PELModuli past good primes, the principal unramified case and primes unramified in the CM field. Starting from O-displays of strict formal O-modules over the relative Witt O-frame, relative duality, the representability of EL and polarized PEL framed functors for an arbitrary self-dual periodic multichain, and Mihatsch's relative comparison, the roadmap constructs the unitary Rapoport–Zink spaces of principal, almost self-dual, exotic and Krämer type with their special homomorphism spaces, and proves their formal smoothness or regular semistable reduction and the two connected components of the exotic space over every p-adic field. Globally it builds the integral CM moduli at every prime, the Rapoport–Smithling–Zhang, Li–Liu, He–Li–Shi–Yang and Liu–Tian–Xiao–Zhang–Zhu integral models with their smoothness, regular semistable reduction and quasi-projectivity, and the formal uniformization of their basic loci by the local spaces. Polarization kernels, signature conventions, integral Eisenstein conditions and coefficient fields are fixed in every statement, with computed witnesses, because none of them is recovered from the generic Shimura variety.

AI assistance: Claude (Opus 5.5) performed the port, the supplier, citation and ownership checks, the mathematical self-review and the Lean validation.

## Dependencies still in pull requests

Suppliers cited by name and section that are new-roadmap pull requests, all earlier in the merge order (this roadmap is at position 200):

- PELModuli.
- ShimuraVarieties.
- VectorBundlesAndIsocrystals.
- GeometryOfNumbersAndQuadraticArithmetic.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory.
- EndoscopicTransferAndUnitaryTraceComparison.
- HilbertModularVarietiesAndShimuraCurves.
- ShimuraCompactifications.
- PadicHodgeTheory.
- IgusaVarietiesAndTorsionConcentration.

Suppliers on main: AbelianSchemesAndArithmeticModuli, AdicSpacesPartIII, SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, AdelicAlgebraicGroups, ReductiveGroupsPartII. SelmerIwasawaCohomologyPartII (open, position 418) appears only under Downstream consumers. No citation uses an id that only an open revision defines; the overlap tool lists no pull request that changes this roadmap and no dropped id.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` has no declaration: every headline (§§1.2, 2.2, 3.4, 3.7, 5.7; §6.6; §§7.6–7.9, 8.4, 8.7; §§9.5–9.10; and §9.1) needs a carrier absent at the pins, and the docstring names each with what it lacks. I re-checked those claims at Mathlib `1b1ccf4` and Tau Ceti `2fd255d`: the only formal-scheme carrier is `TauCeti.FormalScheme.Spf` (`carrier`, `structureSheaf`); `TauCeti.AlgebraicGeometry.AbelianVariety` is over a field (`AbelianVariety/Basic.lean:95`); Tau Ceti has `IsAlgebraicSpace` but no Deligne–Mumford stacks, abelian schemes, p-divisible groups or relative Witt vectors; Mathlib's `WittVector.Isocrystal` has no functor from abelian varieties; `TateModule` (`TauCeti/Algebra/Module/Torsion/TateModule.lean:125`) exists, as the docstring says. The only change is a leading `module` line, as in recent roadmaps on main (for example SchemeKTheoryOperationsPartII). Without it Lake warns that `Mathlib` is designed for the module system; with it the build has no warnings and the gate accepts the file.

`#check` audit: the file declares nothing, so there was no `@name` to elaborate and no signature changed.

## Supplier replacements and duplication removals

Owners cited in place of unattributed text:

- §8.1: the finite étale CM level scheme T_p is now cited as PELModuli §§M4.7–M4.8 (the CM moduli scheme there, a torsor under its finite group). The factor A is a unitary O_F-abelian scheme of signature type NΦ−τ∞+τ∞^c in the sense of PELModuli §M1.3. Both sections were added to the *Needs:* line, to the Layer 8 supplier list and to the PELModuli supplier contract.
- §8.7: the route now uses the deformation theorem of PELModuli §M2.12 (deformations of (A,λ) are orthogonal pairs of lifts of `ω_{A∨,τ∞}` and `ω_{A∨,τ∞^c}`) instead of recomputing it. PELModuli §§M1.3 and M2.12 were added to *Needs:*.

Duplication removals: none. The sweep by object covered the following, over main and every open head at the index of 2026-11-16T09:01:34Z: Rapoport–Zink spaces, almost self-dual, exotic and Krämer models, O-displays and the Witt O-frame, relative Witt vectors, strict formal modules, fake Drinfeld data, basic loci and uniformization, Mihatsch's comparison, LTXZZ models, special homomorphisms and Kudla–Rapoport. It found no second owner of anything this roadmap states.

- IgusaVarietiesAndTorsionConcentration §0.27 is the unramified single-lattice PEL Rapoport–Zink space, and the scope already cites it; its §0.31 covers split Drinfeld levels, also cited.
- PELModuli §M4.7 covers the CM moduli at p unramified in F. §6.6 is a kept variant: it covers every prime and a polarization ideal a, and says so.
- AInfCohomology and CrystallineCohomology use "relative Witt" for relative de Rham–Witt complexes, which are different objects.
- GeometricSatakeAndFusionPartII asks PELModuli for ramified local PEL data and builds no moduli space.
- HilbertModularVarietiesAndShimuraCurves §R18.5 builds Drinfeld/Cherednik uniformization: a different datum and a different quotient theorem.
- FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII builds Dieudonné displays over the Zink ring, not O-displays.

Ownership: this roadmap is the owner of the unitary local spaces, the integral models of Layers 7–8 and the uniformizations of Layer 9. No roadmap on main or earlier in the merge order states them. No declaration of `Suggested.lean` carries another roadmap's name, because the file declares nothing.

## Fixes made on the upstream read

1. Twenty "Hypotheses for this target:" lines and one "Hypotheses for the first theorem:" line (§9.2) were field lists. They are now prose sentences ("This target assumes …") with the same hypotheses.
2. "Adapter" is software jargon, not a mathematical term. It is gone:
   - The Layer 8 title "Integral isogenies and neat model adapters" is now "Neat unitary models and integral isogeny moduli".
   - §7.4 API: "after the local convention adapter" became "after conjugating the local O_L-actions (§0.7)".
   - §8.1: "the explicit Layer 6 quotient adapter" became "the common-scalar quotient of §6.3".
   - §8.1 Check: "source-specific adapter" became "this model".
   - §8.2: "the smooth adapter" became "§8.1".
   - §8.6: "CM/generic adapters" became "the CM-product and generic-fibre comparisons of §§6.3 and 7.2".
3. §1.1 defined the framing as "ρ:X over the uniformizer-zero subscheme →𝕏", which garbles the source and target. It now names the closed subscheme S̄⊂S cut out by the uniformizer and the base change of 𝕏 to S̄, and imposes ρ*λ_𝕏=λ over S̄.
4. "How to read the build" said Layers 1–5 are "each independent of the others except through Layer 0", then listed exceptions. It now says that Layer 2 also uses Layer 1, that Layer 4 uses Layer 3, and that the principal, exotic and Krämer families do not use one another.
5. The Downstream consumers paragraph described another roadmap's current contract wording ("requests them from ShimuraVarieties … does not state them"), which would go stale. It is now an ownership statement: the LTXZZ22 §§4.2 and 5.2 models are owned here and are not part of the generic canonical models of ShimuraVarieties §6.7.
6. The supplier attributions of §§8.1 and 8.7 (previous section).

## Adversarial mathematics pass

The pass was computed on the ported text. `Suggested.lean` has no declaration, so the context, `variable` and generality rows concern the README only.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1 heights | n=3, [K:ℚ_p]=2 | rel. height 6, abs. 12, dim 3 (not 6) | holds | none |
| Conv. 2 / §2.4 deg α | n=2, q=3 | (1,1)+(0,1)=(1,2); (1,1)+(1,0)=(2,1); 9·9=(deg α)² ⇒ deg α=9; 27²=729≠81; deg π₁=q+1=4 | holds | none |
| Conv. 3 / §6.5 / §7.3 Eisenstein | 𝔽₃, N=[[0,1],[0,0]] | charpoly T², N²=0, N≠0 | Kottwitz ⇏ annihilation | none |
| Conv. 4 / §2.2 / §7.8 regularity | uv=t², max ideal (u,v,t) | uv−t²∈𝔪², emb. dim 3 > dim 2 | not regular after ramified base change | none |
| Conv. 5 / §5.6 Krämer chart | n=2, y(1+x²)=2u, p odd | roots ±i, derivative 2x=±2i≠0; z=(1+x²)/2 ⇒ yz=u; 𝔪=(y,z), dim 2 | regular | none |
| Conv. 6 / §1.6 graph | n=2,3,4 | rel. (0,1), (1,3), (2,5); arith. (1,2), (2,4), (3,6) | "half" only in arithmetic count | none |
| Conv. 8 / §9.6 | val_u(ϖ)=1, 0 | u²/ϖ valuation 1−val_u(ϖ): 0 (unit), 1 | dual moves by one valuation when 0 | none |
| Conv. 9 hermitian convention | L=ℚ₃(u), u²=3 | h(u,1)=u; H(u,1)=h(1,u)=ū=−u; h(x,x)=H(x,x)=xx̄ | conventions differ off-diagonal only | none |
| §0.1 F, V, ghosts | n=0,1,2 | w₁(x)=x₀^q+πx₁; w_n(Vx)=π·w_{n−1}(x), w₀(Vx)=0; w_n(FVx)=π·w_n(x) | FV=π | none |
| §0.1 Check π↦−π | q odd, x_i↦(−1)^i x_i | ghost maps agree; w₁(Vx)=πx₀ changes sign | dual depends on π | none |
| §0.1 V normalized by p | O_K=ℤ_p[√p], R=𝔽_p | image (p)=(√p)²⊊(√p)=I_O(𝔽_p) | not a frame | none |
| §0.1 Check twisted LT | K=ℚ_p(√p), R=O_K/(p)=𝔽_p[x]/(x²) | √p acts by −x≠x since 2x≠0 (p odd) | not strict | none |
| §0.1 Check biformal | rel. height 1, dim 1 | dual dim 1−1=0 ⇒ étale | not biformal | none |
| §0.1 Check f=2 | O′=W(𝔽_{p²}), rel. height 2, dim d | P rank 4=2·2, P₀,P₁ rank 2, Q=Q₀⊕P₁, rank P₀/Q₀=d | rel. height 2, not 4 | none |
| §0.2 Check deformation count | [K:ℚ_p]=e', h=2e', d=1 | d(h−d)=2e'−1; with d=e': e'² | strict action removes all | none |
| §0.2 Check Cartier vs relative dual | K/ℚ_p ram. deg 2, rel. ht 2 dim 1 | Cartier dual dim 4−1=3; relative dual dim 2−1=1 | not PEL of underlying group | none |
| §0.3 signature | n=1 | (1,0): Lie char a; (0,1): ā | holds | none |
| §0.4 P(r,s) degree | [K:K₀]=ef | deg P₀₁=ef; deg P(r,s)=n·ef=dim | consistent | none |
| §0.4 μ-ordinary Check | L=ℚ_{p²}, (r,s) | sorted average slopes: 1^{min}, ½^{|r−s|}, 0^{min}, each twice; n=2,(1,1): 0,0,1,1 | supersingular ⇔ rs=0 | none |
| §0.4 dimension change | K₀=ℚ_p, K ram. deg 2, n=1 | X: ht 4 dim 2; C(X): rel. ht 2 dim 1, p-height 4 | C changes the group | none |
| Layer 0 Examples | K₀=ℚ_p, f=2, (1,1) | ht 2·2·2=8, dim 4 ↦ rel. ht 4, dim 2, p-ht 8 | holds | none |
| §0.6 local model | (1,2); (r,s)=(1,n−1); r=0 | Gr(1 quot of rank 3)=ℙ², dim rs=2; dim n−1; Gr₀=base | holds | none |
| §0.6 clause (ii) | K₀=ℚ_p, K=ℚ_p(√p), n=2, (2,0), S=Spec k | quotient k[x]/(x²): charpoly T² both sides, x≠0 | (i),(i′) hold, (ii) fails | none |
| §0.7 conjugation | n=3 | det (T−ā)(T−a)²; λi′(a)=λi(ā)=i(a)^∨λ=i′(ā)^∨λ | polarization relation kept | none |
| §1.1–1.2 N_n | n=1, 2 | rel. dim 0 (Spf O_L̆), 1 | holds | none |
| §1.4 δ | n=1 | (1,0)+(0,1)=(1,1), ht 4; with ℰ: (2,0) | holds | none |
| §1.5 V_n | n=2 | Hom of 2 copies of slope-½ block: K-dim 8, L-dim 2 | holds | none |
| §2.3 / Layer 2 Examples invariants | W₂, x₀ norm ϖ | det valuation even (split) → odd (nonsplit V₃) | holds | none |
| §2.4 Check β | restriction of α to ℰ̄ | λ_ℰ̄⁻¹β^∨λ_Xβ=ϖ=h(x₀,x₀) | not a unit vector | none |
| §2.5 dims | n=2 | Ñ₂ rel. dim 1, Z(x₀) rel. dim 2−1=1, N₃ rel. dim 2 | image is Z(x₀) | none |
| §3.1 / §3.2 exotic kernel | n=2; general n | X[i(u)] order q^n (q² at n=2); X[ϖ] order q^{2n} | holds | none |
| §3.2 symmetry | σ^∨=±σ | σ^∨=σ ⇒ λ^∨=σi(ū)=−λ; σ^∨=−σ ⇒ λ^∨=+λ | σ symmetric | none |
| §3.4 coefficient ring | n=2 | O_L̆[[t]]⊗k over O_K̆ = k[u]/(u²)[[t]] | not smooth over O_K̆ | none |
| §3.7 vertex lattices | n=2, e₁,e₂ norms 1, −ε | Λ₀^♯=Λ₀, Λ₀^∨=u⁻¹Λ₀, type 2; h(x,x) valuation =min (ε nonsquare) ⇒ Λ=Λ₀ unique; V_Λ₀^ε dim 0 | two points, one per component | none |
| §3.7 strata | n=4 | t=4: V_Λ^ε=ℙ¹, V_Λ two lines; t=2: two points | holds | none |
| §3.7 κ₂ | K/ℚ_p unram. deg 2 | abs. height = 2·rel. height ⇒ parity 0 always | relative height needed | none |
| §4.1 / §4.3 / §4.5 / §4.6 | f=1, 2; n=2 | abs. (2nf, nf)=(8,4); μ: f=1 empty product μ=1, f=2 F²μ/μ=ε₁; source (4,2)↦(2,1); V_Φ L-dim 2, ℚ_p-dim 8 | holds | none |
| §5.2 / §5.9 generator norm | e ↦ ue | uū=−u², K-valuation 1 | not principal | none |
| §5.4 trace recovery | A=⟨Πx,y⟩, B=⟨x,y⟩ | Tr(u⁻¹δ(A+uB))=δ(0·A+2B)=2δB | factor (2δ)⁻¹ | none |
| §5.5 parity | n=3, n=2; nonsquare unit c | det scales by c^n: χ flips for n=3, not for n=2 | holds | none |
| §5.8 / §5.9 rescaling | λ_Y↦cλ_Y, c=2 | h↦c⁻¹h, (e,e)↦c(e,e); product invariant; inverse ↦c⁻² | factor is (e,e)_Y | none |
| §6.1 G̃ | (z,g), c(g)=Nm z | c(z⁻¹g)=1; inverse (z,u)↦(z,zu) | holds | none |
| §6.2 admissibility | F⁺_v=ℚ_p(√p), F_v=F⁺_v(√ε) | 4 embeddings (σ,±); {(σ,+),(σ,−)} pulled back; {(σ,+),(σ̄,−)} not | holds | none |
| §6.6 integrality / a=(1/2)ℤ, 2ℤ | F=ℚ(i) | Λ^∨=2Λ⊊Λ impossible; Λ^∨=½Λ via 2λ, kernel A[2] | a⊆O_{F⁺} | none |
| §6.6 arrows | F⁺=ℚ(√2), c=1+√2 | c²=3+2√2 (conjugate ≈0.17>0), c⁴=17+12√2, c⁻¹=√2−1 | exact pullback | none |
| §6.6 k[ε] Check | R[x]/(x²), R=k[ε] | stable rank-1-quotient ideals (x+εc); charpoly T+εc fixes c | Kottwitz gives étaleness | none |
| §6.6 emptiness | F⁺=ℚ(√3), F=ℚ(ζ₁₂) | disc 12, 144=12² ⇒ F/F⁺ unramified; h=1; units with ε̄=−ε are ±iη (−1∈μ₆=W²); N(2+√3)=1; θ=±iη/(2√3) has Im of opposite signs | M₀^a empty; agrees with RSZ21 Remark 3.7(i)(ii) read at source | none |
| §6.8 parity | n=3, r_φ=2 | 3·1−2=1; 3·0−2=−2 | conventions differ | none |
| §7.6 bad base | F⁺=ℚ(√3), p=3 | 3 ramified in F⁺, inert in F (−1 nonsquare mod 3) | multichain moduli | none |
| §7.7 isotropy | F⁺=ℚ, n=4; F⁺≠ℚ | trace form sig. (6,2), 8≥5 vars ⇒ isotropic (Meyer); a definite real place ⇒ anisotropic | projectivity needs F⁺≠ℚ | none |
| §8.1 special inert | F⁺=ℚ(√2), p=7 | 2≡3² mod 7 (split in F⁺), −1 nonsquare mod 7 (𝔭 inert), 7∤8 | 𝔭 special inert, p not inert | none |
| §8.4 local ring | N=2; N=1 | W(k)[[x₁,x₂]]/(x₁x₂−p): dim 2, x₁x₂−p∉𝔪²; N=1 rank-one V′ anisotropic | holds | none |
| §8.4 projectivity | N=2; N=3, F⁺=ℚ | det V′ odd valuation at inert 𝔭 ⇒ −det not a norm ⇒ anisotropic; N=3: 6 vars sig. (4,2) isotropic | holds | none |
| §8.7 tangent | N=1, 2 | ω_{A∨,τ∞} rank N−(N−1)=1; Hom(rank 1, rank N−1): 0, 1; orthogonal complement fixes τ∞^c part | holds, now via PELModuli §M2.12 | route attributed |
| §9.1 Tate–Dieudonné | supersingular E; ordinary CM E with conjugated action | 4=4 at ℓ; 0 vs 2 at ℓ, slopes 0 vs 1 at 𝔭 | common-slope hypothesis needed | none |
| §9.2 Check | Gram [[0,1,0],[1,0,0],[0,0,3]], g=diag(3,1/3,1) | det −3; duals Oe+O(f/3)+O(a/3), O(e/3)+Of+O(a/3), Oe+Of+O(a/3); lengths 3,3,1; gΛ₋=Λ₊ | (ii) fails, quotient still an étale torsor | none |
| §9.2 −1 | N_n, Γ={±1} | −1 fixes every point | quotient sheaf N_n; not a torsor | none |
| §9.3 product formula | flip at v₀ only | ∏ε_v=−1 | real place must flip too | none |

Degenerate and junk cases: n=1 for §§1.1–1.5 (rel. dim 0, Spf O_L̆), f=1 for Layer 4 (identity), N=1 for §§8.2, 8.4 and 8.7 (dimension 0, projective), A_ψ=∅ in §6.5 (Q=1 forces the summand to 0), r=0 or s=0 in §0.6 (the base), Γ trivial in §9.2 (one sheet). Each holds as stated. No statement changed as a result of the pass; the only mathematical changes are the attributions and wording listed above.

## Unresolved

- SelmerIwasawaCohomologyPartII (open, merge position 418) asks ShimuraVarieties for the native LTXZZ22 models through its contract gap:native-shimura. This roadmap (position 200) owns those models in §§8.1–8.4 and 8.7, and ShimuraVarieties does not state them. That pull request should redirect the contract to PELModuliPartII §§8.1–8.4 and 8.7. Its specialization isomorphisms (LTXZZ22 Lemma 4.2.4) and the proper smooth models of Remark 5.2.8 are not stated here; that roadmap must keep them, or a future part of this one must state them. I made no edit outside this folder.
- GrossZagierAndArithmeticHeights §7.2 and LubinTateFormalModulesAndQuasiCanonicalLifts §6.1 (positions 369 and 374) build canonical lifts of height-two formal modules with a quadratic action. §§1.3, 3.5 and 5.2 here build these lifts with polarization and framing. Those roadmaps are later, so they should cite this one; nothing changes here.
- Licence question for the human reviewers, carried from the accepted review: RZ96 is read from an author-hosted scan of the Princeton book.
- The published page numbers of Zhang21 (Annals) and LTXZZ22 (Inventiones) were not read in the published versions. The sections, equations and statements were checked against the arXiv versions.
- `roadmaps resolve` reports no unresolved citation or Lean name. It did not check Lean names outside TauCetiRoadmap ("no pinned Lake packages on this host"). I checked every backticked Mathlib and Tau Ceti name against the pins myself: `LinearMap.charpoly`, `LinearMap.charpoly_monic`, `LinearMap.charpoly_natDegree`, `Matrix.charpoly`, `Module.Grassmannian`, `Module.Grassmannian.scheme`, `Module.Grassmannian.toSpec`, `Module.Grassmannian.schemeHomEquiv`, `Module.Grassmannian.isSeparated_toSpec`, `Module.Grassmannian.isProper_toSpec`, `WittVector`, `WittVector.ghostComponent`, `WittVector.frobenius`, `WittVector.verschiebung`, `WittVector.Isocrystal`, `IsRegularLocalRing`, `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.SmoothOfRelativeDimension`, `TauCeti.FormalScheme.Spf.carrier`, `TauCeti.FormalScheme.Spf.structureSheaf`, `TauCeti.AlgebraicGeometry.AbelianVariety`.
- Ownership was checked against main and the open roadmap pull requests through the `roadmaps grep`, `show`, `resolve` and `overlaps` tools (index of 2026-11-16T09:01:34Z). The two board packages still under review (AnalyticNumberTheory, LawrenceVenkateshMethod) are unrelated to this subject.
- Suspicious text: none found in the package, its reports or the supplier texts read.


Pull request: #2453 (roadmap/pel-moduli-part-ii at 33e4234)
