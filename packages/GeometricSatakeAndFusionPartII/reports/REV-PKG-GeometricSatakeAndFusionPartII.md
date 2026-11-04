<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6386231366 -->
Review (claude) of 7896af2

Verdict: needs changes

1. **F01** (P1) The scheme-representative specification does not determine its object

   Location: `packages/GeometricSatakeAndFusionPartII/README.md` line 214 (§0.5): "a flat projective O_E-scheme M with a specified closed map M^♦→Gr_(𝒢,Spd O_E) whose generic restriction is the given flag embedding and whose image is M^v_(𝒢,μ)". The same section claims uniqueness at line 222 ("Two normal proper representatives with these specified maps are uniquely isomorphic over O_E") and gives the Check at line 227 (M=P¹_(O_F)).

   Claim: under the definition at line 214, the uniqueness property and the P¹ Check both hold.

   Witness: take the one-lattice GL₂ datum and let M′ be the blow-up of P¹_(O_F) at a closed point x of the special fibre. M′ is regular, flat and projective, with generic fibre P¹. Because π∉m_x², the divisor of π is the strict transform plus E, each with multiplicity 1, so the special fibre is reduced. M′^♦→Gr is proper, so it is a closed map, and its image is M^v. The special fibre of M′ has 2 components and that of P¹_(O_F) has 1, so M′≇P¹_(O_F). Both sources require more: SW Conjecture 21.4.1 asks for a closed immersion (SW line 7491–7492), and KPZ §3.1.7 asks for a scheme that represents M^v (KPZ line 741–743).

   Repair: at line 214, replace "closed map … whose image is M^v_(𝒢,μ)" with "closed immersion M^♦↪Gr_(𝒢,Spd O_E) inducing an isomorphism M^♦≅M^v_(𝒢,μ)". Add a negative-control Check: "the blow-up of P¹_(O_F) at a special-fibre point is normal and flat with reduced special fibre, and its diamond maps onto M^v, but that map collapses the exceptional curve, so it is not a representative." Test on the refuting instance: the map M′^♦→Gr sends all of E to the image of x, so it is not a monomorphism and M′ is excluded. P¹_(O_F) satisfies the corrected definition (SW Corollary 21.6.10, quoted at KPZ line 768–769).

2. **F02** (P2) The base roadmap assigns three topics to this roadmap; it neither owns them nor names an owner

   Location: README line 9, "The independent rational Gelfand commutativity proof is a separate continuation, not part of these layers."; line 3, which says the base roadmap's "stopping point for this continuation is the v-sheaf local model".

   Claim: the scope of this Part II is consistent with what its base roadmap delegates to it.

   Witness: `TauCetiRoadmap/GeometricSatakeAndFusion/README.md` at its open head 0652974 assigns three topics to `GeometricSatakeAndFusionPartII` by name, in Scope and ownership (lines 66–68): metaplectic Satake, Zhu's Gelfand commutativity constraint, and the rational equivalence over larger algebraically closed residue fields. Lines 1898 and 2015 send that last case to "GeometricSatakeAndFusionPartII, rational Witt comparison", and line 2017 assigns Zhu's independent construction there. None of the three appears in this README. The continuation mentioned at line 9 is not named.

   Repair: in Scope and ownership, name the owner of each of the three topics. `design/plan.json` (restructure) already names `GeometricSatakeAndFusionPartIIRationalGelfandProof` for Zhu's Gelfand proof. Metaplectic Satake and the rational Witt equivalence over larger algebraically closed residue fields need an owner named explicitly: either add them to that continuation's brief or add a layer here. Replace "a separate continuation" with that name, so the base roadmap's three citations can be repointed. A human may prefer to rename one of the two Part IIs; the README cannot settle that alone.

3. **F03** (P2) §2.1 misstates the division-algebra hypothesis of KPZ Proposition 2.2.2

   Location: README line 369: "with the KPZ Proposition 2.2.2 hypothesis excluding adjoint anisotropic division factors of p-divisible degree".

   Claim: this paraphrase is the hypothesis of Proposition 2.2.2.

   Witness: KPZ line 475–477 (p. 11) excludes every simple adjoint factor Res_(L/K)PGL_m(D) with D a division algebra of index divisible by p, for every m. Counterexample: PGL₂(D) with ind D=3 and p=3. This group is isotropic, so the README's wording admits it, but KPZ excludes it. The README wording follows the looser phrasing of KPZ Remark 3.3.26 (KPZ line 1135–1136); see Source issues.

   Repair: replace the clause with "excluding every adjoint simple factor Res_(L/K)PGL_m(D), L/K tame, m≥1, D a central division L-algebra of index divisible by p (KPZ Proposition 2.2.2, p. 11)". Test: the PGL₂(D), index 3, p=3 instance is now excluded.

4. **F04** (P2) Layer 8 states the test-function theorem below the generality its own cited source proves

   Location: README line 1001 (§8.1 "In the tame Pappas–Zhu polynomial-model range"), line 1034 (§8.3 "In the preceding tame local-model range"), line 1044 (§8.4 "Assume additionally G unramified and μ minuscule"). The Suggested.lean docstring (lines 41–43) carries the same restricted headline.

   Claim: the centrality and Bernstein characterization of the local-model test function is a tame, or unramified, theorem.

   Witness: AGLR is already in the manifest. Its Theorem 1.3 (proved as Theorem 8.4; AGLR line 141–161, with Lemma 8.2 and Theorem 8.3 at AGLR line 2948–3019, pp. 52–53) covers every connected reductive G over a finite extension of ℚ_p, every parahoric level and every μ, at all primes p. For minuscule μ it also covers the scheme model with constant coefficients, and the source notes that this includes the wildly ramified groups that PZ and Haines–Richarz exclude. The principles forbid route-specific restrictions, and adversarial item 3 says not to narrow a statement below what the sources support.

   Repair: restate §8.3–§8.4 at that generality. Use the normal model of §7.6 with the constant sheaf for minuscule μ, and the imported v-sheaf nearby cycles of IC_μ (GeometricSatakeAndFusion GS0 "Bounded admissible affine flag loci") for general μ. Characterize the central function through the Satake-parameter scalar, with locator AGLR Theorem 1.3/8.4, Lemma 8.2 and Theorem 8.3, pp. 3–5 and 52–54. Keep the PZ/KP tame and unramified forms as Checks; the GL₂ value τ=−q^(−1/2) is unchanged. Restate gap:parahoric-bernstein for the non-quasi-split case, and update the Layer 8 item of the Suggested.lean docstring.

5. **F05** (P2) §3.5 restates a reduced-special-fibre theorem that GeometricSatakeAndFusion owns

   Location: README line 525: "Its reduction is the perfectly finite-type admissible locus and specialization is surjective." The locator of §3.5 includes AGLR Theorem 6.16.

   Claim: identifying the reduction of M^v with the admissible locus is a conclusion of this roadmap's target.

   Witness: `TauCetiRoadmap/GeometricSatakeAndFusion/README.md` (head 0652974), line 948, "Bounded admissible affine flag loci": "This target owns the integral v-sheaf local models … and the identification of its reduced special fibre with A_{𝓚,μ}", citing AGLR Theorem 6.16. README line 9 of this package also says this theorem is imported.

   Repair: write the clause as an imported input ("by GeometricSatakeAndFusion GS0, 'Bounded admissible affine flag loci', the reduction is A_(𝒢,μ)"), keep only the kimberlite, richness and surjectivity conclusions as §3.5's own, and remove AGLR Theorem 6.16 from §3.5's locator.

6. **F06** (P2) gap:semisimple-trace-and-comparison asks LefschetzPencilsAndVanishingCycles for what it already provides

   Location: README line 107, the same `needs` in `design/plan.json` gaps, and the LPV contract at line 105, which cites only LPV.0, LPV.1 and LPV.6.

   Claim: the filtration-independent semisimple trace and its triangle identity are missing from the supplier.

   Witness: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md` (head 8f3e9b1), §1.10 at line 1395, already defines the semisimple trace (`VanishingCycles.semisimpleTrace`). Its theorem states independence of the admissible filtration (`semisimpleTrace_refinement`) and additivity in distinguished triangles (`semisimpleTrace_additive`). Its unipotent-block Check agrees with this package's §8.2 Check (eigenvalue a on the invariants, qa on the quotient; take a=q⁻¹).

   Repair: cite LPV §1.10 and these three names in the contract at line 105. Narrow the gap at line 107, and in plan.json, to the proper-pushforward identity and the scheme/analytic nearby-cycle comparison.

7. **F07** (P2) Several declared gaps bundle several deliverables, and two go to suppliers that exclude them

   Location: README lines 53, 61, 73, 79 and 81, with the matching `gaps` entries in `design/plan.json`.

   Claim: each gap is a single, precise contract that its supplier accepts.

   Witness:
   - gap:integral-minuscule-representations (line 61) bundles five deliverables. One of them, R-smooth full-fixer embeddings, is outside its supplier: `TauCetiRoadmap/ReductiveGroupsPartII/README.md` (head 1383569) lines 85–98 place `r-smooth-torus` and `fixer_closedImmersion_of_rSmooth` outside that roadmap. The package's own `design/plan.json` upstreamNotes says these were "assigned to a continuation rather than attributed to RG2.3".
   - gap:classical-modular-minuscule-tests (line 73) goes to RootSystemsPartII, but `packages/RootSystemsPartII/design/README.md` lines 598–600 route minuscule test sets to a proposed separate roadmap, RootSystemsPartIIMinusculeBounds.
   - gap:algebraic-loops-and-coherence (line 79) bundles eight theorems, including the coherence theorem and the chain flatness theorem.
   - gap:early-central-wakimoto (line 81) bundles six.
   - gap:trait-normality-and-tangents (line 53) bundles three unrelated results.

   Repair: split each of these into one gap per deliverable, with the same slug in the README and in plan.json `gaps`. Address each piece to a supplier whose scope admits it: for R-smooth embeddings, the continuation the RG2 note implies; for minuscule test sets, RootSystemsPartIIMinusculeBounds once it is accepted. Otherwise make the piece a target here. Name each split slug in the `*Needs:*` line that uses it.

8. **F08** (P2) Polynomial parahoric lifts are attributed to ReductiveGroupsPartII, which does not contain them

   Location: README line 11: "ReductiveGroupsPartII RG2.0a–RG2.4 owns … parahoric group schemes, polynomial integral group lifts, Lang's theorem". The `*Needs:*` line of §1.1 (line 290) cites "ReductiveGroupsPartII RG2.0a; ReductiveGroupsPartII RG2.3" for a route that imports "the specified polynomial parahoric lift". §1.3, §1.4, §2.1 and §2.5 follow the same pattern, and §5.4 (line 790) cites RG2.3 for the stabilizer jets.

   Claim: RG2 supplies group schemes over O[u].

   Witness: `TauCetiRoadmap/ReductiveGroupsPartII/README.md` (head 1383569) contains no group scheme over O[u], no Pappas–Zhu lift and no mention of Levin's construction; a search for "[u]" returns nothing. Line 63 of this package declares gap:polynomial-parahoric-lifts for exactly this object, and line 65 declares gap:translation-stabilizer-jets, but no `*Needs:*` line names either slug.

   Repair: delete "polynomial integral group lifts" from line 11. Add "ReductiveGroupsPartII polynomial-parahoric-lifts contract" to the Needs lines of §§1.1, 1.3, 1.4, 2.1, 2.2 and 2.5, and add "translation-stabilizer-jets contract" to §5.4's.

9. **F09** (P3) The FHLR reference entry and its manifest entry are wrong

   Location: README line 1088, FHLR entry: "Author preprint, Proposition 7.2.1; only the generic cover construction is used". This is the PRLSV entry copied. The FHLR entry in `sources.toml` has `locator = ""` and `cited_for = []`.

   Witness: the README cites FHLR only for Lemma 5.27, p. 34 (Layer 3 Examples), and the text is at FHLR line 1540.

   Repair: change the reference entry to "Lemma 5.27, p. 34; finite universal homeomorphism onto the image". In the manifest, set FHLR `locator = "Lemma 5.27, p. 34"` and `cited_for = ["LM.3/normalization-of-image", "LM.7/acceptable-good-embedding"]`.

10. **F10** (P3) Locators

   Location and witness:
   - 137 API and Check bullets end with the section's head locator, even where that line does not state the bullet. Example: line 129 onward, "(KPZ line 686)", attached to "For μ=0 the generic flag variety is Spec F".
   - Line 885 cites an RZ17 remark to "SW line 7820"; the remark is at RZ17 line 1115.
   - Lines 339 and 343 write "PR’s very-good integral embedding" and "PR7.2.1". The manifest key PR is Pappas–Rapoport 2006; the work meant is PRLSV.
   - Line 1011 cites "KP, §§4.7.7–4.7.8", but (4.7.7) is a display inside §4.7.4 (KP line 3722).
   - Line 951 gives "GL, Theorem 1.3, pp. 1–2"; the theorem is on p. 2 (GL line 78).

   Repair: drop the locator from Checks that are the roadmap's own computations, or give the exact line that states the bullet. Correct the four specific locators above.

11. **F11** (P3) Process residue in the README and the Lean docstring

   Location:
   - README line 15: "No new general tangent space, linear-span wrapper, scalar trace-form alias, power-series coefficient theorem or matrix-conjugation lemma is proposed as a Lean acceptance declaration. The latter two calculations are Checks."
   - README line 216: "rather than a proposition-valued model placeholder".
   - `Suggested.lean` line 16: "a scalar trace identity does not state this headline".
   - `Suggested.lean` lines 45–46.

   Witness: these sentences describe declarations that were removed from the Lean file, which is process narrative.

   Repair: delete them. The docstring keeps the list of headlines that cannot be stated.

12. **F12** (P3) The same supplier citation is appended to 19 unrelated `*Needs:*` lines

   Location: lines 166, 233, 313, 323, 335, 355, 395, 438, 448, 501, 541, 575, 585, 664, 780, 800, 867, 937 and 967 all carry "SchemeAndStackFoundations §§0.8, 0.17–0.21, 0.30, 4.6 and 4.13; ModularCurves §0G".

   Witness: §4.2 (line 585, the tangent cone of a hypersurface), §0.2 (line 166, linear algebra), §5.3 (line 780) and §7.3 (line 937) use neither a Grassmannian nor deformation theory (§4.6).

   Repair: list for each target only the sections its statement and route use.

13. **F13** (P3) §7.7 confuses "closed" with "closed immersion"

   Location: README line 975: "the map to the Grassmannian is closed exactly when the image is normal".

   Witness: every finite morphism is closed. The normalization of the cusp, Spec k[t]→Spec k[t²,t³], is closed but not a closed immersion.

   Repair: "the finite map to the Grassmannian is a closed immersion exactly when its schematic image is normal".

14. **F14** (P3) Checks that compute nothing, an imprecise Check, and undefined vocabulary

   Location and witness:
   - Line 206 (§0.4), line 252 (§0.6) and line 487 (§3.1) state formal disclaimers, not computed tests.
   - Line 830 asserts O_D/Π⊗R≅R×R. This holds only when R is an F_{p²}-algebra, since O_D/Π≅F_{p²}.
   - Line 881 uses "Drinfeld-compatible O_D quotients", which is never defined. SW p. 204 gives the actual conditions: O_D⊗R-linear quotients that are finite projective of R-rank n.

   Repair:
   - Replace the three disclaimers with computed instances. For §3.1, use the example of KPZ Remark 3.2.14 (Haines–Lourenço–Richarz) with its group and level. For §0.6, use the cusp-type finite non-immersion.
   - Add the F_{p²}-algebra hypothesis at line 830.
   - Define the Drinfeld quotient condition at line 881, or use SW's description.

Scope of this review: `packages/GeometricSatakeAndFusionPartII/README.md` (1090 lines), `Suggested.lean`, `metadata.toml`, `sources.toml`, with `design/plan.json` read for the declared gaps. There was no earlier review, so every finding below is new. Of the 14 findings, 8 are blocking (one P1 and seven P2). The rest are P3.

## Adversarial table

Every row records the values computed on both sides.

| Statement | Instances tried | Values computed (statement / instance) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: integral coroot order | PGL₂, X_*=ℤ | coroot=2; 2−0=2∈ℕ·2 so 0≤2; 1−0=1∉ℕ·2, so 0 and 1 are incomparable | holds | none |
| Conv.: apartment sign | GL₂, diag(t,t⁻¹) | cocharacter (1,−1), acts on the apartment by (−1,1) (GL line 226–227) | holds | none |
| Conv.: KZ weight convention | h=3,d=1, diag(π⁻¹,1,1) | π·g·Λ=Oe₁⊕πOe₂⊕πOe₃; mod π this is the line spanned by e₁ | holds | none |
| Conv.: Cartan sign | g=((1,0),(1,1)) | gEg⁻¹=((−1,1),(−1,1))=E−H−F; H coefficient −1≠0 in every characteristic | holds | none |
| Conv.: IC/trace dictionary | d=0,1 | (φ,τ)=(1,1); d=1: τ=(−1)q^(−1/2)=−1/3 at q=9 | holds | none |
| Conv.: Grassmannian rank | `Module.Grassmannian R M n` | quotient rank n (Mathlib RingTheory/Grassmannian.lean:63–66); subspace d ⇒ n=h−d | holds | none |
| 0.1 local model datum | GL₂ (1,0); μ=0; (2,0) | E=F, P¹; Spec F; ⟨(2,0),α⟩=2>1, so not minuscule | holds | none |
| 0.2 Hodge representation | m=0,1,2; (2,0) | m=2,h=2,d=1 gives ranks (4,2); m=0 gives V=0 with kernel GL₂, not faithful; weights (2,0)≁(1,0) | holds | none |
| 0.3 quasi-tame / (NE) | Res_(K/F)GL_n, K/F wild; PGL_m(D), ind D=p | quasi-tame (H splits over K); excluded by (NE) | holds | none |
| 0.4 imported M^v | μ=0; GL₂ (1,0) | closure of a point is Spd O_E; generic fibre (P¹_E)^♦ | holds | none |
| 0.5 scheme representative | blow-up of P¹_(O_F) at a special point | regular, flat, reduced special fibre P̃¹+E; closed map onto M^v; ≇P¹ (2 components vs 1) | **fails** (uniqueness) | R01 |
| 0.6 good embedding | identity GL_h; two-term GL₂ chain | identity closed immersion; total target Gr(2,4), ranks (rh,rd)=(4,2) | holds | none |
| 1.1 polynomial BD functor | GL₁, P=u−π; G_a; P=1 | t^m; G_a(k((t)))/G_a(k[[t]])=t⁻¹k[t⁻¹] with a↦at⁻¹ unbounded, so not ind-proper; P=1 gives one point | holds | none |
| 1.2 schematic closure | GL₂ (1,0); μ=0 | P¹_(O_F); Spec O_E | holds | none |
| 1.3 normality | GL₂ Iwahori | special fibre bc=0, two smooth components; k[b,c]/(bc) is not a domain, so the fibre is not normal; component normality only | holds at stated scope | none |
| 1.4 adjoint comparison | GL₂→PGL₂, (1,0) | π₁(SL₂)=1; both models P¹_(O_F), so ad_* is an isomorphism | holds | none |
| 1.5 Hodge cover | type D, p>2 | derived kernel ⊂μ₂, order 2, prime to p (KPZ line 864–877) | holds | locator R10 |
| 1.6 GL representative | h=3,d=1 | lines: P² (dim 2); SW kernels of rank 2: dual P², dim 2 | holds | none |
| 2.1 split-form embedding | PGL₂(D), ind 3, p=3 | KPZ Prop 2.2.2 excludes it; README wording ("anisotropic") admits it | **fails** (hypothesis) | R03 |
| 2.2 Weyl lattices | V=V(λ)^⊕2 | stable lattices Λ, gΛ with g in the centralizer GL₂ (KPZ Lemma 3.3.10, line 977) | holds | none |
| 2.3 restriction of structure | [K:F]=2, n=2 | O_F-rank 4; embedding ranks (1,1), total 2=e·r | holds | none |
| 2.4 power embedding | π₁(G)_I torsion-free | 𝒢′=𝒢=𝒢° (KPZ Remark 3.3.26, line 1133–1134) | holds | none |
| 2.5 tame symplectic chain | quaternion centralizer | original dim 4, split irreducible dim 2, needs m_j=2 copies | holds | none |
| 2.6 GL chain model | Λ₁=Oe₁⊕πOe₂ | both conditions reduce to πad−bc=0; special fibre bc=0, meeting at ([1:0],[0:1]) | holds | none |
| 2.7 total embedding | two rank-1 summands in rank 2; polarized r=1,a=0 and r=2,a=1 | image P¹×P¹⊂Gr(2,4); Λ₀⊕0 has ranks (2,0), excluded; term counts 2r−1+a = 1 and 4 | holds | none |
| 2.8 trace form | K=F, r=1; F_p(t^(1/p))/F_p(t); multipliers 1,2; r=0 | Ψ(e₁,e₂)=1; inseparable trace ≡0 gives a degenerate form; no common F-multiplier; zero space is nondegenerate | holds | none |
| 3.1 canonical model | GL₂ line × factor with μ=0 | dimension stays 1 | holds | R14 (Check 3) |
| 3.2 normalization of image | cusp k[t²,t³]⊂k[t] | finite, birational, a universal homeomorphism; t∉k[t²,t³], so not an isomorphism | holds | none |
| 3.3 descent cutout | tame K̃/K, e>1 | Γ-commutation alone lacks the O_K̃-linearity equations (KPZ line 1257–1262) | holds | none |
| 3.4 Witt/companion | GL₂ hyperspecial (1,0) | companion fibre P¹_k; perfection = perfection of P¹ = Witt locus | holds | none |
| 3.5 kimberlites | GL₂ (2,0) | reduction = A_((2,0)), surjective specialization | holds, duplicates GS0 | R05 |
| 3.6 weak normal | GL₂ (1,0); AGLR Thm 7.22 | M^wn=P¹_(O_F); "any parahoric" matches AGLR line 2774–2779 | holds | none |
| 4.1 curve span | A¹ at 0; k[ε]/ε²; xy=0 | span k; f²=0 in k[[a]] ⇒ f=0, span 0 against T of dim 1; on xy=0 one coordinate vanishes, so (1,1) is not a derivative but the span is k² | holds | none |
| 4.2 tangent cone | x²+xyz | f(f+gh)=0 ⇒ a-coefficient of f is 0; dim T=3, span dim 2; cone x²=0, reduced plane x=0 | holds | none |
| 4.3 big-cell tangent | SL₂, λ=0 | t⁻¹k[t⁻¹]X_(±α) ⊕ t⁻¹k[t⁻¹]H | holds | none |
| 4.4 test sets | B₃, μ=re₁; B₃ (2,1,1); C_n | ⟨μ−ν,ω₃⟩=(r−Σν)/2≥0 ⟺ ν≤μ; (2,1,1), ν=(2,2,0): test 0 but partial sum −1, so no S exists (README restriction is correct, KPZ line 1572–1574); C_n: ν₁≤r/2 ⟺ ν≤μ | holds | none |
| 4.5 root curves | SL₂, λ=0, μ=α∨ | k_α=1 (2α∨≰α∨); derivative t⁻¹X_α | holds | none |
| 4.6 FM bound | λ=μ; μ=0 | t^μ meets both bounds with equality; μ=0 forces the standard lattice | holds | none |
| 4.7 root equality | SL₂, μ=α∨, λ=0 | j_α=⟨μ,ω⟩−⟨λ,ω′⟩=1=k_α | holds | none |
| 4.8 Cartan curves | SL₂, μ=α∨; μ=0 | C^cur=t⁻¹kH; 0 | holds | none |
| 4.9 Cartan equality | D^H, m=1 | −2m≡1 (mod 3), ≡0 (mod 2), so p≠2 is needed | holds | none |
| 4.10 curve spanning | S_(α∨) for SL₂ at e | tangent dim 3 (quadric cone of dim 2), spanned by 3 curve directions | holds | none |
| 4.11 Weil-restriction fibre | two embeddings, each (1,0) | μ̄=(2,0), not minuscule | holds | none |
| 5.1 orbit step | D₄ triality, λ=2ρ, μ=λ+θ | α₁+α₂ gives values (3,3,1,1), dominant; orbit sum has α₂-coefficient 3>2; θ works | holds | none |
| 5.2 rank-one curves | standard, nonstandard SU₃; F₃, F₂ | standard: d+τ(d)=0; nonstandard: a²−a²/2−a²/2=0; F₃, a=1: 1+1+1≡0; F₂: 2 not invertible | holds | none |
| 5.3 rank-one closedness | PU₃ image, p=3 | π₁=ℤ/3; p∤\|π₁(G^der)\| forces trivial kernel; PR Remark 6.3, (1+at⁻¹)∉L⁺ (PR line 931–942) | holds | none |
| 5.4 rational lift | GL₂, λ=(1,0) | det t^λ=t, not a unit, so t^λ∉GL₂(k[[t]]); only g is integral | holds | Needs R08 |
| 5.5 same-field curve | SL₂, λ=0, μ=α∨, F₃ | a↦x₋(t⁻¹a), value 1 at a=0, higher orbit on G_m | holds | none |
| 6.1 chains | B=Q_p; B=D quaternion | rank h; O_D/Π=F_(p²), split R×R only over F_(p²)-algebras | holds with hypothesis | R14 |
| 6.2 torsors | ramified unitary | full fixer has 2 components (SW p. 206) | holds | none |
| 6.3 naive model | single lattice, h=3, d=1 | rank-1 quotient Grassmannian P², kernel rank 2 | holds | none |
| 6.4 de Rham kernel | quotient onto e₁ | kernel ξe₁⊕e₂⊕e₃, determinant ξ | holds | none |
| 6.5 Drinfeld EL | n=2, F=ℚ_p | M_Dr: O_D⊗R quotients of R-rank 2; geometric generic fibre P¹ (RZ17 Lemma 5.1, line 1014–1015) | holds | vocabulary R14 |
| 6.6 unitary Drinfeld | distinguished signature (1,1) | GL₂ weights (1,0) at each conjugate embedding give P¹; central (1,1) gives a point | holds | none |
| 7.1 tube components | μ=0; GL₂ smooth point | 1 component = dim H^(−d)=1 | holds | none |
| 7.2 two maximal translations | line meets sphere | at most 2 intersection points | holds | none |
| 7.3 S₂ | Iwahori GL₂ node | reduced curve: depth 1 = min(2, dim 1) | holds | none |
| 7.4 Wakimoto stalks | codim 1, node xy=π | H^(−d)=F_ℓ, annular tube connected | holds | none |
| 7.5 connected tubes | zero bound; GL₂ line | point; open disc | holds | none |
| 7.6 normal minuscule | GL₂ (1,0); p=2 wild unitary | P¹_(O_F) normal; GL Corollary 1.4 (line 81–83) has no restriction on p | holds | none |
| 7.7 good embeddings | cusp | finite universal homeomorphism, not a closed immersion; "closed" is wrong wording | holds | R13 |
| 7.8 lattice test | GL₃, g=diag(π⁻¹,1,1) and diag(π⁻²,1,1) | first lies in Gr (line e₁); second: π·g·Λ⊄Λ, not a point and not admissible | holds | none |
| 8.1 monodromy | very special; GL₂ node | inertia trivial (PZ Prop 9.12, line 3049); unipotent at the node | holds | generality R04 |
| 8.2 trace function | μ=0; GL₂ hyperspecial; unipotent block, q=9 | 1_(P′); φ=1, τ=−q^(−1/2); 10/9 against raw 1/9 | holds | gap R06 |
| 8.3 centrality | μ=0; AGLR Lemma 8.2 | e_(P′) is central; AGLR proves centrality for every G and parahoric | holds, narrower than source | R04 |
| 8.4 Bernstein | GL₂ (1,0), q=9; AGLR Thm 1.3 | z ↦ (1/3)·1_(KμK), q^(1/2)z ↦ 1_(KμK); PZ 9.d.3(a) prints +exponent (misprint); AGLR covers all G | holds, narrower than source | R04 |
| Worked: two-lattice model | as stated | πad−bc=0; chart a=d=1 gives bc=π, tangent dim 2 mod π | holds | none |
| Worked: curve obstruction | as stated | dims 3/2 | holds | none |
| Worked: D₄ orbit sums | as stated | coefficient (1,3,1,1) against θ=(1,2,1,1) | holds | none |
| Worked: trace | q=9 | eigenvalue 1/3, trace −1/3; +1/2 exponent gives −3 | holds | none |

## Verified sound

**Sample.** All 15 seeded targets were checked at their locators in the cached texts: §§0.5, 1.1, 2.1, 2.4, 2.7, 3.2, 4.2, 5.2, 5.3, 5.4, 6.5, 7.8, 8.2, 8.3 and 8.4. Thirteen match on theorem number, page and hypotheses. §0.5 fails (R01) and §2.1 fails (R03). No locator was flagged unverified by the author.

| Target | Locators read | Outcome |
| --- | --- | --- |
| 0.5 | SW Conj. 21.4.1 / Rem. 21.4.2, p. 195 (SW line 7488–7499); AGLR Thm 7.22, p. 49, and Lemma 7.27, p. 51 (AGLR line 2776, 2863) | R01 |
| 1.1 | KPZ §§3.2.2–3.2.5, p. 18 (line 793–830); LEV Def. 4.1.1 / Prop. 4.1.4, p. 20, and Thm 4.2.10, p. 28 (LEV line 791, 808, 1194); KP §2.1.1, p. 150 (line 1235) | match |
| 2.1 | KPZ §§3.3.1–3.3.7, pp. 20–21 (line 900–954); Prop. 2.2.2 (line 475) | R03 |
| 2.4 | KPZ Thm 3.3.25 / Rem. 3.3.26, p. 26 (line 1125–1137) | match |
| 2.7 | KP §2.3.15 / Cor. 2.3.16, p. 162 (line 1755–1771); KPZ Lemma 2.3.1, p. 12 (line 562); chain variant, p. 29 (line 1241–1255) | match |
| 3.2 | KPZ §3.1.9 and (3.1.10), p. 17 (line 761–778) | match |
| 4.2 | KPZ Remark 4.1.5, p. 31 (line 1350–1361) | match; the README correctly fixes the source's "normal" |
| 5.2 | KZ proof of Prop. 5.2.3, Cases 1–3, pp. 50–52 (line 2232–2316) | match |
| 5.3 | KZ p. 50 (line 2207–2217); PR §6.a.1, pp. 24–25 (line 916–957) | match; the README correctly adds p∤\|π₁\| |
| 5.4 | KZ Lemma 5.2.5, p. 52 (line 2317–2329) | match; the README fixes the misprint |
| 6.5 | SW §21.7, Thm 21.7.1, pp. 203–204 (line 7786–7838); RZ17 §5, pp. 18–20 (line 1003–1121) | match |
| 7.8 | KZ Prop. 3.1.14, p. 21 (line 943–956) | match |
| 8.2 | PZ §9.d.1–9.d.2, pp. 74–75 (line 3063–3100); KP §4.7.4/(4.7.7)–§4.7.8, pp. 212–213 (line 3703–3747) | match (locator note in R10) |
| 8.3 | PZ Thm 9.5, p. 70 (line 2882), and Thm 9.14, p. 75 (line 3100); KP §4.7.8 | match |
| 8.4 | PZ Prop. 9.15 / Thm 9.16, pp. 75–76 (line 3115–3142); KP §4.7.9 / Thm 4.7.11, pp. 214–215 (line 3750–3790) | match (sign convention consistent with KP 4.7.11) |

**Further locators checked outside the sample.** KPZ §§3.1.2–3.1.7 and 3.2.6–3.2.15, Prop. 3.2.11, §2.1.4 (R-smoothness, line 440–448), and Def. 4.1.2, Prop. 4.2.13 and the Thm 4.2.3 type cases (line 1552–1687). KZ §3.1.1–3.1.12 (line 811–936). SW §21.8 (line 7839–7918). GL Lemma 1.2, Thm 1.3, Cor. 1.4, Thm 4.7, Lemma 5.1 and §3 (line 61–88, 220–227, 401–421). FHLR Lemma 5.27 (line 1540–1555). AGLR §8 (line 2871–3040).

**Lean.** The command `lake env lean` was run on `Suggested.lean` with an absolute path, from the content checkout at Mathlib 6b7abb3 and Tau Ceti a91d3aa. It exited 0 with no messages in 3.5 s; the file has no declarations, so there are no `sorry` warnings either. The file has only `import Mathlib`, no `set_option`, one module docstring, and a namespace. The `#check @name` binder audit is empty because the file declares nothing, so there were no elaborated types to compare with the README. The one-tactic padding probe does not apply, and there is no padding.

**Headlines.** The README's headlines are §§1.3–1.4, 1.5, 2.1–2.7, 3.1–3.3, 3.6, 4.7–4.9, 4.10–4.11, 5.5, 6.2–6.4, 6.5, 6.6, 7.5, 7.6, 7.7–7.8 and 8.1–8.4. Each is named in the docstring with the carrier it lacks. I confirmed at the pins that the carriers are absent: there are zero hits for affine Grassmannian, loop group, parahoric, Bruhat–Tits, nearby cycle or weakly normal in Mathlib and Tau Ceti. The Tau Ceti "Diamond" hits are modular diamond operators, and its "Grassmannian" hits are Lagrangian Grassmannians. No headline is statable at the pins, so the empty acceptance file is correct.

**Library declarations opened at the pins.** All are as cited:
- `Submodule.span`, Mathlib/LinearAlgebra/Span/Defs.lean:46
- `Algebra.trace`, Mathlib/RingTheory/Trace/Defs.lean:70
- `Module.Grassmannian`, Mathlib/RingTheory/Grassmannian.lean:66 (quotient rank)
- `traceForm_nondegenerate`, Mathlib/RingTheory/Trace/Basic.lean:501 (requires `FiniteDimensional` and `Algebra.IsSeparable`)
- `AlgebraicGeometry.Scheme`, Mathlib/AlgebraicGeometry/Scheme.lean:40
- `TauCeti.AlgebraicGeometry.ZariskiTangentSpace`, TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65 (dual of the cotangent space over the residue field)
- `Derivation.adjointWeightSpace`, TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100

Mathlib has no theorem that the trace of a nondegenerate K-form is nondegenerate over F, so §2.8 is not a duplicate.

**Cross-roadmap citations resolved.** All exist where cited, except as noted in R02, R05, R06 and R08:
- GeometricSatakeAndFusion (head 0652974): GS0 targets "Generic Schubert bounds" (line 343), "Integral parahoric ind-properness" (842), "Bounded admissible affine flag loci" (946) and "Relative-position flag correspondences" (970); GS2 (line 1340); GS4 (1762).
- ReductiveGroupsPartII (head 1383569): RG2.0a.1–2, RG2.1.2–5, RG2.2.2–4, RG2.3.3–5 and 7, RG2.4.1–3.
- SmoothRepresentationsOfLocalGroups (head 1383569): SR.1, SR.3.2, SR.4.1.
- LefschetzPencilsAndVanishingCycles (head 8f3e9b1): §§0.1–0.8, LPV.1, §§6.1–6.2.
- PELModuli (head e6a4fe8): M0.
- EtaleDualityAndPerverseSheaves (head 34e0692): §§2.1–2.3, 2.6–2.10, Layer 5.
- On main (eafdde4): ModularCurves §0G and SchemeAndStackFoundations §§0.8, 0.17–0.21, 0.30, 1.1, 4.6–4.14.
- Board package designs: RootSystemsPartII §RS2.4 (`invariant-step`, `ambient-coroot-export`; `packages/RootSystemsPartII/design/README.md` lines 472 and 501), and DiamondsAndVStacksPartII D10.8–D10.15 and D11.1–D11.20 (design README lines 1150–1790).

The two leads in the worker's citations file are both false positives: RootSystemsPartII and DiamondsAndVStacksPartII exist as board designs and appear in the merge order.

**Supplier order.** All suppliers come before this roadmap (merge-order position 290): SchemeAndStackFoundations 2, ReductiveGroupsPartII 25, RootSystemsPartII 26, SmoothRepresentationsOfLocalGroups 27, LefschetzPencilsAndVanishingCycles 63, EtaleDualityAndPerverseSheaves 122, PELModuli 132, GeometricSatakeAndFusion 150, DiamondsAndVStacksPartII 152; ModularCurves is on main. Dependency check output:

    depcheck: 34 roadmaps, 312 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

**Ownership against open work.** I searched the open roadmap pull-request index and main, by object, for: local models, Scholze–Weinstein, kimberlites, tubes, unibranch, test function, Bernstein centre, semisimple trace and the Kottwitz conjecture. Apart from GS0 (R05) and LPV §1.10 (R06), no other roadmap owns these objects. Two board packages were read at their heads:
- PELModuliPartII (design, d4bb48d) covers unitary Rapoport–Zink and Krämer models only, with no lattice-chain EL/PEL local models, so it does not overlap Layer 6.
- ShimuraVarietiesPartII (design, 57dc0a4) is a consumer: its SV2.6 "same-field-curves" imports a "same-field root-curve contract" that this roadmap's §5.5 owns. That package should cite this one; this is not a defect here.

**Gaps.** All 13 slugs appear in the README and in plan.json `gaps` with a named supplier. None has supplier `none`. Findings on gaps: R06, R07 and R08.

**Shape.** The section order matches the upstream shape. Every layer ends with Examples and Dependencies. All 19 definitions or constructions have at least three Checks, but see R14. There is no LaTeX, no `lemma`, no pull-request number, no source passage over 40 words and no computational algorithm.

**Sources manifest.** All 15 keys are certified, with a legal origin and sha256. FHLR is defective (R09). The manifest keeps author and preprint numbering distinct, with crosswalk notes for LEV 4.2.10/4.2.11 and PZ §9/§10.

## Not verifiable

- KZ: only the cited author version (l-indep v2) was read; the published wording was not collated. The README cites that version explicitly.
- §§4.7–4.9 type-D Cartan coefficient tests: the RootSystemsPartII design (lines 598–603) flags a possible source issue in KPZ, "the missing D end-weight family for α_j with j≤n−4". This is outside the sample and I did not re-derive it, so no finding is raised. It should be checked when gap:classical-modular-minuscule-tests is split (R07).
- No sampled text was unreadable. No new source was fetched, so `sources.toml` was not changed.

## Source issues

- **Error** in KPZ at Remark 4.1.5(2), p. 31: the source says the surface x²+xyz=0 is normal; it should be reducible (x(x+yz)), with two components meeting at the origin, so not normal; affects nothing.
- **Misprint** in KPZ at Remark 4.1.5(2), p. 31: the source says the coordinate ring has variables x, y, x; it should be x, y, z; affects nothing.
- **Misprint** in KPZ at Remark 3.3.26, p. 26: the source says only anisotropic factors from division algebras of p-divisible degree are excluded; it should be every factor Res PGL_m(D) with p dividing ind D, as in Proposition 2.2.2; affects a stated result.
- **Misprint** in KPZ at Definition 3.4.4, chain variant, p. 29: the source says the determining segment starts at p·Λ₀; it should be π_F·Λ₀, as in §2.3, p. 12; affects nothing.
- **Misprint** in KPZ at proof of Theorem 4.2.3, type Bₙ, p. 37: the source says the i-th fundamental weight is a sum of i copies of e_i; it should be e₁+⋯+e_i; affects nothing.
- **Misprint** in KP at §2.3.15, p. 162: the source says the target Grassmannian classifies subbundles of rank dim V′; it should be rank dim V′/2; affects nothing.
- **Gap** in KZ at proof of Proposition 5.2.3, pp. 49–50: the source says individual bounds on the Frobenius translates of a root step give a bound on their orbit sum; it should choose the orbit existentially, since D₄ triality gives coefficient 3 against 2; affects the proof.
- **Misprint** in KZ at proof of Proposition 5.2.3, Case (3), p. 52: the source says the upper unipotent is u₊(−2x⁻¹, 2x⁻²), which violates the root relation (sum 8x⁻²); it should be u₊(−2x⁻¹, −2x⁻²), whose inverse is the displayed matrix; affects nothing.
- **Misprint** in KZ at Lemma 5.2.5, p. 52: the source says the translation lift lies in G(F_q[[t]]); it should lie in G(F_q((t))), with only the conjugator integral; affects a stated result.
- **Gap** in KZ at Lemma 3.1.10, p. 20: the source says FHLR Lemma 5.27 gives a closed immersion of local models; it should say that FHLR (p. 34) gives only a finite map that is a universal homeomorphism onto its image; affects a stated result.
- **Misprint** in SW at §21.8, p. 206: the source says the GL₂ components are (1,1) over the distinguished place and (0,0) or (2,2) elsewhere; it should give signature values, with actual weights (1,0) at the distinguished conjugate embeddings; affects nothing.
- **Misprint** in PZ at §9.d.3(a), p. 76: the source says the minuscule IC trace has the factor q^((ρ,μ)); it should be q^(−(ρ,μ)), by (9.9) and geometric Frobenius; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7896af2", "job": "REV-PKG-GeometricSatakeAndFusionPartII", "model": "opus", "worker": "fable-rev63"} -->
