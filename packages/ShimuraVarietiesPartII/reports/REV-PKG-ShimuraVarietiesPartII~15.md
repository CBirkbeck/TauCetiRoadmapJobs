<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6916166618 -->
Review (claude) of 99b9ecf

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.4 has one *Needs:* line for three statements with different needs

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1119–1135`, §5.4: a Theorem (the integral Siegel map), a Construction (tensors, Newton strata and isogeny groups for ι_2) and a second Theorem (normality and density), followed by the single line "*Needs:* §5.3; §3.7; PELModuli §§M4.5–M4.6, M6.1–M6.4; … §4.13; … (gap:component-specialization)."

   **Claim.** Each target's *Needs:* line lists what its statement and its route need.

   **Witness.** The first theorem's sketch (`:1123`) uses the matched diagram, the component action, a stable lattice and Zarhin's enlargement. The one line puts it behind §4.13 (gap:noot-coarse-comparison) and gap:component-specialization, which only the later statements use. A count of statements and *Needs:* lines per numbered section gives one line per statement in the other 62 sections.

   **Exact repair.** Keep the numbering and the texts of the three statements. Delete the line at `:1135` and put one line after each statement:

   1. After the first proof sketch (`:1123`): `*Needs:* §0.1; §2.1; §2.6; §3.6; §3.7; §3.8; §5.3; PELModuli §§M4.5–M4.6, M6.1–M6.4; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; ReductiveGroupsPartII §RG2.3 (gap:fixer-stable-lattices).`
   2. After the Construction's locator (`:1127`): `*Needs:* the integral Siegel map above; §3.8; §0.4; §0.5; §0.6; §4.1; §4.2; §4.3; §4.4; §4.5; §4.6; §4.8; §4.9; §4.10; §4.11; §4.12; §4.13; ShimuraVarieties §5.6.`
   3. After the second proof sketch (`:1133`): `*Needs:* the construction above; §1.9; §2.1; §2.6; §3.6; §3.8; §3.10; §4.4; §4.5; ShimuraVarieties §5.6; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); ShimuraCompactifications Layer 7 (gap:component-specialization).`

   The union of the three lines is the old line plus §0.1, which the first theorem names ("the single-lattice Siegel model of V_2,Zp (§0.1)") and which the Layer 5 Dependencies already list; no Dependencies line changes. **Repair test.** With the split, the Siegel map of the torus Check (T=Res_(Q(i)/Q)G_m, p=5, lattice Z_5e_1⊕Z_5e_2) needs no Newton stratum and no Tate comparison: its line has neither §4.13 nor a Layer 4 gap. Re-run the dependency check after the edit; the edges are unchanged, so it must still report 0 problems.

2. **F02** (P3) the page of KZ Lemma 2.2.8

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1158`, §5.5: "proof of Theorem 4.4.6, §4.4.11, p.45, with Lemma 2.2.8, p.10, for the ordinary classes".

   **Claim.** The statement used (a class is ordinary exactly when its image under a derived isogeny is) is on p.10.

   **Witness.** KZ line 457 opens the lemma with part (1) on p.10; the page marker for p.11 is KZ line 459; part (2), the statement §5.5 uses for "x_3 is ordinary exactly when x_1 is", is KZ line 461–462, on p.11.

   **Exact repair.** Write "Lemma 2.2.8, pp.10–11". The README gives ranges for every other result that crosses a page (Proposition 4.1.9, pp.31–32; Lemma 5.3.3, pp.53–54). Nothing else changes; the manifest records the lemma without a page.

Two findings, both P3; none is blocking. Both findings of round 14 are repaired. The mathematics, the supplier citations, the gaps and the Lean file hold; the two findings are a shape defect in §5.4 and one page range. This review changed no authored file and fetched no source (`sources.toml` is unchanged, no `needs-references.toml` was written). No maintainer notes were supplied.

## Previous findings, verified first

| Finding (round 14) | Repaired passage | Status |
|---|---|---|
| F01 (P2), gap:finite-field-bertini asks for what LefschetzPencilsAndVanishingCyclesPartII §2.4 provides | `packages/ShimuraVarietiesPartII/README.md:166–168`: "### From TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII … §2.4 (`exists_same_field_curve`, the same-field curve through a smooth rational point …)"; `:9` (Scope sentence); `:1274`, `:1278`, `:1280` (§6.3); `:1298`, `:1302` (Layer 6). The slug is gone from the README and from the `gaps` list of `design/plan.json` | **Repaired.** Main, `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md:579–586` and its `Suggested.lean:109–116`, state exactly the hypotheses and conclusions the contract restates; step 3 (`:604–610`) is the zero-dimensional case. |
| F02 (P3), two locators missing from the manifest | `packages/ShimuraVarietiesPartII/sources.toml`, `KZ` locator: "… Remark 2.2.5; Lemma 2.2.8; Propositions …"; `KPZ` locator: "Definitions 3.1.4, 3.4.4" | **Repaired.** KZ line 457; KPZ line 1234. |

No finding of the repair report was marked not actionable; nothing is re-raised. The repaired patterns were searched for in the rest of the package: every declared gap was searched by object at the suppliers' current heads (see Gaps), and every source item the README cites was mapped to its printed page (see Sources).

## Verified sound

**Coverage.** The whole README (1436 lines; 63 numbered targets in 8 layers), `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json` were read this round.

**Principles.** No route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no computational algorithm, no sorry'd data, no `set_option`.

**Sources: the seeded sample, 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 0.3 | HT §2.1.1–2.1.2, p.21 (HT line 940–968); KZ §4.1.5, pp.29–30 (KZ line 1283–1303) | finite étale transitions, the G(A_f^p)-action, sections extended by normality; freeness is the README's own argument, recomputed below |
| 1.3 | KZ Proposition 4.1.9(3), pp.31–32 (KZ line 1368–1369, proof 1384–1391), under (A′)–(B′) (KZ line 1272–1275) | supported, with neat level and very-goodness at y |
| 1.7 | KPZ Theorem 7.1.8 and Remark 7.1.9(b), p.74 (KPZ line 3254–3274) | canonical model, independent of embedding and lattice |
| 1.8 | KPZ Theorem 7.1.3(1), p.73 (KPZ line 3196–3197, proof 3215–3216); HT Lemma 1.3.6, p.17 (HT line 764–773) | supported |
| 2.3 | KPZ Proposition 7.2.10, pp.79–80 (KPZ line 3489–3502); (NE), §6.1, p.62 (KPZ line 2706) | supported; the R-smooth centre follows as in KPZ line 3721–3722 |
| 2.5 | KPZ Proposition 7.2.19, pp.83–84 (KPZ line 3669–3683, 3725–3731) | all listed properties and the restricted torsion-free clause |
| 3.5 | KP §4.6.5, Lemmas 4.6.6 and 4.6.9, pp.199–201 (KP line 3167–3256) | extension by the connected group, star product, map of extensions over the composite field |
| 3.7 | KP proof of Corollary 4.6.15, pp.203–204 (KP line 3331–3345); Corollary 4.6.18, p.205 (KP line 3391); KPZ §7.3.1(3), pp.86–87 (KPZ line 3833–3847) | free action of the kernel; conjugate-level pieces |
| 3.8 | KPZ Theorem 7.2.21, pp.84–85 (KPZ line 3735–3763); Proposition 7.1.14, pp.75–76 (KPZ line 3317–3337); KZ §4.1.5 and §4.3.5 (KZ line 1299–1303, 1751–1754) | supported |
| 4.1 | HT §1.3.8, p.18 (HT line 808–815); KZ §4.4.2, p.43 (KZ line 1875–1881) | supported; the dual frame is KZ's convention |
| 4.7 | KZ Theorem 4.4.4, p.43 (KZ line 1887–1896); HT Corollary 1.3.16, p.20 (HT line 915–925) | supported |
| 5.1 | KZ Proposition 4.3.2 and Corollary 4.3.4, pp.37–40 (KZ line 1626–1643, 1705–1711) | supported |
| 5.5 | KZ Proposition 4.4.8, (4.4.9.1), §4.4.9, pp.44–45 (KZ line 1938–1972); §4.4.1, p.42 (KZ line 1870–1872); §4.4.11, p.45 (KZ line 1996–1997); Lemma 2.2.8 (KZ line 457–462) | supported; page of the lemma is R02 |
| 7.5 | KZ §5.3.2, p.53 (KZ line 2370–2373); §5.3.6, p.55 (KZ line 2429–2432) | supported |
| 7.6 | KZ Theorem 5.1.4, p.48 (KZ line 2104–2106); proof, p.55 (KZ line 2433–2439) | supported |

Also read: KZ §4.1.1–4.1.13, Definition 4.2.2–Remark 4.2.7, §4.4.1–4.4.14, §5.1.1–5.1.3, §5.2.1, Proposition 5.2.3, Corollary 5.2.7, §5.3.1–5.3.6; HT §1.3.4–1.3.16, §2.1.1–2.1.9; KPZ §2.1.4, Proposition 2.1.5, Definition 3.1.4, §7.1.2–7.1.14, §7.2.18–7.2.24, §7.3.1–7.3.2. A page map of 41 further cited items (KZ 9, KPZ 13, KP 13, K17 2, HT 4) against the page markers, and the section locators of Layers 0–7 read against the same markers, found no other slip.

**Adversarial table** (the repaired passages, the sample, the headlines, the targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §6.3, lower stratum, as repaired | open φ⁻¹(M^λ′) on a geometrically irreducible C | its Frobenius conjugates are dense opens too; two disjoint nonempty opens of an irreducible space do not exist, so σλ′=λ′ and the open is defined over F_q | the open U of §2.4 exists over F_q |
| §6.3, density in the presentation | Y→S̃×_M C→C, both smooth | image of a nonempty open of Y is a nonempty open of C, which meets the dense φ⁻¹(M^λ′) | dense, as stated |
| §6.3, top stratum | ordinary locus under Frobenius | [σ(b)]=[b] since σ(b)=b⁻¹·b·σ(b); the locus descends to k_E | U defined over F_q |
| Contract, LefschetzPencils §2.4 | its Lean statement, main line 109–116 | hypotheses: section y, open V∋y smooth, U dense on V; conclusions: affine C, smooth of relative dimension 1, geometrically integral, c↦y, g⁻¹U nonempty dense | equal, clause for clause |
| Layer 6 Example | torus component, neat level | component with an F_q-point of a finite étale F_q-scheme is Spec F_q; §2.4 step 3 gives A¹, constant map, c=0 | matches |
| §5.4, first theorem alone | T=Res_(Q(i)/Q)G_m, p=5 | ψ(1,i)=Tr(i·1·(−i)/2)=1; f_1=e_1+e_2/5, f_2=e_2: ψ(f_1,f_2)=u, Gram determinant u²; (1,2)f_1=f_1+(1/5)f_2 | self-dual, not stable; the map needs no Layer 4 input: R01 |
| §5.4 Check 2 | y²=x³+x over F₅, F₃ | F₅: counts 1,0,1,1,0, #E=4, trace 2; F₃: 1,0,2, #E=4, trace 0; (2y)²=−y² | keep |
| §5.5, ordinary transfer | KZ Lemma 2.2.8(2) | [b]=[b]_μ iff [f(b)]=[b′]_μ′; KZ line 461–462, after the p.11 marker at 459 | true; locator is R02 |
| §0.3, free action | g∈K_2^p fixing [x,a] | q∈G(Q)∩aKa⁻¹ fixes x, so its adjoint image is torsion in a neat group, q∈Z(Q)∩K, finite and torsion-free, q=1 | free under neatness |
| Layer 0 Example | Y(9)→Y(3) | the kernel of GL₂(Z/9)→GL₂(Z/3) is 1+3M₂(Z/3), of order 3⁴=81; −1∉K(3) | degree 81 |
| §0.1 Check 2 | y²=x³−x over F₃; E×E | counts 1,1,1, #E=4, trace 0; ker F=α_p², its order-p subgroups a P¹ | fibre of dimension ≥1 |
| §0.1 Check 4 | [[1,ε],[0,1]], e₁=diag(1,0) | g e₁ g⁻¹=[[1,−ε],[0,0]] | keep |
| §1.7 Check 3 | blow-up of A¹_Zp at (p,t) | generic fibre A¹_Qp; special fibre: strict transform and exceptional P¹, 2 components | keep |
| §1.8 | chain-level and single-lattice models | full prime-to-p level forces trivial inertia on T_ℓ, good reduction; the finite normalization lifts R-points uniquely | bijection holds for both |
| §1.9, global normality | π⁻¹(Y) for G^fix=G° | fibres geometrically connected, so irreducible; a component of q⁻¹(Z), which is smooth over normal Z | normal |
| §2.1 Checks | GU(1,1) split at p; GSp_(2g) | Z^c=U(1)⊇μ₂, G_m at p; maximal compact central torus 1, Z^c=μ₂ | keep |
| Conventions, quasi-tame | Q_3(∛3), rank-2 norm torus | ζ₃∉Q_3, closure S_3 of order 6, wild; rank-2 quasi-tame shapes: tame, Res from a quadratic field (image divides 8), two rank-one (divides 4) | not quasi-tame |
| §3.8 Check 3 | scalar i in GU(1,1), p=5 | i·ī=1; order 4; i^k∉K_1^p for k=1,2,3 | inertia Z/4 |
| §3.9 Check 4 | GL₂, edge midpoint | w=[[0,1],[p,0]], det −p, w²=p; fixer I; I/G_m of dimension 3; PGL₂ fixer has 2 components | not the full fixer |
| §3.10 Check 1; Layer 3 Example | GU(1,1); j=diag(p,1) | 1+3=4, 1+5=6; [[1,0],[p,1]]↦[[1,0],[1,1]]∉I | keep |
| §4.1 Check 1 | ordinary elliptic fibre | D slopes {0,1}; μ_h=(1,0) on V=H₁, μ_h⁻¹=(−1,0), b_x slopes {0,−1}, κ=−1 | keep |
| §4.5 Remark | SL₂, d=diag(3,1) | det(d/√3)=1; normalizer determinants ±(a²+b²), even 3-adic valuation; 1/3 odd | keep |
| §4.9 Checks 4–6 | 1±2i; π²=−3; δ_D=[[0,−1],[5,0]] | (1+2i)^m(1−2i)^n=1 only for m=n=0, e=1, dimension 2; character group Z²/Z(2,−2)≅Z⊕Z/2, e=2, dimensions 2 and 4; δ_D²=−5 | keep |
| §4.9 Check 2 | N(z)=5 over Q₂₅/Q₅ | unramified norms have even valuation, v(5)=1; uv=5 has (5,1) | m₀=2 needed |
| Conventions Checks 2–4 | y²=x³+x over F₅, F₂₅; ζ of order 24 | T²−2T+5, T²−(2/5)T+1/5; 4−10=−6, 4/25−10/25=−6/25; ζ·ζ⁵=ζ⁶, ζ⁻⁶=ζ¹⁸, ratio ζ¹²=−1 | keep |
| §5.3 Checks | Q(√2), Q(√−2), Q(i), Q(√−11) at 5 | 2, 3 non-squares; 5=(2+i)(2−i); −11≡4; Tr of Ψ_C(a+ib,h(a+ib)) is 2(Ψ(a,ha)−Ψ(b,hb)) | keep |
| §5.10, convention | geometric Frobenius on H¹ | ρ∨(g)=(π_*)ᵀ gives g=π_*⁻¹=γ_x on V≅T_ℓ⊗Q | agrees with KZ §4.4.12 |
| §7.1, K_ℓ and K^(ℓ) | K^p compact open | projection to G(Q_ℓ) is open, image compact open; K^p/K^(ℓ)→K_ℓ a continuous bijection of compact groups | torsor under K_ℓ |
| §7.2 Check 1; Downstream | g=diag(1,1/5); inversion | (T−1)(T−1/5)=T²−(6/5)T+1/5; (2/5,1/5)↦(2,5) | keep |
| §7.3 | π·π̄=q | π⁻¹=π̄/q, a unit away from p; subquotients of tensor products keep units | holds at every place away from p |
| §7.6 headline | KZ line 2104–2106, 2433–2439 | a field with a split prime over almost every ℓ is Q; Conj(G)(Q)→Conj(G)(Q_ℓ) injective | unique |
| §3.8, §4.13, §5.9, §5.10, §6.3, §4.7 with §5.4 headlines | KPZ line 3735–3763; HT line 1095–1105; KZ line 1900–1903, 2038–2042, 2322–2327, 1887–1896 | README hypotheses equal the sources'; §4.13 adds the framing degree, §5.4 the lattice hypothesis of KZ line 1762–1764 | hold |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the revisions of the manifest): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean:136). All exist where cited. Neither pin has a declaration for Shimura varieties, parahoric group schemes, Newton strata or a conjugacy quotient. The 29 distinct backticked tokens of the README are library names, the supplier's `exists_same_field_curve`, the file name and formulas; none is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. One `import Mathlib`, one module docstring, the namespace, 0 declarations. The one-tactic probe and the `#check @name` comparison have 0 inputs; nothing changed. No padding is possible.

**Headlines.** Seven, from the last scope paragraph: §7.6 (KZ Theorem 5.1.4), §3.8 (KPZ Theorem 7.2.21), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §4.13 (HT Corollary 2.1.9), §4.7 with §5.4 (HT Corollary 1.3.16, KZ Theorem 4.4.4), §6.3 (KZ Corollary 5.2.7). Each is named in the module docstring with the carrier it lacks. None is statable at the pins; no stand-in is used.

**Suppliers.** `roadmaps resolve` lists nothing unresolved. I read the cited headings again at the current heads of 24 suppliers (6 on main, 18 open) and LefschetzPencilsAndVanishingCyclesPartII §2.4 on main: every cited section and layer exists under its number. ArithmeticGaloisRepresentations §1.11 is headed "Uniqueness of lattices and symplectic models" and contains the named target **Reductive quotients over fields and DVRs** with the conjugation case (main line 1436–1462), as cited. MotivesAndAlgebraicCycles §6.3 has the closed-immersion criterion; ReductiveGroupsPartII has Lang's theorem at §RG2.3.7 and the criterion of KZ Lemma 4.2.4 at §RG2.3.3, both inside the cited §RG2.3. No never-cite roadmap is cited. Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 262 roadmaps, 2547 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. LefschetzPencilsAndVanishingCyclesPartII is entry 4 of the merge order, this roadmap entry 363.

**Gaps.** 22 slugs in the README, 22 contracts, 22 entries in `design/plan.json`; the three sets are equal and each contract names the plan's supplier. Searched by object at the current heads: ReductiveGroupsPartIII §3.5 is over number fields and has no R-smooth, stabilizer-immersion or compact-quotient statement; it takes Noot's comparison as a hypothesis of its §4.5; GlobalShtukasAndFunctionFieldLanglands §6.2 treats irreducible sheaves; ReductiveGroupsPartII lists R-smoothness outside its scope (main line 85–99) and has no stable-lattice statement for full fixers; ShimuraCompactifications has no lattice-chain Siegel moduli and nothing for Hodge type (its line 2635); ShimuraVarieties, ShimuraData, CrystallineCohomology, HeckeStacksAndLocalShtukas, AlgebraicModuliForArithmeticGeometry and GeometricSatakeAndFusionPartII do not state what their gaps ask. None is already provided. An acceptance would be conditional on the 22 gaps.

**Shape.** Every layer ends with Examples and Dependencies. Every Definition and Construction has an API list and at least three Checks (27 sections; 3 to 6 Checks each). Every theorem has its hypotheses and a locator. 62 of 63 numbered sections have one statement and one *Needs:* line; §5.4 is R01. Residue search (LaTeX delimiters, pull-request numbers, round labels, job ids, machine paths, "optional", "deferred", "so far", HTML anchors): no hit; every "Lemma" is a source's lemma, Krasner's lemma or the unit-eigenvalue lemma of §7.3.

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. `roadmaps grep` for integral models of abelian type and Kottwitz–Rapoport strata on Shimura models finds only GeometricSatakeAndFusionPartII (local models, cited). On main, Kisin–Zhou is cited by ArithmeticGaloisRepresentations (§5.13, the Chebotarev step, cited here), LefschetzPencilsAndVanishingCyclesPartII (§2.4, cited), ReductiveGroupsPartII (fixers, cited) and RootSystemsPartII (coroot combinatorics for the local-model curve, consumed by GeometricSatakeAndFusionPartII §5.5). `Suggested.lean` declares no name. Ownership against the open pull requests was checked with `roadmaps grep` and `roadmaps show` at the 455 open heads.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, PELModuliPartII, ReductiveGroupsPartII and AbelianSchemesAndArithmeticModuli (the third list is empty); nothing shared: very-good embeddings and adapted lifts belong to the first, local models and their curves to the second, Conj′ and the abelian-variety application to the third, B(G) to the fourth, unitary PEL models to the fifth, fixers and quasi-tame groups to the sixth, Tate modules and Serre–Tate theory to the seventh.

**Copyright.** Wording: 21 passages set beside the source lines: the 15 sampled, and Conventions, R-smooth and quasi-tame (KPZ line 446–448, 713–715), §2.1 Definition (KZ line 1481–1490), §4.11 (HT line 989–1009), §4.13 sketch (HT line 1098–1105), §6.3 sketch (KZ line 2341–2349) and the first docstring item of `Suggested.lean` (KZ line 2104–2106). The longest shared runs are forced phrases of five to six words ("a tamely ramified extension of K_i", "a discrete valuation ring of mixed characteristic"). Arrangement: KZ runs §2.3–2.4, §3.1–3.4, §4.1–4.4, §5.1–5.3, §6.1–6.3. Its §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1 to 4 rest on KPZ, KP and HT; Layer 5 joins KZ §4.3, §4.4 and Theorem 4.1.11; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order of Layers 4 to 7 is forced (§5.6 needs §4.13; §6.3 needs §5.4; §7.4 needs §5.10 and §6.3). No table, figure or list of examples is taken over.

Source independence: 21 passages compared with 4 sources (KZ, HT, KPZ, KP), none shared; largest share KZ, 57 of 127 locators; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the versions `sources.toml` records; locators are for the recorded versions.
- The 22 declared supplier gaps are contracts; their future proofs cannot be checked here.
- HT Appendix A (Lemma A.4, Proposition A.6, Corollary A.7) was located by page (pp.38–39) and not read in full; it is cited only by gap:cr-isocrystal-tensor-descent and §0.6.
- Whether the Newton class and I_x of a point depend on the chosen Hodge embedding was not settled; the README asserts no independence.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), p.34: the source says the inertia coinvariants of the cocharacters of G^ab are torsion; it should be torsion-free, as Lemma 4.2.4 requires; affects nothing.
- **Misprint** in KZ at §4.4.2, p.43: the source indexes the strata by the acceptable set of G; it should be that of G_2; affects nothing.
- **Misprint** in KZ at §4.4.5, p.43: the source writes the étale tensors preserved by the isogeny group with the crystalline index 0; it should be the ℓ-adic tensors at the point, as in §4.1.10; affects nothing.
- **Misprint** in HT at §2.1.3, p.21: the source defines the integral isogeny group as the Q_p-points meeting Aut; it should be the Q-points meeting Aut, as in the proof of Lemma 2.1.4, p.22; affects nothing.
- **Gap** in KZ at Proposition 5.2.3(ii) and Corollary 5.2.7(ii), pp.49, 52: the source takes the inverse image of a geometric stratum as an open of the curve over F_q; it should note the stratum index is Frobenius-fixed, which geometric irreducibility of the curve forces; affects the proof.
- **Gap** in KZ at the proofs of Corollary 5.2.7 and Proposition 5.3.5, pp.52–54: the source applies a Bertini corollary for smooth projective varieties to a smooth chart of a stack; it should use a same-field curve through a smooth rational point without projectivity; affects the proof.

## For the human reviewers

- Licence: `sources.toml` records HT and K17 from author pages (`licence_class = "author-page"`) and KZ from arXiv v2, not collated with the Annals version (its `version_note`); the published texts were not read.
- Scope: the roadmap states 22 supplier gaps on 11 other roadmaps (`packages/ShimuraVarietiesPartII/README.md`, Exact supplier contracts); its headline theorems hold only once those suppliers accept them.
- Scope: five `gap:rg3-…` contracts and gap:compact-quotient-borel place local p-adic statements in ReductiveGroupsPartIII Layer 2, headed "Global tori and real cocharacter adjustment" at its head; ReductiveGroupsPartII on main lists R-smoothness outside its scope (lines 85–99).
- Scope: LefschetzPencilsAndVanishingCyclesPartII on main (line 691–693) says the rational lift to a smooth atlas belongs to the Shimura roadmaps; this package asks AlgebraicModuliForArithmeticGeometry Layer 4 for it (gap:rational-stack-presentation).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "99b9ecfa7eb49966997c00d9af748cf675c2fd6f", "job": "REV-PKG-ShimuraVarietiesPartII~15", "model": "fable", "worker": "chris-x30"} -->
