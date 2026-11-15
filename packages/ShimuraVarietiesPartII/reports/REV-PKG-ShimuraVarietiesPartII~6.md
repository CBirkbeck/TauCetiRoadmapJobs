<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6895913398 -->
Review (claude) of aecebde

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §0.5 uses the p-adic comparison of absolute Hodge tensors, which no named supplier provides

   **Location.** `packages/ShimuraVarietiesPartII/README.md:285–287`: “Apply crystalline–de Rham compatibility for absolute Hodge cycles and uniqueness of parallel sections on the rigid generic fibre.” *Needs:* §0.4; AbelianSchemesAndArithmeticModuli §A4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2; CrystallineCohomology §CR.7.3 (gap).

   **Claim.** The inputs of the route are all supplied by the listed sections.

   **Witness.** HT line 800–802 uses (1.3.4.2) (HT line 751–757, the Blasius–Wintenberger theorem). AutomorphicBundles §3.7 at its head: “The comparison does not add crystalline or `B_dR` assertions.” ShimuraVarieties §7.0i is over ℂ only. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII declares exactly this as `gap:integral-hodge-realization-extension` of ShimuraVarieties.

   **Exact repair.** Declare the same contract here; nothing else changes.

   1. Under `### From TauCetiRoadmap.ShimuraVarieties` add: “§7.0i (absolute Hodge tensors on abelian varieties and their family form). What ShimuraVarieties must provide (gap:absolute-hodge-padic-comparison): §7.0i, p-adic realization (new target). For a complete mixed-characteristic discrete valuation ring O_K with perfect residue field and an abelian scheme A over O_K, prove that the p-adic étale and de Rham realizations of an absolute Hodge tensor of A_K correspond under the de Rham comparison `B_dR⊗H¹_ét(A_K̄,Q_p)≅B_dR⊗_K H¹_dR(A_K/K)`, with mixed tensors, duals and Tate twists (HT (1.3.4.2), p.17). This is the statement FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII asks of §7.0i.”
   2. §0.5 *Needs:* append “ShimuraVarieties §7.0i (gap:absolute-hodge-padic-comparison)”; add the same item to the Layer 0 `### Dependencies` line.
   3. Add the slug to the top-level `gaps` list of `design/plan.json` (supplier `ShimuraVarieties`, section `§7.0i`, the `needs` sentence above).

   **Repair test.** In HT's proof a lift s over O_(L″) has good reduction (HT Lemma 1.3.6, HT line 764), O_(L″) is complete with perfect residue field, so the contract applies to A_s and gives exactly the step at HT line 800. §1.1 and §4.2 reach the same input through §0.5 and FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4 and need no further change; §0.6 uses `D_cris(ξ*s)` from its own gap and does not need it. The dependency direction stays downward (ShimuraVarieties is already a supplier).

2. **F02** (P2) §1.9 asserts normal irreducible components of the Hodge special fibre; the sources prove the strictly local form

   **Location.** `README.md:447`: “In the corrected Hodge setup, reducedness and normality of geometric irreducible components of the local-model special fibre transfer to the Hodge model.”

   **Claim.** With a possibly disconnected full fixer G^fix, every geometric irreducible component of the special fibre of S is normal.

   **Witness.** KP Corollary 0.3, p.124 (KP line 130–132): reduced special fibre, and normal irreducible components of the *strict henselizations* of the local rings. KPZ Theorem 7.2.21(2) (KPZ line 3749) is étale-local. A component with two étale branches through one point (the nodal-cubic shape) satisfies the source statement and fails the README's. I did not construct such a Shimura example; the sources simply do not prove the global form, and neither cited locator (KZ Theorem 4.4.4, KPZ Theorem 7.2.21(2)) states it.

   **Exact repair.** Replace the first sentence of the theorem by: “In the corrected Hodge setup the special fibre of the Hodge model is reduced, and at every geometric point the irreducible components of the strict henselization of its local ring are normal; both properties are transferred from the local model through the diagram of §1.4. When G^fix=G° the closure of each Kottwitz–Rapoport stratum is normal, so the irreducible components of the geometric special fibre are normal.” Extend the locator to “(KP, Corollary 0.3, p.124; KZ, Theorem 4.4.4, p.43; KPZ Theorem 7.2.21(2), pp.84–85)”, and add “Corollary 0.3” to the KP `locator` and “§1.9” to its `cited_for` in `sources.toml`.

   **Repair test.** Nodal control: the strict henselization at the node has two regular branches, so the repaired first sentence holds where the original fails. Connected case: π⁻¹(closure of a KR stratum)=q⁻¹(Schubert variety) is smooth over a normal scheme, hence normal, and normality descends along the smooth surjection π; normal implies its irreducible components are disjoint. The very-special sentence (integral local-model fibre, locally integral Shimura fibre) and the Γ₀(p) Example (k[[u,v]]/(uv): two regular branches, not integral) are unchanged and consistent. No consumer (§§4.7, 5.7, 6.1) uses the global form.

3. **F03** (P3) §4.8 leaves `Aut(A_x)` ambiguous, and its third Check is false in the sense §4.11 uses

   **Location.** `README.md:936`: “Integral automorphisms are I_x(Q)∩Aut(A_x).” `README.md:954`: “A rational quasi-isogeny with a nonintegral denominator is in I_x(Q) when it preserves the tensors, but need not lie in Aut(A_x).” Compare `README.md:1000`: “A_x up to prime-to-p isogeny … I_x(Z_(p))=I_x(Q)∩Aut(A_x)”.

   **Witness.** HT line 982–984 takes automorphisms in the prime-to-p isogeny category. At p=5 the scalar 1/2 has a nonintegral denominator and lies in (End(A_x)⊗Z_(5))^×, hence in I_x(Z_(5)); the scalar 1/5 does not.

   **Exact repair.** Line 936: “Write I_x(Z_(p))=I_x(Q)∩Aut(A_x), where A_x is taken up to prime-to-p isogeny, so that Aut(A_x)=(End(A_x)⊗Z_(p))^×.” Line 954: “The scalar p⁻¹ lies in I_x(Q) (scalars fix the tensors) and not in I_x(Z_(p)); a scalar ℓ⁻¹ with ℓ≠p lies in I_x(Z_(p)). Reading Aut(A_x) as the automorphism group of the abelian variety itself would exclude ℓ⁻¹ and change the quotient I_x(Z_(p))\G(A_f^p) of §4.11.”

   **Repair test.** p=5: 1/2∈Z_(5)^× gives membership; 5 is not a unit of End(A_x)⊗Z_(5) (its degree 5^(2g) is not prime to 5), so 1/5 is excluded. §4.11's Remark (−1∈I_x(Z_(p))) is unaffected.

4. **F04** (P3) §7.5 locator omits the place where algebraicity is proved

   **Location.** `README.md:1330–1332`: “Algebraicity of each local quotient point follows from the faithful abelian characteristic polynomial and the finite map of conjugacy quotients” with locator “(KZ, Proof of Theorem 5.1.4, §5.3.6, p.55)”.

   **Witness.** That argument is KZ §5.3.2, p.53 (KZ line 2370–2374); §5.3.6 (KZ line 2428–2439) contains only the equality via Steinberg and the descent to Q.

   **Exact repair.** Locator: “(KZ, §5.3.2, p.53, for algebraicity; proof of Theorem 5.1.4, §5.3.6, p.55, for equality)”. No manifest change (KZ already records §§3–5 and “§§7.1–7.6”).

Four findings: one P1, one P2, two P3. Both findings of the previous round are repaired. The four authored files were not changed by this review; `sources.toml` gained no entry (no new text was fetched).

## Previous findings, verified first

| Finding (round 5) | Repaired passage | Status |
|---|---|---|
| F01 (P1), norm Check reversed the dual convention | `packages/ShimuraVarietiesPartII/README.md:37`: “In the dual frame F_D=ρ∨(δ)σ=ζ⁻¹σ, so the crystalline linear F₂₅-Frobenius is F_D²=ρ∨(ζ⁶)=ζ⁻⁶=ζ¹⁸ … the standard norm ζ⁶ realizes γ_x=π_x⁻¹ on V” | **Repaired.** Recomputed mod 24: group norm 1+5=6; dual −1−5=−6≡18; quotient ζ¹²=−1. Agrees with line 29 (F_D=ρ∨(δ)σ) and with the §4.9 Check at line 977 after δ_D=ζ⁻¹ (crystalline ζ⁻⁶, standard ζ⁶). |
| F02 (P3), GL₀ in the π₁ Check | `README.md:978`: “For GL_n with n≥1 and GSp_(2g) with g≥1, π₁ is Z … For GL₀=1 the cocharacter and coroot lattices are both 0, so π₁=0” | **Repaired.** n=0: 0/0-lattice quotient 0, H¹=1; n≥1: Zⁿ/(sum-zero)=Z, torsion 0. Matches PadicHodgeTheory §5.5 at its head (“`GL_0` is interpreted as the trivial group”). |

Pattern search on the repaired passages. The repair also changed `README.md:831` (§4.1 Check: slopes {0,1} on D, {0,−1} for b_x in the standard representation) and `README.md:591` (GSp_(2g), g≥1). Both recomputed: μ_h on H₁ has weights (z,1), so μ_h⁻¹ has exponents (−1,0), b_x slopes (−1,0), D slopes (1,0); Z^c of GSp_(2g), g≥1, is Z(Sp_(2g))=μ₂, order 2, dimension 0. The other δ/δ_D passages (lines 29, 38, 960, 970–982) are consistent with the convention: δ_D=[[0,−1],[5,0]] has δ_D²=−5·1, (δ_D⁻ᵀ)²=−1/5. No finding of the last repair report was marked not actionable; nothing is re-raised.

## Verified sound

**Coverage.** Read the whole README (1384 lines): 63 numbered targets in 8 layers, 71 *Needs:* lines, 26 Definition/Construction sections each with an API and at least three Checks (mechanically counted; 27 Checks blocks with Conventions), every theorem with a locator, every layer with Examples and Dependencies. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` read.

**Principles.** No route-specific shortcut (ramified primes, exceptional type A and D^H kept in §§2.4–2.5, 3.8; KPZ line 3735 has that breadth), no re-planned roadmap, no algorithm, no sorry'd data, no `set_option`. Process-residue grep (pull-request numbers, round labels, paths, HTML anchors, LaTeX delimiters, “optional/deferred/removed”, `lemma` as a keyword): 0 hits; the 20 hits of “Lemma” are source locators.

**Seeded source sample: 15 of 15 read at their locators** (no locator is flagged unverified by the author).

| Target | Locator as read | Result |
|---|---|---|
| 0.3 | HT §§2.1.1–2.1.2, p.21 (HT line 940–968); KZ §4.1.5, pp.29–30 (KZ line 1283–1303) | finite étale transitions, G(A_f^p)-action, normality extends sections: supported |
| 1.8 | KPZ Theorem 7.1.3(1), p.73 (KPZ line 3196); HT Lemma 1.3.6, p.17 (HT line 764) | supported; README states it without (A)–(C), which the Néron–Ogg–Shafarevich proof (KPZ line 3215) does not use |
| 1.9 | KZ Theorem 4.4.4, p.43 (KZ line 1887–1896); KPZ Theorem 7.2.21(2), p.85 | very-special part supported; first sentence is R02 |
| 2.1 | KZ Definition 4.2.2, p.34 (KZ line 1481–1490) | three conditions and very-special triple: exact |
| 2.6 | KZ Proposition 4.2.3, Lemma 4.2.4, pp.34–35 (KZ line 1491–1523) | supported; “torsion-free” correctly replaces the misprint at KZ line 1503 |
| 3.1 | KP §4.5.6, §§4.6.1–4.6.4, pp.195–199 (KP line 2982–3010, 3126–3158) | star product, closures in G(A_f^p), tilde groups: exact; (E) covers KP's “Z_G connected” |
| 3.3 | KPZ Proposition 7.1.11, p.75 (KPZ line 3294); KP Proposition 4.3.7, pp.190–191 (KP line 2805) | étale, splits over an unramified extension: supported under (A)–(D) |
| 3.4 | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197 (KP line 2954–3046) | twist by the central torsor, level γK^pγ⁻¹ (KP line 2980): supported |
| 3.10 | KZ Theorem 4.2.6(3), Remark 4.2.7(2), pp.35–36; KPZ Proposition 7.1.14(3), pp.75–76 | supported |
| 4.1 | HT §1.3.8, p.18 (HT line 808–815); KZ §4.4.2, p.43 (KZ line 1875–1879) | frame, b up to σ-conjugacy, bound {μ_h⁻¹}: supported |
| 5.3 | KZ Lemma 4.3.8, pp.40–41 (KZ line 1782–1800); proof of Theorem 4.4.6, pp.45–46 (KZ line 2005–2007) | supported |
| 5.7 | KPZ Corollary 5.3.16, p.60 (KPZ line 2632); KZ Remark 4.1.13, p.33 | supported; KZ only says “it is possible to show”, and the README names its own inputs (GeometricSatakeAndFusionPartII §3.7, BunGAndNewtonStrata §1.29) |
| 5.9 | KZ Theorem 4.4.6 and §4.4.11, pp.43–46 (KZ line 1900, 1994–2031) | supported, including the p-power quasi-isogeny step for the j-pieces |
| 7.4 | KZ Proposition 5.3.5 and proof, p.54 (KZ line 2392–2425) | supported; residue field never extended |
| 7.5 | KZ §5.3.6, p.55 | equality supported; algebraicity is at §5.3.2 (R04) |

Also read for the findings and headlines: KZ Theorem 5.1.4 (KZ line 2104), Corollary 4.4.13 (KZ line 2038), Proposition 4.4.10 (KZ line 1973), Corollary 5.2.7 (KZ line 2322); HT Lemma 2.1.4, Proposition 2.1.6, §2.1.7, Corollary 2.1.9 (HT line 989–1105), Corollary 1.3.16 (HT line 915).

**Adversarial table** (sampled targets, headlines, targets a finding touches; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, elliptic point | E: y²=x³+x over F₅ | x=0..4 give 1,0,1,1,0 affine points; #E=4; trace 2; H¹: T²−2T+5; H₁: T²−(2/5)T+1/5; over F₂₅: trace 4−10=−6, det 25 | keep |
| Conventions, G_m norm (repaired) | ζ of order 24 | 6 vs −6≡18 vs 2 (mod 24); ratio ζ¹²=−1 | repaired |
| 0.1 Check | E: y²=x³−x over F₃ | x³−x≡0 for all x: 3 affine points, #E=4, trace 0; fibre of chain moduli ⊇ P¹ (dim 1) vs finite fibre (dim 0) | keep |
| 0.3 | Y(9)→Y(3), p≠3; K₁=K₂ | ker(GL₂(Z/9)→GL₂(Z/3))=3⁴=81, centre meets K(3) trivially, degree 81; identity gives degree 1 | keep |
| 0.5 (R01) | proof step at HT line 800 | needs étale_p↔de Rham for s_α: owner count in *Needs* = 0 | P1 |
| 1.8 | Tate curve; good curve | inertia [[1,t],[0,1]], t≠0 at finite level; a pro-level K-point forces t=0 | keep |
| 1.9 (R02) | Γ₀(p) node; nodal shape | k[[u,v]]/(uv): 2 regular branches; source form true, global-component form unproved | P2 |
| 2.1 | GU(1,1) split at p; GSp_(2g), g≥1; Iwahori | Z^c=U(1)≅G_m at p (dim 1, induced), G_der≅SL₂; Z^c=μ₂ (dim 0); Iwahori not special | keep |
| 2.6 | coinvariants Z², Z/2, 0 | torsion 0, 2, 0: first and third admissible | keep |
| 3.1 | diagonal relation | (γ,φ(γ)⁻¹)↦γγ⁻¹=1; with (γ,φ(γ)) and γ of order 3, γ²≠1 | keep |
| 3.3 | K_p=K_p° | cover of degree |K_p/K_p°|=1, identity | keep |
| 3.4 | γ=diag(ℓ,1), K_ℓ=GL₂(Z_ℓ) | γ[[a,b],[c,d]]γ⁻¹=[[a,ℓb],[c/ℓ,d]]; entry ℓ⁻¹∉Z_ℓ; γ=1 gives K_ℓ | keep |
| 3.8 headline | modular curve, hyperspecial / Iwahori | branches 1 / 2 at a supersingular point; relative dimension 1 both | keep |
| 3.10 | GU(1,1); CM torus | dims 3, 1, 4 (adjoint) vs 5, 1, 6 (full); torus: 0, 0, 0 | keep |
| 4.1 | ordinary / supersingular | D slopes (0,1) / (1/2,1/2); b_x slopes (−1,0) / (−1/2,−1/2); κ=−1 both | keep |
| 4.7 headline | modular curve | ordinary open of dim 1, supersingular closed of dim 0; no ordinary class for the quaternion inner form (slopes ±1/2 once each impossible) | keep |
| 4.8 (R03) | scalars 1/2 and 1/5 at p=5 | 1/2∈Z_(5)^× so in I_x(Z_(5)); 1/5 not | P3 |
| 4.9 | δ_D=[[0,−1],[5,0]]; E/F₃ | δ_D²=−5; (δ_D⁻ᵀ)²=−1/5; centralizer dims 2 (m=1), 4 (m=2); e=2 | keep |
| 4.13 headline | ordinary E/F₅; unipotent control | eigenvalues (1∓2i)/5 with independent valuations (−1,0),(0,−1): torus of dim 2 = dim I_x; identity vs unipotent: same trace 2, centralizers 4≠2 | keep |
| 5.3 | G₃ centre | X_*(Z^c_(G₃)/Z_(G₃,der))_I: extension of torsion-free by torsion-free, torsion 0 (KZ line 1793–1797) | keep |
| 5.7 | hyperspecial GL₂; Iwahori node | M_loc⊗k=P¹ smooth at every point; ordinary points of X₀(p) avoid the node (supersingular) | keep |
| 5.9, 5.10 headlines | ordinary E/F₅ | canonical lift has CM by Z[i], Mumford–Tate torus of dim 2 = rank GL₂; γ₀ has (trace, det)=(2/5,1/5), compact mod scalars | keep |
| 6.3 headline | marked point | degree 1 required; constant map to a lower stratum has empty higher-stratum preimage | keep |
| 7.4 | trivial θ; std θ over F₅ vs F₂₅ | 1=1; (2/5,1/5)≠(−6/25,1/25) | keep |
| 7.5 | SO₄ vs O₄ classes; SL₂(R) rotations ±π/2 | same characteristic polynomial T²+1, conjugator of determinant −(a²+b²)<0 | keep |
| 7.6 headline | uniqueness | Conj(G)(Q)→Conj(G)(Q_ℓ) injective; GL_n coordinates of g=diag(1,1/5): (6/5,1/5) | keep |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the pins of `lake-manifest.json`): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112; no finiteness, no G-structure) and `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `TauCeti.HopfAlgebra.conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136, right coaction, `includeLeft`). All exist as the README describes. Object grep of both pins for Shimura data, parahoric or Bruhat–Tits group schemes, conjugacy quotients and Dieudonné modules: none (only Cartan–Dieudonné hits).

**Lean.** `lake env lean` on the delivered `Suggested.lean`, run from the content checkout: exit 0, no output, no warning. One `import Mathlib`, one module docstring, the namespace, **0 declarations**; so the one-tactic probe and the `#check @name` comparison have 0 inputs, and no backticked name of the roadmap's own is promised. The worker's signature preflight error (“Unknown identifier `of`”) comes from its own scratch file, which took the docstring lines beginning “class of” and “class functions” for declarations; the delivered file is not at fault. No finding; re-wrapping those two lines would silence the preflight.

**Headlines.** The seven headlines of the Summary and Scope (§3.8 KPZ 7.2.21; §4.7 density; §4.13 HT 2.1.9; §5.9 KZ 4.4.6; §5.10 KZ 4.4.13; §6.3 KZ 5.2.7; §7.6 KZ 5.1.4) are each named in the module docstring with the missing carrier. None is statable from the pinned carriers with a few simple definitions: each needs an integral Shimura model.

**Suppliers.** All 24 cited roadmaps fetched at main or their open heads and every cited section heading resolved (about 110 section citations; 0 missing). Content spot-checks: ArithmeticGaloisRepresentations §1.11 contains the target *Reductive quotients over fields and DVRs* with `Conj_H`, flat base change and semisimple classes; ReductiveGroupsPartII *steinberg-quasi-split* (RG2.1.1) and the KZ Lemma 4.2.4 criterion (RG2.3); PadicHodgeTheory §5.5 local torsor theorem; BunGAndNewtonStrata §1.16; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10, 3.13, 3.16; ReductiveGroupsPartIII §5.5 takes this roadmap's §7.6 as an explicit hypothesis and says so in its scope. No citation of a never-cite roadmap.

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 245 roadmaps, 2251 edges, 0 problem(s)
```

**Gaps.** 20 slugs in the README, the same 20 in `design/plan.json`, none with supplier `none`, every `gap:` used in a *Needs:* line declared. Each `needs` sentence carries its hypotheses and excludes what the supplier already has (checked for local-models against GeometricSatakeAndFusionPartII §3.7, open-curve-companions against GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2, siegel-chain-moduli against PELModuli §§M4.5–M4.6). R01 adds a twenty-first.

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id defined only by a revision; confirmed by a grep of all open heads for this roadmap's name (one mention, in GlobalShtukasAndFunctionFieldLanglands' consumers list). Object searches over main and the open heads (integral models of Hodge or abelian type, strongly acceptable, tensor quasi-isogeny group, KR strata, μ-ordinary, the three main sources): no second owner. EndoscopicTransferAndUnitaryTraceComparison uses HT §2.3, which this roadmap excludes.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration and ReductiveGroupsPartII (the third list is empty); nothing shared: very-good embeddings and adapted lifts are owned by the first, local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third, B(G) by the fourth, PEL Newton strata by the fifth, fixers and parahorics by the sixth.

**Copyright.** Wording: the 15 sampled passages and 6 more (Conventions against KZ §4.1.7; §4.9 against HT §2.1.7; §4.11 against HT Lemma 2.1.4; §5.6 against KZ Proposition 4.4.10; §6.3 against KZ Corollary 5.2.7; the first docstring bullet of `Suggested.lean` against KZ Theorem 5.1.4) were set beside the source lines. Longest shared runs are forced phrases (“in the isogeny category”, “smooth of relative dimension dim”), at most five words. Arrangement: KZ's contents are §2 groups, §3 local models and deformations, §4.1–4.4, §5.1–5.3, §6; Layers 0–7 draw on KZ §4.1, KPZ §7.1, KZ §4.2 with KPZ §7.2, KP §§4.5–4.6, HT §§1.3 and 2.1, KZ §§4.3–4.4, KZ §5.2, KZ §§5.1 and 5.3. Layer 7 joins KZ §5.1 and §5.3 after §5.2, Layers 3–4 come from other works, and the order 5→6→7 is forced (§7.4 needs §5.10 and §6.3; §6.3 needs §4.7). No table, figure or example list is taken over.

Source independence: 21 passages compared with 4 sources (KZ, HT, KPZ, KP), none shared; largest share KZ, 38 of 90 locators; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the recorded preprint or author versions; locators are for the versions `sources.toml` records.
- R02: I could not decide whether a Hodge model with disconnected full fixer actually has a non-normal irreducible component; the finding rests on what the sources prove.
- The 20 declared supplier gaps are contracts; their future proofs cannot be checked here.
- K17 was not reopened this round (no sampled target cites it alone); the round-5 reading of K17 §2.1.2 and Corollary 2.1.7 stands on that review's line witnesses.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says the inertia coinvariants of the abelianization are torsion; it should be torsion-free, as Lemma 4.2.4 requires; affects a stated result.
- **Misprint** in KZ at Theorem 4.2.6(2), printed p.35: the source says the target of the extension bijection is the integral model of (G₂,X); it should be the Shimura variety of (G₂,X₂) on R[1/p]; affects nothing.
- **Gap** in HT at the proof of Corollary 1.3.13, printed p.19: the source says the generated category is equivalent to representations of the full tensor stabilizer; it should be its Tannakian subgroup, with restriction of representations; affects the proof.
- **Misprint** in HT at the proof of Corollary 1.3.13, printed p.19: the source says V^⊗n⊗V*^⊗m goes to D^⊗m⊗D*^⊗n; it should be D^⊗n⊗D*^⊗m; affects the proof.
- **Error** in HT at §1.3.15, printed p.20: the source says a unique class with Newton point the averaged inverse Hodge cocharacter always exists; it should be assumed to exist, as holds for quasi-split groups; affects a stated result.
- **Misprint** in HT at §2.1.8, printed p.24: the source says neatness uses the group generated by an undefined x; it should be the group generated by γ; affects nothing.
- **Error** in KP at the proof of Theorem 4.2.7, printed p.186: the source says the local action map is a torsor; it should be the smooth action morphism; affects the proof; corrected in print at KPZ §7.3.1(1), p.85.

## For the human reviewers

- Licence: HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`), in versions dated 27 January 2021 and 27 August 2016; their numbering was not collated with the Duke and JAMS versions.
- Scope: the subject is published refereed work (KP in Publ. IHÉS 2018, KPZ in Forum Math. Pi 2026, HT in Duke 2022, KZ recorded as Annals 2025); nothing to flag beyond that the KZ text read is arXiv v2.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aecebde71e77c27598141d7c365830f2fef21571", "job": "REV-PKG-ShimuraVarietiesPartII~6", "model": "fable", "worker": "chris-x55"} -->
