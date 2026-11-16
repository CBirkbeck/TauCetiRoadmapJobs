<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6915303253 -->
Review (claude) of 572d284

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) gap:finite-field-bertini asks for what LefschetzPencilsAndVanishingCyclesPartII §2.4 on main provides

   **Location.** `packages/ShimuraVarietiesPartII/README.md:164` (Exact supplier contracts): "What AlgebraicModuliForArithmeticGeometry must provide (gap:finite-field-bertini): Layer 1. For a smooth geometrically irreducible finite-type F_q-scheme of positive dimension, a specified F_q-point and a dense open, supply a smooth geometrically connected curve over F_q through that point". Also `README.md:1272`, `:1276`, `:1278` (§6.3), `:1300` (Layer 6 Dependencies) and the entry `finite-field-bertini` of `packages/ShimuraVarietiesPartII/design/plan.json`.

   **Claim.** No roadmap states the curve through a rational point of a smooth F_q-scheme meeting a dense open, so AlgebraicModuliForArithmeticGeometry must add it.

   **Witness.** Main, `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:579–587`, §2.4 `exists_same_field_curve`: for a rational point y with a smooth open neighbourhood V and an open U with U∩V dense in V, an affine curve C, smooth and geometrically integral, c∈C(k), g(c)=y, g⁻¹(U) nonempty and dense.

   In detail: that roadmap is on main and is entry 4 of the merge order (this roadmap is entry 363). Its Summary (line 19–23) names this exact use: the curve step of KZ Corollary 5.2.7 and Proposition 5.3.5. Its statement is over any field, needs smoothness only near y, and has no positive-dimension hypothesis: for a zero-dimensional chart it returns the constant map from A¹ (its §2.4, step 3), which is the Layer 6 Example of this README. The gap as declared excludes that case ("of positive dimension"). A declared gap that asks for what an earlier roadmap provides is P2 under the gap rules. The rational lift to a smooth atlas is not in that roadmap (its line 117–118), so gap:rational-stack-presentation stands.

   **Exact repair.** Keep the numbering.

   1. Delete the contract paragraph "What AlgebraicModuliForArithmeticGeometry must provide (gap:finite-field-bertini): …" and remove the `finite-field-bertini` entry from the `gaps` list of `design/plan.json`, so that the README slugs, the contracts and the plan stay equal (22 each).
   2. Add, under Exact supplier contracts:

      > ### From TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII
      >
      > §2.4 (`exists_same_field_curve`: for a scheme Y over a field k, a rational point y with an open neighbourhood V smooth over k, and an open U with U∩V dense in V, there are an affine curve C, smooth of relative dimension one and geometrically integral over k, a point c∈C(k) and a k-morphism g:C→Y with g(c)=y and g⁻¹(U) nonempty and dense in C; the residue fields at c and y are both k. For a zero-dimensional V the curve is A¹ with the constant map). The rational lift to a smooth presentation of a stack and the curves through singular points of the local model are not part of it.

   3. Scope and ownership, second paragraph, add: "LefschetzPencilsAndVanishingCyclesPartII §2.4 states the curve over the same field through a smooth rational point meeting a dense open; §6.3 applies it to a smooth presentation."
   4. §6.3, Construction: replace "and apply finite-field Bertini with prescribed point and prescribed nonempty open intersection" by "and apply the same-field curve theorem of LefschetzPencilsAndVanishingCyclesPartII §2.4 to the presentation, its rational point and the dense inverse image of the higher stratum".
   5. §6.3, proof sketch: replace "Use the rational-point smooth stack presentation and Poonen’s finite-field Bertini with the required local condition and open intersection; shrink to a smooth geometrically connected curve." by "Use the rational-point smooth stack presentation, then the same-field curve of LefschetzPencilsAndVanishingCyclesPartII §2.4 on that smooth scheme; the curve is geometrically integral, hence geometrically connected, and no projectivity of the presentation is needed."
   6. §6.3 `*Needs:*` and Layer 6 Dependencies: replace "AlgebraicModuliForArithmeticGeometry Layer 1 (gap:finite-field-bertini)" by "LefschetzPencilsAndVanishingCyclesPartII §2.4".
   7. Layer 6 Examples: replace "the positive-dimensional Bertini step is unnecessary" by "this is the zero-dimensional case of LefschetzPencilsAndVanishingCyclesPartII §2.4".

   **Repair test.** Zero-dimensional torus component, x∈S(F_q) ordinary: §2.4 gives C=A¹, the constant map, c=0, g⁻¹(U)=C, the README's Example; the deleted gap did not cover it. Positive dimension: Y=A² over F₂, y=0, U=D(X₀²X₁−X₀X₁²). The three rational lines through 0 miss U; on T↦(T,T³) the function is T⁵+T⁷≠0, so the open is dense. The dependency check stays clean: the new supplier is entry 4.

2. **F02** (P3) two cited locators are missing from the manifest

   **Location.** `packages/ShimuraVarietiesPartII/sources.toml`, `KZ` entry, `locator = "§§2.4, 3–5; Definition 2.2.4; Remark 2.2.5; …"`, and `KPZ` entry, `locator = "§2.1.4, §§5–7, §§7.2.1–7.2.2; Definition 3.1.4; …"`.

   **Claim.** The manifest records every locator the README cites.

   **Witness.** `README.md:1156` (§5.5) cites "Lemma 2.2.8, p.10" of KZ (KZ line 457, in §2.2); `README.md:86` and `:94` cite "KPZ Definition 3.4.4" (KPZ line 1234, in §3.4). Neither lies in the sections the two locator fields list.

   **Exact repair.** In the `KZ` locator write "Definition 2.2.4; Remark 2.2.5; Lemma 2.2.8"; in the `KPZ` locator write "Definitions 3.1.4, 3.4.4". Nothing else in the manifest changes. Both texts support the README: KZ Lemma 2.2.8 is the ordinary class under derived isogenies; KPZ Definition 3.4.4 defines good as a closed immersion of local models into the Grassmannian.

Two findings: R01 (P2) and R02 (P3); one is blocking. All five findings of round 13 are repaired. R01 is not a defect of the last repair: it is a supplier gap, declared since the design, for a statement that a roadmap on main now proves. This review changed no authored file and fetched no source (`sources.toml` is unchanged; no `needs-references.toml` was written). No maintainer notes were supplied.

## Previous findings, verified first

| Finding (round 13) | Repaired passage | Status |
|---|---|---|
| F01 (P2), "suitable" lattice in §5.4 | `README.md:1117`: "a Z_p-lattice that is self-dual for the symplectic form and such that G_2,Qp→GSp(V_2,Qp) extends to a morphism of group schemes from G_2^fix to the stabilizer group scheme of V_2,Zp" | **Repaired.** KZ line 1759–1766 has exactly these hypotheses; the negative Check at `:1145` recomputed below. |
| F02 (P3), quasi-tame restated | `README.md:25`: "Quasi-tame is the notion of ReductiveGroupsPartII §RG2.3.2 (*quasi-tame-group*)" | **Repaired.** Heading RG2.3.2 is at main line 4044; contract at `:100` lists it. |
| F03 (P3), "adjoint fixer torsor" | `README.md:774`: "π:S̃_ad→S, a torsor under the quotient G^fix/Z … G^fix/Z is not asserted to be the full Bruhat–Tits fixer of x_ad" | **Repaired.** KPZ line 3299–3306 and 3335–3337. |
| F04 (P3), top-stratum locator | `README.md:1274`: "proof of Proposition 5.3.5, p.54, for a point of the top stratum" | **Repaired.** KZ line 2411–2418, page marker at 2383. |
| F05 (P3), undefined terms and a count | `README.md:254` (levels and the torsor stated), `:94` ("no non-exceptional hypothesis, the condition of §2.3"), `:1074` ("Write V_3=V_1⊕V_2, Ψ_3=Ψ_1⊕Ψ_2 and ι_3"), `:536` ("The cover properties listed in the construction") | **Repaired.** |

No finding of the last repair report was marked not actionable; nothing is re-raised. The two gaps added by the repair (gap:fixer-stable-lattices, gap:rg3-r-smooth-central-quotient) were checked for precision and minimality: see Gaps below.

## Verified sound

**Coverage.** The whole README (1434 lines; 63 numbered targets in 8 layers; 71 `*Needs:*` lines; 27 API lists; 30 Checks blocks), `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json` were read this round.

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no computational algorithm, no sorry'd data, no `set_option`.

**Seeded source sample: 15 of 15 read at their locators; all supported.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 1.2 | KZ Proposition 4.1.9, pp.31–32 (KZ line 1361–1391), under (A′)–(B′) (KZ line 1272–1275) | neat level, very good at y, component ≅ Spf A_G, adapted criterion both ways |
| 2.3 | KPZ Proposition 7.2.10, pp.79–80 (KPZ line 3489–3502); (NE) at §6.1, p.62 (KPZ line 2703–2708); H^♯ at KPZ line 3360–3374 | supported; the R-smooth centre is the consequence used in 7.2.19(3) (KPZ line 3721–3722) |
| 2.5 | KPZ Proposition 7.2.19, pp.83–84 (KPZ line 3669–3683) | all six listed properties and the restricted torsion-free clause |
| 3.3 | KPZ Proposition 7.1.11, p.75 (KPZ line 3294–3297); KP Proposition 4.3.7, pp.190–191 (KP line 2805–2840) | étale, finite by the proof, splits over an unramified extension at small level |
| 3.4 | KP Lemmas 4.5.2, 4.5.4, 4.5.7, 4.5.9, pp.194–197 (KP line 2954–3046) | twist by the central torsor, level γK^pγ⁻¹, normalization, lift to the adjoint torsor |
| 4.2 | HT Lemma 1.3.9, p.18 (HT line 818–820) | admissible pair with μ_X⁻¹ |
| 4.6 | KZ Definition 4.4.3 and the assumption before it, p.43 (KZ line 1884–1885); HT §1.3.15, p.20 (HT line 909–914) | supported |
| 4.11 | HT Lemma 2.1.4, p.22 (HT line 989–1009); Proposition 2.1.6, p.23 (HT line 1036–1047) | one direction only, surjection onto the quotient |
| 5.2 | KZ §4.3.7, p.40 (KZ line 1770–1781); §4.4.6–4.4.7, pp.43–44 (KZ line 1904–1937) | supported |
| 5.3 | KZ Lemma 4.3.8, pp.40–41 (KZ line 1782–1803); Lemma 4.1.4, p.29 (KZ line 1277–1282); proof of Theorem 4.4.6 (KZ line 2005–2007) | supported |
| 6.2 | KZ proof of Corollary 5.2.7, pp.52–53 (KZ line 2333–2335) | torsor under a smooth group with connected special fibre |
| 6.3 | KZ Proposition 5.2.3, p.49 (KZ line 2169–2173); Corollary 5.2.7 (KZ line 2322–2351); proof of 5.3.5, p.54 (KZ line 2411–2418) | supported; the curve step is R01 |
| 7.1 | KZ §5.1.1–5.1.2, p.47 (KZ line 2063–2090) | product levels in the source; (5.1.1.1) is the H₁ frame torsor |
| 7.2 | KZ §5.1.2–5.1.3, p.47 (KZ line 2080–2100) | supported |
| 7.6 | KZ Theorem 5.1.4, p.48 (KZ line 2104–2106); proof §5.3.6, p.55 (KZ line 2428–2439) | supported |

Also read: KZ §4.1.5–4.1.11 (KZ line 1283–1437), Definition 4.2.2–Remark 4.2.7 (KZ line 1481–1580), §4.3.5–§4.4.14 (KZ line 1751–2056), §5.2.1 (KZ line 2112–2166), §5.3.1–5.3.5 (KZ line 2353–2425), Proposition 2.4.13 (KZ line 774–790); KPZ §7.1.2–Theorem 7.1.3 (KPZ line 3168–3206), §7.1.10–Proposition 7.1.14 (KPZ line 3281–3348), §7.2.1–Lemma 7.2.8 (KPZ line 3350–3486), Lemma 7.2.11 (KPZ line 3555–3564), Theorem 7.2.21 and Corollary 7.2.24 (KPZ line 3735–3780), Definition 3.4.4 (KPZ line 1234–1237); KP §4.5.6 and Lemma 4.6.2 (KP line 2982–3010, 3099–3125); HT Proposition 1.3.10, Corollary 1.3.16, §2.1.1–2.1.7 (HT line 821–837, 915–925, 940–1060); K17 §2.1.2, p.29, and Corollary 2.1.7, p.31 (K17 line 1281, 1381).

**Adversarial table** (repaired passages, the sample, the headlines, the targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §6.3 curve step, gap as declared | zero-dimensional component; A² over F₂ with U=D(X₀²X₁−X₀X₁²) | gap requires positive dimension, so no curve; main §2.4 gives A¹→{x}. Lines (t,0),(0,t),(t,t) give 0; T↦(T,T³) gives T⁵+T⁷≠0 | already provided, and wider: R01 |
| §5.4 Theorem, lattice hypothesis | T=Res_(Q(i)/Q)G_m, p=5, Λ=⟨e₁+e₂/5, e₂⟩ | form u(x₁y₂−x₂y₁), u=α/2; ψ(f₁,f₂)=u, Gram determinant u², a unit; (1,2)·f₁=f₁+(1/5)f₂∉Λ | self-dual, not stable: excluded by the hypothesis |
| Same, standard lattice | Z₅e₁⊕Z₅e₂ | (a,b), a,b units, gives (ax₁,bx₂) | hypothesis holds |
| §5.4 existence route | Λ₀ stable under the fixer, form scaled | ψ(gv,λ)=c(g)ψ(v,g⁻¹λ) with c(g) a unit, so Λ₀^∨ is stable; Zarhin's lattice Λ₀⁸+{(x,αx)} with α∈M₄(Z) commutes with G | stable and self-dual; multiplier c on V⁸ |
| §5.4 Check 2 | ψ=Tr(i·xȳ/2); y²=x³+x over F₅ and F₃ | ψ(1,i)=Tr(1/2)=1; F₅ counts 1,0,1,1,0, #E=4, trace 2; F₃ counts 1,0,2, #E=4, trace 0; (2y)²=−y² | keep |
| gap:fixer-stable-lattices | V=0; split torus; Iwahori of GL₂ | Λ=0; eigenlattice; I⊂GL₂(Z_p). In general {v∈L₀: Δ(v)∈L₀⊗O(G_x)} is a subcomodule between ϖⁿL₀ and L₀ | true as stated; one statement |
| §3.9, G^fix/Z | torus; hyperspecial GL₂; GL₂ at an edge midpoint | trivial; PGL₂, dimension 3; I/G_m connected, while w=[[0,1],[p,0]] has det −p, w²=p, so the fixer of x_ad has 2 components | not the full fixer of x_ad, as stated |
| gap:rg3-r-smooth-central-quotient | the same three | Z smooth (G_m, G_m, the torus); neutral component PGL₂, Iwahori of PGL₂, trivial | consistent with KPZ line 3303–3306 |
| §0.3 torsor | Y(9)→Y(3), p∤3; a level containing −1 | \|1+3M₂(Z/3)\|=3⁴=81; −1 central acts trivially, not free | holds under neatness only |
| §2.1 Checks | GU(1,1) split at p; GSp_(2g) | Z^c=U(1)⊇μ₂, G_m at p; Z^c=μ₂, not a torus | keep |
| §2.3, non-exceptional | H of type D^H | some prime of F over p meets a noncompact place, so a local D^H factor exists | (NE) excludes it; H^♯=H^sc there |
| gap:multiplier-exact-sequences | GU(1,1)×GU(1,1) with common multiplier | centre rank 2+2−1=3, Z^c rank 2, 3=2+1; Z_G/w(G_m) anisotropic over R, so Z_G=Z_(G,0)·w(G_m) | the simplicity hypothesis of KPZ 7.2.5 is not used |
| §3.4 Check 3 | γ=diag(ℓ,1) | γ[[a,b],[c,d]]γ⁻¹=[[a,ℓb],[c/ℓ,d]]; b=1 and c=1 give entries ℓ and ℓ⁻¹ | level moves |
| §3.8 Check 3 | scalar i in GU(1,1), p=5 | i·ī=1; order 4; outside a neat level | inertia Z/4 |
| §3.10 Check 1; Layer 3 Example | GU(1,1) curve; j=diag(p,1) | 1+3=4, 1+5=6; c=p gives c/p=1 | keep |
| §4.5 Remark | SL₂, d=diag(3,1) | det(d/√3)=1; normalizer determinants ±(a²+b²), even 3-adic valuation; 1/3 odd | keep |
| §4.8 Check 3 | p⁻¹, ℓ⁻¹ | n^(2d)=p^(2d)·deg f impossible for p∤n; ℓ a unit of Z_(p) | keep |
| §4.9 Checks | 1±2i; y²=x³−x over F₃; δ_D=[[0,−1],[5,0]]; N(z)=5 | rank 2, e=1; counts 1,1,1, #E=4, γ²=−1/3, e=2, centralizer dimensions 2 and 4; δ_D²=−5; norms of even valuation | keep |
| Conventions | y²=x³+x over F₅, F₂₅; ζ of order 24 | T²−2T+5, T²−(2/5)T+1/5; trace 4−10=−6, (2/5)²−2/5=−6/25; ζ·ζ⁵=ζ⁶, ζ⁻⁶=ζ¹⁸, ratio ζ¹²=−1 | keep |
| §5.3 Checks | Q(√2), Q(√−2), Q(i), Q(√−11) at 5 | 2, 3 non-squares; 5=(2+i)(2−i); −11≡4; trace form 2(Ψ(a,ha)−Ψ(b,hb)) indefinite | keep |
| §5.3, R-smooth centre | G_3 of the matched datum | Z^c products of induced tori; Z an extension of G_m by them; G_3^ad quasi-tame, the hypothesis the proof of KPZ 7.2.11 uses (KPZ line 3562) | holds |
| §7.1 Check 4 | Q(i), 3 and 7 inert | unit norms onto Z_v^×; projection G(Z₃); K^p∩G(Q₃) of index 2 | image, not intersection |
| §7.2 Check 1 | g=diag(1,1/5) | det(T−g)=T²−(6/5)T+1/5 | keep |
| §7.6 headline | KZ line 2104–2106, 2433–2439 | a residue field with a split prime over almost every ℓ is Q; Conj(G)(Q)→Conj(G)(Q_ℓ) injective | unique |
| §3.8, §4.7 with §5.4, §4.13, §5.9, §5.10, §6.3 headlines | KPZ line 3735–3763; HT line 915–925; KZ line 1887–1896, 1900–1903, 2038–2042, 2322–2327 | README hypotheses equal the sources'; §5.4 adds the lattice hypothesis of KZ line 1762–1764 | holds; §6.3 route is R01 |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the revisions of the manifest): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist where cited. Neither pin has a declaration for Shimura varieties, parahorics, Newton strata or a conjugacy quotient. No backticked name in the README is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. One `import Mathlib`, one module docstring, the namespace, 0 declarations. The one-tactic probe and the `#check @name` comparison have 0 inputs; nothing changed. No padding is possible.

**Headlines.** Seven, from the last scope paragraph: §7.6 (KZ Theorem 5.1.4), §3.8 (KPZ Theorem 7.2.21), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §4.13 (HT Corollary 2.1.9), §4.7 with §5.4 (HT Corollary 1.3.16, KZ Theorem 4.4.4), §6.3 (KZ Corollary 5.2.7). Each is named in the module docstring with the carrier it lacks. None is statable at the pins; no stand-in is used.

**Suppliers.** `roadmaps resolve` lists nothing unresolved. I resolved the cited headings again at the current heads, 24 suppliers (6 on main, 18 at open heads), and LefschetzPencilsAndVanishingCyclesPartII §2.4 on main: every cited section and layer exists under its number. No never-cite roadmap is cited. Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 262 roadmaps, 2546 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gaps.** 23 slugs in the README, 23 contracts, 23 entries in `design/plan.json`; the sets are equal and each contract names the plan's supplier. I searched main and the open heads by object for each. One is already provided (R01). For the others nothing is found: ReductiveGroupsPartII lists the R-smooth statements outside its scope (main line 85–99) and has stable lattices only for minuscule or tame embeddings (§RG2.3.5); GlobalShtukasAndFunctionFieldLanglands §6.2 treats irreducible sheaves only; ReductiveGroupsPartIII §3.5 is over number fields; Noot's Conj′ comparison is stated nowhere (NeronModelsAndSemistableAbelianVarieties §6.10 is the Weil–Deligne system, a different statement); no roadmap states lattice-chain Siegel moduli, the Berthelot–Ogus transport or the lift of a rational point to a smooth atlas. After R01 an acceptance would be conditional on 22 gaps.

**Shape.** Every target has a `*Needs:*` line and a locator; every Definition and Construction has an API list and at least three Checks; every layer ends with Examples and Dependencies. Residue search (LaTeX delimiters, pull-request numbers, round labels, machine paths, "optional", "deferred", "so far", HTML anchors): no hit; the two occurrences of "lemma" are prose (Krasner's lemma, the unit-eigenvalue lemma).

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. By object: integral models of abelian type, Kottwitz–Rapoport strata on Shimura models, the group I_x and tower local systems are stated by no other roadmap; GeometricSatakeAndFusionPartII §5.5 owns the local-model curve and is cited; the one duplicate is the curve of R01. `Suggested.lean` declares no name.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII and AbelianSchemesAndArithmeticModuli (the third list is empty); nothing shared among them: very-good embeddings and adapted lifts are owned by the first, local models and local-model curves by the second, Conj′ and the abelian-variety application by the third, B(G) by the fourth, unitary PEL and Rapoport–Zink models by the fifth, fixers, parahorics and quasi-tame groups by the sixth, Tate modules and Serre–Tate theory by the seventh. The shared object of R01 is outside these lists: owner LefschetzPencilsAndVanishingCyclesPartII §2.4.

**Copyright.** Wording: 21 passages set beside the source lines: the 15 sampled, and §0.3 (HT line 950, KZ line 1299–1303), §5.4 Theorem (KZ line 1759–1766), §5.4 Construction (KZ line 1862–1872), §5.6 (KZ line 1973–1993), §3.9 (KPZ line 3299–3306) and the first docstring item of `Suggested.lean` (KZ line 2104–2106). The longest shared runs are forced phrases of five to seven words ("is a 2-group and is trivial", "a discrete valuation ring of mixed characteristic"). Arrangement: KZ runs §2.4, §3, §4.1–4.4, §5.1–5.3, §6. Its §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1 to 4 rest on KPZ, KP and HT; Layer 5 joins KZ §4.3, §4.4 and Theorem 4.1.11; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order of Layers 4 to 7 is forced (§5.6 needs §4.13; §6.3 needs §5.4; §7.4 needs §5.10 and §6.3). No table, figure or list of examples is taken over.

Source independence: 21 passages compared with 4 sources (KZ, HT, KPZ, KP), none shared; largest share KZ, 53 of 124 parenthesised locators; contents compared with KZ: independent.

## Not verifiable

- Poonen's *Bertini theorems over finite fields* was not opened. That KZ's citation of its Corollary 3.4 does not cover a non-projective smooth presentation is the reading of LefschetzPencilsAndVanishingCyclesPartII (main line 104–117); R01 does not depend on it.
- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the versions `sources.toml` records; locators are for the recorded versions. KZ cites KPZ by preprint numbers (7.2.6, 7.2.14, 7.2.18) that are 7.2.11, 7.2.19 and nearby in the published KPZ.
- The 23 declared supplier gaps are contracts; their future proofs cannot be checked here.
- Whether the Newton class and I_x of a point depend on the chosen Hodge embedding was not settled; the README asserts no independence.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacters of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 and the use on p.41 require; affects nothing.
- **Gap** in KZ at the proof of Lemma 4.3.8(1), p.40: the source applies the multiplier sequence of a KPZ lemma to the matched group; that lemma assumes a simple adjoint group, though its proof does not use it; affects the proof.
- **Misprint** in KZ at §4.4.2, p.43: the source indexes the strata by the acceptable set of G; it should be that of G_2; affects nothing.
- **Misprint** in KZ at §4.4.5, p.43: the source writes the étale tensors preserved by the isogeny group with the crystalline index 0; it should be the ℓ-adic tensors at the point, as in §4.1.10; affects nothing.
- **Misprint** in HT at §2.1.3, p.21: the source defines the integral isogeny group as the Q_p-points meeting Aut; it should be the Q-points meeting Aut, as in the proof of Lemma 2.1.4, p.22; affects nothing.
- **Gap** in HT at the proof of Proposition 1.3.10, p.18: the source fixes any place of the torus reflex field above v; it should be the place induced by the fixed p-adic embedding, which defines the class; affects the proof.

## For the human reviewers

- Licence: `sources.toml` records HT and K17 from author pages (`licence_class = "author-page"`) and KZ from arXiv v2, not collated with the Annals version (its `version_note`); the published texts were not read.
- Scope: the roadmap states 23 supplier gaps (22 after R01) on 11 other roadmaps (`packages/ShimuraVarietiesPartII/README.md`, Exact supplier contracts); its headline theorems hold only once those suppliers accept them.
- Scope: four `gap:rg3-…` contracts ask ReductiveGroupsPartIII for R-smooth statements; GeometricSatakeAndFusionPartII asks ReductiveGroupsPartII for them (its README line 77); ReductiveGroupsPartII on main lists them outside its scope (lines 85–99).
- Scope: LefschetzPencilsAndVanishingCyclesPartII on main (line 691–693) says the rational lift to a smooth atlas belongs to the Shimura roadmaps; this package asks AlgebraicModuliForArithmeticGeometry Layer 4 for it (gap:rational-stack-presentation).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "572d284106d371111e52a961b20c6ab73abd27e0", "job": "REV-PKG-ShimuraVarietiesPartII~14", "model": "fable", "worker": "chris-x52"} -->
