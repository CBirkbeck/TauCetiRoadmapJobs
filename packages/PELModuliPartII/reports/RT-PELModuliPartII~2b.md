<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6910837927 -->
Red team round 2 pass b (claude) of f7a0780

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.4 negative-control Check describes a case that cannot occur

   **Location.** `packages/PELModuliPartII/README.md:1712`: "For F⁺=ℚ and N=2, V′ has signature (1,1) and is
   isotropic exactly when −det V′ is a norm from F; then … the model is quasi-projective but not projective."

   **Claim.** At N=2 the almost self-dual model can fail to be projective.

   **Witness.** §8.3 makes Λ′_𝔭 almost self-dual at the inert 𝔭. For N=2 its Gram matrix is diag(1,p)·units,
   so −det V′ has odd valuation at 𝔭 and is not a local norm: V′_𝔭, hence V′, is anisotropic for every F⁺.

   **Repair.** Replace the Check by:

   > For N=2 the model is projective over T_p for every F⁺: Λ′_𝔭 is almost self-dual, so in an orthogonal
   > basis its Gram matrix is diag(1,p) up to units, −det V′ has odd valuation at the inert prime 𝔭 and is
   > not a norm from F_𝔭, and V′ is anisotropic already at 𝔭. This differs from the self-dual model of §8.7,
   > where V at N=2 can be isotropic. The first non-projective case is N=3 with F⁺=ℚ: V′ has signature
   > (2,1), its trace form is an indefinite rational quadratic form in 6 variables, isotropic by Meyer's
   > theorem, so the product datum has a cusp label and the model is quasi-projective but not projective.

   Tested on the refuting instance: N=2 gives valuation 1 (odd), anisotropic, projective; N=3, F⁺=ℚ gives
   6≥5 variables, isotropic, and a rank-3 space over F_𝔭 is isotropic, so 𝔭 does not obstruct.

2. **F02** (P3) the *Needs:* line of §9.5 names no target for the models it completes

   **Location.** `packages/PELModuliPartII/README.md:1901`: "*Needs:* … §9.1; the completed integral models of
   Layers 7–8, using AdicSpacesPartIII Layer F0."

   **Claim.** Every *Needs:* item is a target or a supplier section ("item by item", `README.md:374`).

   **Witness.** The models whose completions are the targets of Θ are fixed by §§9.6–9.10: §7.3 (`:1916`),
   §§7.1 and 7.2 (`:1920`), §7.4 (`:1947`), §8.6 (`:1960`). §7.2 is absent from the Layer 9 list at `:1979`;
   §§8.1–8.4 are not uniformized here.

   **Repair.** In `:1901` replace "the completed integral models of Layers 7–8, using AdicSpacesPartIII Layer
   F0" by "§7.1; §7.2; §7.3; §7.4; §8.6; AdicSpacesPartIII Layer F0 (completion along the basic locus)". In
   `:1979` write "Layer 7 (§7.1, §7.2, §7.3, §7.4, §7.9)". Tested: each of §§9.6, 9.7, 9.9, 9.10 then finds
   its model among the needs of §9.5; no cycle arises (Layers 7–8 need nothing of Layer 9).

3. **F03** (P3) properness "with no cusp label" is cited to a section that does not state it

   **Location.** `packages/PELModuliPartII/README.md:350–351` ("§7.5 (properness of the integral toroidal model
   for a complete cone system, hence of the moduli itself when the PEL datum has no cusp label)"), and the
   routes at `:1555`, `:1704`, `:1763`.

   **Claim.** ShimuraCompactifications §7.5 supplies properness of the PEL moduli when there is no cusp label.

   **Witness.** ShimuraCompactifications §7.5 at its head proves only `IntegralToroidalModel.proper` for
   complete Σ. The open immersion of the moduli (`IntegralToroidalModel.openImmersion`) and the
   "stratification by cusp and cone labels" are its §7.3, which no *Needs:* line here cites.

   **Repair.** In the ShimuraCompactifications subsection of the supplier contracts write: "§7.3 (the integral
   toroidal model, the open immersion of the PEL moduli of PELModuli §M2.8 into it and its stratification by
   cusp and cone labels; when the datum has no nonzero cusp label the only stratum is the open one and the
   immersion is an isomorphism), §7.5 (properness of the integral toroidal model for a complete cone system)
   and §7.18 …". Add "ShimuraCompactifications §7.3" to the *Needs:* lines of §7.7 (`:1564`), §8.4 (`:1715`)
   and §8.7 (`:1771`) and to the supplier lists of Layers 7 and 8 (`:1625`, `:1783`). Tested on N=1 of §8.7:
   V of rank one is anisotropic, no cusp label, the moduli equals its toroidal model, proper by §7.5. The
   dependency check is unchanged (same supplier, earlier in the order).

Round 2. Part 1 checks the round-1 findings against this head; part 2 is the full pass again. Three new
findings, all P3 (S01–S03). No P1, no P2.

## Part 1: round-1 findings at this head

| Round-1 finding | Status | Witness at f7a0780 |
| --- | --- | --- |
| 1a/F01, 1b/F01 (P2) vertex lattices, type, Λ^∨ undefined in §3.7 | repaired | `packages/PELModuliPartII/README.md:911`: "Λ is a vertex lattice when Λ⊆Λ^∨ and uΛ^∨⊆Λ, that is Λ^♯⊆Λ⊆u⁻¹Λ^♯, and its type is t(Λ)=dim_k(Λ^∨/Λ)"; agrees with LL22 lines 518–531, 1102–1106. Check at `:922` recomputed (below). |
| 1a/F02, 1b/F02 (P2) gap:zink-display-equivalence presupposed displays over p-nilpotent rings | repaired | `README.md:251`: "define displays over R with their base change and duals and the functor BT … (§M2.15 defines them over rings of characteristic p)"; the same sentence is the `needs` of the gap in `design/plan.json`; `:39–41` reworded. |
| 1a/F03 (P2) strict O_K-modules had a second owner | repaired | `README.md:22` no longer owns strict modules; `:42–46`, `:253–260`, `:382`, `:392` cite HilbertModularVarietiesAndShimuraCurves §R18.5.4, which at its head reads "Construct here the strict `O_K`-action … Prove `height_p(X)=[K:ℚ_p]h`". Merge order 162 < 188. |
| 1a/F04 (P2) special inert hypothesis | repaired | `README.md:1635`: "𝔭 is a prime of F⁺ that is inert in F, the rational prime p below it is odd and unramified in F, and F⁺_𝔭=ℚ_p"; equals LTXZZ22 lines 1293–1296. Check `:1653` recomputed. |
| 1a/F05 (P3) spurious misprint note on LTXZZ22 §5.2 | repaired | The References entry (`README.md:2050–2059`) has no sentence on N>1; LTXZZ22 line 2652 (Remark 5.2.4, N=1) confirms N≥1. |
| 1a/F06 (P3) three definitions with two Checks | repaired | Third Checks at `README.md:521` (§0.7), `:825` (§3.2), `:1231` (§5.9); each recomputed (below). The §5.9 Check differs from the one proposed and is correct. |
| 1a/F07 (P3) three page ranges | repaired | `:1369` "pp. 13–14; §4.1, pp. 17–19" (RSZ21 lines 804, 809 on p. 14); `:453` "pp. 12–18"; `:1860` "pp. 58–60". |
| 1b/F03 (P3) minimal cover undefined | repaired | `README.md:909` defines the terminal triple (X̃,ρ₁,ρ₂) and states that heights are O_K-relative. |
| 1b/F04 (P3) consumer's request addressed to another roadmap | repaired | `README.md:1988–1993`: "That roadmap requests them from ShimuraVarieties in its supplier contract named native-shimura; ShimuraVarieties does not state them, and their owner is this roadmap." Confirmed at the head of SelmerIwasawaCohomologyPartII. |

No repair introduced an error. The repair report marked no finding `not actionable in this package`.

## Part 2: new findings

## Dependency check

    depcheck: 254 roadmaps, 2411 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` changes only files under
`packages/PELModuliPartII/`. SelmerIwasawaCohomologyPartII (387, later) is named only as a consumer.

## Adversarial pass

`Suggested.lean` declares nothing (one `import Mathlib`, one module docstring, an empty namespace), so the
declaration table is empty and there is no `#check @name` audit to run; I ran no Lean. README targets:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 frame identities | n=1; K=ℚ_p(√p), R=𝔽_p | w₁(Vx)=π·x₀; W_O(𝔽_p)=O_K, F=id, V=·√p, image (√p); V with p has image (p)⊊(√p) | pass | none |
| §0.1 biformal | height 1 dim 1; height 2 dim 1 | dual dimension 0 (étale); 1 | pass | none |
| §0.2 parameter count | [K:ℚ_p]=d, n=1 | 1·(2d−1); with dimension d: d·(2d−d)=d² | pass | none |
| §0.4 P(r,s) | K₀=ℚ_p, K=ℚ_p(√p), n=2, (2,0) | deg P₀₁=fe=2, deg P=4=n[K:K₀]; quotient ranks 2 at ψ₀, ne−r=2 at ψ̄₀ | pass | none |
| §0.4 μ-ordinary | (1,0), (1,1), (2,1) | slopes (½,½); (1,1,0,0); (1,1,½,½,0,0); supersingular iff rs=0 | pass | none |
| §0.6 clause (ii) | K=ℚ_p(√p), n=2, (2,0) over k | F=πD: π=0 on quotient; F=second copy: quotient k[π]/π², π≠0, charpoly (t−a₀)²(t−ā₀)² both | pass | none |
| §0.7 Check (new) | n=3, i′=i∘conj | (T−a)(T−ā)² ↦ (T−ā)(T−a)²; λi′(a)=i′(ā)^∨λ | pass | none |
| §1.5 sesquilinearity, n=1 | h(ax,by); V₁=conjugate-linear part of End⁰(𝔈) | a·h·b̄; V₁=L·Π, h(Π,Π) of odd valuation: nonsplit | pass | none |
| §1.6 unit vector, dimensions | e of the 𝔈̄ factor; n=3, 4 | h(e,e)=1; relative (1,3), (2,5); arithmetic (2,4), (3,6) | pass | none |
| §2.3–2.4 | W₂, x₀; q=3 | det valuation even, +1 odd: nonsplit V₃; (deg α)²=9·9, deg α=9; h(β,β)=ϖ | pass; LZ22 lines 2818, 2854–2857 | none |
| §2.5 degree | Λ_Y⊕⟨ϖ⟩, dual quotient a 2-dimensional k_L-hermitian space | q+1 isotropic lines; LZ22 line 2872 | pass | none |
| §3.2 Check (new) | ū=−u | λ^∨=i(u)^∨σ=σi(ū)=−λ; alternating σ gives +λ; LL22 line 428 | pass | none |
| §3.7 trace dual | L=K(u), p odd | inverse different u⁻¹O_L; Λ^∨=u⁻¹Λ^♯ (LL22 lines 519–520) | pass | none |
| §3.7 n=2 uniqueness | diag(1,−ε), ε nonsquare unit | N(x₁)−εN(x₂)=(−u²)^m(s₁²−εs₂²)+…, s₁²−εs₂² a unit: valuation = min; Λ⊆Λ₀, Λ=Λ^♯⊇Λ₀ | pass | none |
| §3.7 range of t | n=2, 4 | t=0 needs Λ^♯=uΛ (hyperbolic, split only); t=n is Λ^♯=Λ, exists with nonsplit determinant; t∈{2}, {2,4} | pass | none |
| §3.7 maximal strata | vertex Λ of type t<n | Λ/Λ^♯ alternating k-space of dimension n−t (even), a Lagrangian gives Λ′=Λ′^♯⊆Λ | pass | none |
| §3.7 κ₂ Check (new) | ρ iso; K unramified of degree 2 | (X,id,ρ), κ₂=0; absolute = [k:𝔽_p]·relative = 2·relative, always even | pass, agrees with §R18.5.4 | none |
| §4.3 μ | f=1, 2; pairing μ(,)₀ | empty product, μ=1; F²(μ)/μ=ε₁; V⁻¹(μ·Vw)=F(μ)w gives F^f(μ)=μ·∏F^{f−1−i}(ε_i) | pass; LL22 lines 1985, 2030 | none |
| §5.2 fixed lattice | M(Y)=O_L̆e | VM=uM, τ bijective, slope 0; ⟨Πe,e⟩ unit; (ue,ue)=−u²(e,e), valuation 1 | pass | none |
| §5.4 hermitian symmetry, trace | A=⟨Πx,y⟩, B=⟨x,y⟩ | ⟨Πy,x⟩=⟨Πx,y⟩, ⟨y,x⟩=−B: conj(y,x)=(x,y); Tr(u⁻¹δ(A+uB))=2δB | pass; HLSY23 lines 463–465 | none |
| §5.9 Check (new) | λ_Y↦cλ_Y, c=2 | h↦c⁻¹h, (e,e)_Y↦c(e,e)_Y: product fixed; with inverse factor c⁻²=1/4 | pass | none |
| §6.1 | (z,g)↦(z,z⁻¹g); n=2 reflex field | c(z⁻¹g)=1; σ fixes r and Φ ⇒ σφ₀∈Φ∩{φ₀,φ̄₀}={φ₀}: E⊇φ₀(F) also at n=2 | pass | none |
| §6.2 Check | F_v=ℚ_{p²}(√p) | 4 embeddings (σ,±), conjugation σ↦σ̄; {(σ,+),(σ,−)} pulled back, {(σ,+),(σ̄,−)} not | pass | none |
| §6.6 nonemptiness for every a | F/F⁺ ramified at a finite place | F⊄narrow Hilbert class field of F⁺, so Cl(F)→Cl⁺(F⁺) is onto: a·𝔡 is a norm times a totally positive element | pass; RSZ21 line 688 | none |
| §6.6 Checks | a=(2) for ℚ(i); c=1+√2; R=k[ε] | kernel A₀[2]; c²=3+2√2, c⁴=17+12√2; (x+α)∋x² iff α²=0 | pass | none |
| §6.8 parity | n=3, r_φ=2 | 3·1−2=1; 0−2=−2 | pass | none |
| §7.6 Check | F⁺=ℚ(√3), F=ℚ(ζ₁₂), p=3 | e=2 in F⁺ and in F: F/F⁺ unramified at √3; −1 nonsquare mod 3: inert | pass | none |
| §7.7 Check | F⁺=ℚ, n=4 | signature (6,2), 8 variables, Meyer | pass | none |
| §7.8 Checks | n=2 | uv=t²: 3 generators in dimension 2; yz=u: 2 generators in dimension 2 | pass | none |
| §8.1 Checks | F⁺=ℚ(√2), F=ℚ(ζ₈), p=7; N=3 | 3²≡2: split in F⁺; −1 nonsquare: 𝔭 inert; rank ω_{A₀∨,τ∞}=0, Hom dimensions 3 and 1 | pass | none |
| §8.2 kernel | 𝔭 inert, F⁺_𝔭=ℚ_p | O_F/𝔭=𝔽_{p²}, rank p²; LTXZZ22 line 2617 | pass | none |
| §8.4 Check, N=2 | Λ′_𝔭=diag(1,p) | −det of odd valuation at inert 𝔭: anisotropic always | the case described does not occur | S01 |
| §8.7 Check, N=2 | self-dual at p, F⁺=ℚ | isotropic iff −det a global norm: both cases occur | pass | none |
| §9.1 | supersingular E; ordinary E; conjugated CM pair; slopes of a basic pair | 4=4; 2≠4; 0≠2; |Φ_w|/[F_w:ℚ_p] on both factors, ½ at w₀ | pass | none |
| §9.2 lattice Checks | H with rows (0,1,0),(1,0,0),(0,0,3) | det −3; duals ⟨e,f/3,a/3⟩, ⟨e/3,f,a/3⟩, ⟨e,f,a/3⟩; lengths 3,3,1; g*Hg=H, gΛ₋=Λ₊; η₊∈U∩gU | pass | none |
| §9.6 scalar | val_u(ϖ)=1, 0 | u²/ϖ a unit; of valuation 1 | pass | none |
| Stacks tags | 0B3G, 0C4M, 0B3H, 0C4N, 0BCL, 01WN | Stacks lines 4242, 4244–4245, 4268–4271, 4273–4274, 4764–4767, 4931–4934: each states what the routes use | pass | none |

## Verified sound

- Declarations read: 0 of 0 (`Suggested.lean`, 39 lines, read whole). Headlines of the Summary
  (`README.md:11–16`): §§1.2, 2.2, 3.4, 5.7, 3.7, 6.6, 7.6–7.9, 8.4, 8.7, 9.5–9.10; each, and §9.1, is
  named in the module docstring with the carrier it lacks. At the pins: Tau Ceti's
  `AlgebraicGeometry/FormalScheme/Spf/` has `Carrier`, `StructureSheaf`, `IdealIndependence`,
  `CompletedNeighbourhood` (a space, a sheaf, a stalk model; no category of formal schemes, no morphisms
  beyond `Spf.comap` on carriers); `TauCeti.AlgebraicGeometry.AbelianVariety (K) [Field K]`; no p-divisible
  group in Mathlib or Tau Ceti. None is statable; nothing is padding.
- Targets read: 75 of 75 (README read whole, 2091 lines), with every Check and Example; 37 rows computed.
- Locators verified this round against the cached texts: 46 (LL22 14, LZ22 9, LTXZZ22 7, RSZ21 6, HLSY23 5,
  Zhang21 3, LRZ26 1, Stacks 6, and page markers for LL21 Lemmas 5.2, 5.5, Notation 5.6, Howard19
  Propositions 2.1–2.2, RZ17 (8.1), Lemma 8.6).
- Checks tested by computation: 41.
- Sibling citations checked: 28 section ids read at the current heads or on main (PELModuli §§M0.10, M0.18,
  M0.22, M1.7, M2.8, M2.11, M2.12, M2.14, M2.15, M3.8, M4.7; HilbertModularVarietiesAndShimuraCurves
  §R18.5.4; IgusaVarietiesAndTorsionConcentration §§0.27, 0.31; ShimuraCompactifications §§7.3, 7.5, 7.18;
  EndoscopicTransferAndUnitaryTraceComparison §§7.6, 8.3, 8.10, 10.2;
  GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; ReductiveGroupsPartII §RG2.3.5; AdelicAlgebraicGroups
  §4.1; AdicSpacesPartIII Layer F0, §R2.9; AlgebraicModuliForArithmeticGeometry §1.3); all exist with the
  headings the README gives. SelmerIwasawaCohomologyPartII §§2.2–2.6, 5.2, 5.4 exist. `roadmaps resolve`
  lists nothing found nowhere.
- Pinned declarations grepped: 19, all present in the files named (`LinearMap.charpoly_monic` and
  `LinearMap.charpoly_natDegree` with `[StrongRankCondition R]` in `Mathlib/LinearAlgebra/Charpoly/Basic.lean`;
  `WittVector.ghostComponent`, `.frobenius`, `.verschiebung`, `.Isocrystal`; `IsRegularLocalRing`;
  `AlgebraicGeometry.SmoothOfRelativeDimension`; `Module.Grassmannian.scheme`, `.toSpec`,
  `.schemeHomEquiv`, `.isSeparated_toSpec`, `.isProper_toSpec`; `TauCeti.FormalScheme.Spf.carrier`,
  `.structureSheaf`; `TauCeti.TateModule`).
- Declared gaps: four slugs, the same in `design/plan.json` and under Exact supplier contracts, each with a
  named supplier and an existing section; each `needs` states its hypotheses. Not raised.
- Ownership: no roadmap cites PELModuliPartII; the overlap lists (five open, two on main) own none of the
  objects of Layers 0–9 beyond what the README cites. Ownership against the open pull requests was checked
  through `roadmaps show` and `roadmaps grep` at the indexed heads.
- Layer-level *Needs:* against the per-layer dependency lists: consistent, except as in S02.
- Policy: no pull-request number, process narrative, `lemma`, `set_option` or machine path in the README or
  the Lean file.

Wording and arrangement. Passages set beside the sources: §3.1 (LL22 lines 405–421), §3.2 (lines 424–430),
§3.7 (lines 512–531, 1102–1126), §4.1–4.3 (lines 1929–2033), §2.1–2.4 (LZ22 lines 2805–2867), §8.6 (LZ22
lines 3577–3593), §5.1, 5.3, 5.4, 5.8, 5.9 (HLSY23 lines 431–492), §7.1 and §7.6 (Zhang21 lines 1640–1717),
§8.1–8.2, 8.4, 8.7 (LTXZZ22 lines 1293–1296, 2607–2657, 1718–1726), §2.5 and §9.10 (LRZ26 lines 2622–2634),
§6.6 (RSZ21 line 688). The longest shared runs are formulas (`ker α⊂(Y×ℰ̄)[ϖ]`, `α*λ_X=λ_Y×ϖλ_ℰ̄`) and
statements of under a dozen words. No table, figure or list is taken over. LL22 has the largest share of
source mentions (44 of 269). Its contents (LL22 lines 16–39): Layer 3 draws on §§2.1 and 2.3, Layer 4 on
§2.8, §§7.3, 7.7 and 9.6 on §4.5; Layers 0–2 and 5–9 have no counterpart. Within Layer 4 the order is
forced by `*Needs:* §4.1`, `§4.2`, `§4.3`, `§4.4`.

Source independence: 17 passages compared with 7 sources, none shared beyond formulas; largest share LL22, 44 of 269 locators; contents compared with LL22: independent.

## Not verifiable

- Published page numbers of Zhang21 and LTXZZ22: the cached texts are the arXiv versions with their own
  pagination; item numbers were checked, pages were not.
- Mih19, Cho18, Wu16, Kraemer03, RZ96, RSZ20 Appendix A and LL21 (8.2): not reopened this round; their
  locators rest on the round-1 passes.
- The n=2 Krämer chart of §5.6 is the README's own computation; the final equation was checked, not the
  elimination from Kraemer03 (4.3)–(4.7) at n=2.
- Contents of supplier sections beyond the 28 read: existence and heading only.
- Elaboration of `Suggested.lean`: not run (no Lean command is permitted in this pass; the file declares
  nothing).

## Source issues

- **Error** in LZ22 at §13.4, item (3), p. 82: the source says the auxiliary global isogeny has degree the residue cardinality at v₀; it should be its square at v₀, since both source polarization factors have that degree there and the target is principal; affects nothing.
- **Gap** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is a height-zero quasi-isogeny of formal modules, with no condition on polarizations; it should require the framing polarization to pull back to a unit multiple of the object's; affects nothing.

## For the human reviewers

- **Scope.** §9.9 states that no cited text contains the comparison of Krämer completions with the filtration and that the transport is new (`packages/PELModuliPartII/README.md:1947`).
- **Scope.** The rank-two Krämer chart of §§5.6 and 7.8 is "the computation given here" (`README.md:1173`); Kraemer03 Theorem 4.5 assumes n≥3.
- **Licence.** RZ96 is read from an author-hosted scan of a Princeton University Press book (`sources.toml`, id RZ96, `licence_class = "author-page"`); LL21, LL22 and RSZ21 are author copies of published articles.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 was not compared; the cached texts are the arXiv versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f7a07804dd74ae15e38c878a8c62934e5ecbe7c3", "job": "RT-PELModuliPartII~2b", "model": "fable", "worker": "chris-x89"} -->
