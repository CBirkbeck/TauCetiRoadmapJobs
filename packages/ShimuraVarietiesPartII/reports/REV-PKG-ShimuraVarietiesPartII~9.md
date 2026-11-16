<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6903821038 -->
Review (claude) of 69a24e8

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §5.3: the good embedding of the matched datum has no owner

   **Location.** `packages/ShimuraVarietiesPartII/README.md:1084–1090` (§5.3). Statement: "the compact-centre exact sequences and torsion-free coinvariants yield the required connected fixer and a good integral lattice embedding". Sketch: "Use the very-good lattice-chain embeddings of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.13–3.17". The `*Needs:*` line lists only §3.13 and §3.16 of that roadmap.

   **Claim.** The cited supplier sections give a good integral Hodge embedding of the matched datum G_3 of every strongly acceptable setup.

   **Witness.**

   - KZ line 1798–1803 (Lemma 4.3.8(2), p.41) gets this embedding from Lemma 4.1.4 (KZ line 1277–1282, p.29), which is Proposition 3.1.12 (KZ line 926–936, p.21). That proposition rests on Proposition 3.1.9 and Lemma 3.1.10 (KZ line 875–916, pp.19–20). No target of this README, no supplier section and no pinned declaration states any of the four. A search of every roadmap README, on main and at the open heads, for "3.3.25", "Proposition 3.1.9" and "3.1.12" finds no statement of them.
   - The supplier's §3.13 assumes "(NE): no Dᴴ factor", and its §3.16 begins "In the nonexceptional setting". Strongly acceptable triples include Dᴴ factors (KZ line 1495, Proposition 4.2.3(1); README §2.5, third Check).
   - The supplier's §§3.14 and 3.17 treat `Res GO⁺`, `Res GU⁺` and their explicit scalar enlargements. G_3 is none of these.
   - Even without Dᴴ factors, §3.13 needs G_3 inside a product of restrictions of scalars with equal derived groups and a representation of prescribed minuscule shape. The centre of G_3 is an extension of G_m by Z^c_(G_2)×Z^c_(G_1), and the sketch does not produce such an ambient group.
   - The sketch (§§3.13–3.17) and the `*Needs:*` line (§3.13; §3.16) disagree with each other.

   **Exact repair.** Use the source's route and declare the local existence theorem as a supplier gap.

   1. Under `### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII` add:

      > What FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII must provide (gap:good-symplectic-embedding-existence): Layer 3, existence of good symplectic embeddings (new target). For p>2, a finite extension F of Q_p and a local-model triple (G,{μ},G°) over F that is acceptable and of local Hodge type, with p not dividing |π₁(G_der)| and the centralizer of a maximal F̆-split torus R-smooth, prove that a faithful symplectic representation ρ:G→GSp(V,Ψ) containing the scalars, with ρ∘μ of the standard minuscule type, yields a good integral symplectic embedding of a stabilizer scheme with connected parahoric G° into GL(Λ), Λ a lattice in the F-space underlying (V⊗_F K)^r with the form `Σ Tr_(K/F)∘(Ψ⊗K)`, for a finite extension K/F splitting G and some r≥1 (KZ Propositions 3.1.9 and 3.1.12 and Lemma 3.1.10, pp.19–21). The closed immersion of stabilizer schemes into the restriction of scalars is ReductiveGroupsPartIII (gap:rg3-stabilizer-closed-immersion) and is not part of the gap.

   2. Add the same entry to the `gaps` list of `design/plan.json`: `slug` `good-symplectic-embedding-existence`, `id` `gap:good-symplectic-embedding-existence`, `supplier` `FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII`, `section` `Layer 3, existence of good symplectic embeddings (new target)`, and `needs` the text above from "For p>2" on.

   3. In §5.3 replace the sentence "Use the very-good lattice-chain embeddings … §RG2.3." by:

      > The connected fixer follows from the torsion-free coinvariants by the criterion of ReductiveGroupsPartII §RG2.3. For the lattice, π₁(G_3,der)=π₁(G_1,der) is a 2-group (§2.5), so p does not divide its order. The centre Z_(G_3) is an extension of G_m by Z^c_(G_2)×Z^c_(G_1), a product of restrictions of tame tori, so it is R-smooth (gap:rg3-r-smooth-tori), and then so is the centralizer of a maximal Q̆_p-split torus (gap:rg3-r-smooth-abelian-type). The existence theorem for good symplectic embeddings (gap:good-symplectic-embedding-existence), applied to ι_3⊗Q_p on V_3=V_1⊕V_2, gives a good embedding on (V_3⊗K)^r for a splitting field K/Q_p. It is the localization at p of the Hodge embedding of (G_3,X_3) on the Q-space (V_3⊗_Q K′)^r with form `Tr_(K′/Q)∘Ψ_3`, where K′ is a totally real number field with a single place above p and completion K there (KZ Lemma 4.1.4, p.29). The nonexceptional chains of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13 are not used: a strongly acceptable target may have Dᴴ factors.

   4. In the `*Needs:*` line of §5.3 replace "FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.16" by "FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII Layer 3 (gap:good-symplectic-embedding-existence); §2.5". Add the gap to the Layer 5 `### Dependencies`. Its §3.13 and §3.16 entries entered that list only through §5.3 and can go.

   5. Add to the citation of §5.3 "; Lemma 4.1.4, p.29, with Propositions 3.1.9 and 3.1.12, pp.19–21, for the good embedding". The KZ entry of `sources.toml` already covers §§3–5.

   **Repair test.** On the witness, a strongly acceptable target with a Dᴴ factor: the gap's hypotheses do not mention (NE). They are the three facts the new sketch derives: p∤|π₁|, because a 2-group has odd-prime-free order; R-smooth centre; R-smooth centralizer. The global form is a Hodge embedding: G_3(Q) acts K′-linearly and scales `Tr_(K′/Q)∘Ψ_3` by its Q-rational multiplier. Over R the space is a sum over the real places of copies of V_3,R with the form Ψ_3 on each, so `Ψ(x,h(i)x)` is definite; a complex place would contribute Ψ(a,h(i)a)−Ψ(b,h(i)b), which is indefinite, so "totally real" is needed. A field K′ with one place above p and completion K exists by Krasner's lemma and weak approximation. KZ leaves this globalization to the reader ("easily seen", KZ line 1281–1282); the K′ construction is mine and is not in the source.

2. **F02** (P3) the integral stack at non-neat level is constructed only for Hodge models

   **Location.** `README.md:1346` (§7.6): "y∈S_K(F_q) a point of the integral model (the stack of §0.2 when K^p is not neat)". `README.md:223` (§0.2) forms the stack from the model of §0.1 only (its `*Needs:*` is "§0.1; SchemeAndStackFoundations §§1.17–1.23").

   **Claim.** §0.2 supplies the integral stack of a strongly acceptable triple at any prime-to-p level, as used in §§6.3, 7.1 and 7.6.

   **Witness.** The model of a strongly acceptable triple is the descended model of §3.8, not a Hodge normalization of §0.1. KZ line 1753–1754 (§4.3.5, p.40) defines its stack separately, as the quotient of the pro-level model by K_2^p. §3.8 states only the tower at sufficiently small levels.

   **Exact repair.** Append to the theorem of §3.8: "At a prime-to-p level K_2^p that is not sufficiently small the model is the quotient stack [S_(K_2,p°K_1^p)/(K_2^p/K_1^p)] for a neat normal K_1^p⊂K_2^p, formed and shown independent of K_1^p as in §0.2 (KZ §4.3.5, p.40)." Add "§0.2; SchemeAndStackFoundations §§1.17–1.23" to the `*Needs:*` line of §3.8, and "§0.2" to the Layer 3 `### Dependencies` (the supplier section is already listed there).

   **Repair test.** For K_1^p=K_2^p neat the quotient is by the trivial group and returns S_K. Two neat normal subgroups are compared through their intersection, as in §0.2; this uses only the finite étale transitions that §3.8 states.

Two findings: R01 (P2) and R02 (P3); one is blocking. Both findings of round 8 are repaired, and the repaired §7.1 passes the adversarial pass. R01 is new: it comes from carrying the round-8 `*Needs:*` pattern down from roadmap names to section numbers and then opening KZ at the step concerned. This review changed no authored file and fetched no source (`sources.toml` is unchanged; no `needs-references.toml` was created). No maintainer notes were supplied.

## Previous findings, verified first

| Finding (round 8) | Repaired passage | Status |
|---|---|---|
| F01 (P3), §7.1 does not define `K_ℓ`; §7.6 at any level | `README.md:1260`: "Write K_ℓ for the image of K^p under the projection G(A_f^p)→G(Q_ℓ), a compact open subgroup onto which K^p surjects, and K^(ℓ) for the kernel of K^p→K_ℓ". The passage then forms the K^p-torsor at neat level, divides by K^(ℓ) and extends to G(Q_ℓ). | **Repaired.** The fix worker changed the setting to strongly acceptable triples and replaced the GL₂ witness by GU(1,1); both changes are correct (GL₂ has Z^c=μ₂ and is outside Layer 7). Values recomputed below. |
| F02 (P3), two `*Needs:*` lines omit a supplier | `README.md:859` (§4.3): "*Needs:* §4.1; §4.2; §0.6; BunGAndNewtonStrata §§1.22–1.26, 2.16; PadicDifferentialEquationsAndRigidCohomology §RD.3.43." `README.md:665` (§3.4): "…; §0.1; ShimuraVarieties §§6.3–6.6." | **Repaired** at the level of roadmap names. The same comparison at the level of section numbers gives one further hit, §5.3, which is R01. |

No finding of the last repair report was marked not actionable; nothing is re-raised.

## Verified sound

**Coverage.** The whole README was read (1388 lines; 63 numbered targets in 8 layers). `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list of `design/plan.json` were read. For text that round 9 did not touch I rely on the round-8 table where its rows carry values, and recomputed the rows of this round's sample.

**Mechanical checks** (scripts in the scratch directory, over all 63 targets):

- every target has a `*Needs:*` line and a source locator;
- every Definition or Construction has an API list and at least three Checks;
- 21 gap slugs in the README, the same 21 in `design/plan.json`, 21 contracts of the form "What X must provide (gap:…)", and each gap named in a target appears in that target's `*Needs:*` line;
- supplier names in a target's text against its `*Needs:*` line: the only hit is IgusaVarietiesAndTorsionConcentration in a Check of §4.3, which the supplier contract covers;
- the same comparison by section number: the only real mismatch is §5.3 (R01);
- residue grep (LaTeX delimiters, pull-request numbers, round labels, machine paths, "optional", "deferred", "removed", "so far", HTML anchors, `lemma`): one hit, the prose "the unit-eigenvalue lemma" in §7.4, which is not a keyword.

**Principles.** No route-specific shortcut, no re-planned roadmap, no computational algorithm, no sorry'd data, no `set_option`.

**Seeded source sample: 15 of 15 read at their locators.** The author flags no locator as unverified.

| Target | Locator as read | Result |
|---|---|---|
| 0.1 | KZ §4.1.2–4.1.7, pp.29–31 (KZ line 1257–1355); KPZ §7.1.2, p.72 (KPZ line 3168–3180); Theorem 7.1.8, p.74 (KPZ line 3254–3261) | supported: closure then normalization; assumptions (A)–(C) as in Conventions |
| 0.5 | HT Proposition 1.3.7, pp.17–18 (HT line 774–807) | supported; the comparison of lifts is inside the completed normalization |
| 1.2 | KZ Proposition 4.1.9, pp.31–32 (KZ line 1361–1391), under (A′)–(B′) of §4.1.3 (KZ line 1272–1275) | supported: the component through the lift is the adapted ring; neat level and very-goodness at y are hypotheses |
| 2.6 | KZ Proposition 4.2.3, Lemma 4.2.4, pp.34–35 (KZ line 1491–1549) | supported; "torsion-free" is the correct reading of item (5) (Source issues) |
| 3.7 | KP proof of Corollary 4.6.15, Corollary 4.6.18, journal pp.203–205 (KP line 3313–3345, 3391); KPZ §7.3.1(3), pp.86–87 (KPZ line 3814–3846) | supported: freeness of Δ by the twisting argument, at conjugate levels |
| 3.8 | KPZ Theorem 7.2.21, pp.84–85 (KPZ line 3735–3763); Proposition 7.1.14, pp.75–76 (KPZ line 3317–3348) | supported; normality follows from item (2) |
| 3.10 | KZ Theorem 4.2.6(3), Remark 4.2.7(2), pp.35–36 (KZ line 1552–1580); KPZ Proposition 7.1.14(3) (KPZ line 3329–3337) | supported: connected reduction when the fixer is connected |
| 4.1 | HT §1.3.8, p.18 (HT line 808–815); KZ §4.4.2, p.43 (KZ line 1875–1884) | supported |
| 4.7 | KZ Theorem 4.4.4, p.43 (KZ line 1887–1896); HT Corollary 1.3.16, p.20 (HT line 915–925) | supported; the README adds the existence of the ordinary class, which HT §1.3.15 asserts without proof |
| 4.9 | HT §2.1.5–2.1.7, (2.1.7.1)–(2.1.7.2), pp.22–24 (HT line 1011–1069); K17 (2.1.2), p.29 (K17 line 1281–1300) | supported: frame for m sufficiently divisible; norm of length rm |
| 5.5 | KZ Proposition 4.4.8, (4.4.9.1), pp.44–45 (KZ line 1938–1966) | supported |
| 5.6 | KZ Proposition 4.4.10, p.45 (KZ line 1973–1993) | supported; exactness is checked at one ℓ by the Tate comparison |
| 5.8 | KZ Theorem 4.1.11, Remark 4.1.12, pp.32–33 (KZ line 1410–1437) | supported; very-goodness at y is a hypothesis |
| 6.2 | KZ proof of Corollary 5.2.7, pp.52–53 (KZ line 2333–2336) | supported |
| 6.3 | KZ Proposition 5.2.3, p.49 (KZ line 2169–2173); Corollary 5.2.7, pp.52–53 (KZ line 2322–2345) | supported |

Also read: KZ §4.2.1–4.2.2 (KZ line 1476–1490), §4.3.5–4.3.8 (KZ line 1751–1848), §4.4.5–4.4.14, §5.1.1–5.1.5, §5.3.3–5.3.7, §3.1.4–3.1.12 (KZ line 836–936); HT Lemma 1.3.6, Lemma 1.3.9, Proposition 1.3.10, Theorem 1.3.14, §1.3.15, §2.1.3, Lemma 2.1.4, Proposition 2.1.6.

**Adversarial table** (repaired passages, this round's sample, headlines, targets of the findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §7.1, K_ℓ as image | GU(1,1), E=Q(i), p=5, level cut out by χ₃(ν(k₃))χ₇(ν(k₇))=1 | 3 and 7 are inert (both ≡3 mod 4); ν(z)=z·z̄ on scalars, and the unramified norm is onto Z_v^×; image in G(Q₃) is G(Z₃), index 1; K^p∩G(Q₃)=ker(χ₃∘ν), index 2 | keep |
| §7.1, intersection model | same | (K^p∩G(Q₃))·K^(3) is cut out by χ₃=1=χ₇: index 4 in the product level, 2 in K^p; its tower lies over a double cover | wrong model excluded |
| §7.1, triple is strongly acceptable | GU(1,1), p=5 | 5=(2+i)(2−i) splits; G_der,Q5=SL₂ split; Z^c=U(1) contains μ₂ and is G_m at 5 | keep |
| §7.1, K^p-torsor | q∈G(Q) fixing [x,g] at neat level | image of q in G_ad is neat and lies in a compact group, hence trivial; q∈Z_G(Q)∩K, a finite group for Hodge type, trivial by neatness; then k=1 | holds |
| §7.1, negative control | Res_(F/Q)GL₂, F real quadratic | units ≡1 mod N have rank 1, so are infinite; a central rational z gives [x,gz]=[z⁻¹x,g]=[x,g]; the action is not free | hypothesis needed |
| §7.1, product level | K^p=K_ℓK^ℓ | K^(ℓ)=K^ℓ; preimage of K′_ℓ is K′_ℓK^ℓ; the quotient is KZ's limit (KZ line 2071–2073) | agrees |
| §7.1, push-out | a K^p-torsor T | (T/K^(ℓ))×^(K_ℓ)G(Q_ℓ)=T×^(K^p)G(Q_ℓ), since K^p/K^(ℓ)≅K_ℓ | holds |
| §3.4, §4.3 `*Needs:*` | text against line | ShimuraVarieties §§6.3–6.6; §0.6 and §RD.3.43: all listed | keep |
| 0.1 Check | E: y²=x³−x over F₃ | x=0,1,2 give 0,0,6≡0: 3 affine points, #E=4, trace 0 | keep |
| Conventions; 4.9 | E: y²=x³+x over F₅ | x=0..4 give 1,0,1,1,0 points; #E=4, trace 2; π=1±2i of norm 5; γ has eigenvalues (1∓2i)/5; over F₂₅ trace 4−10=−6 | keep |
| 4.9, norm | ζ of order 24, σ(ζ)=ζ⁵ | ζσ(ζ)=ζ⁶; dual frame ζ⁻¹σ(ζ⁻¹)=ζ⁻⁶=ζ¹⁸; ratio ζ¹²=−1; ζ² is neither | keep |
| 4.9 | δ_D=[[0,−1],[5,0]] | δ_D²=−5; δ_D⁻ᵀ=[[0,−1],[1/5,0]], square −1/5 | keep |
| 4.9 | norm-one torus of Q₂₅/Q₅ | N(z)=5 has no Q₅-point: v₅ of a norm is even, v₅(5)=1 | keep |
| 3.10 Check | GU(1,1) curve | dim G=5, dim G_ad=3; frame spaces of dimension 1+3=4 and 1+5=6 | keep |
| 6.2 | connected against Z/2 | H¹(F_q,connected smooth)=1; H¹(F_q,Z/2)=Hom(Ẑ,Z/2)=Z/2 | keep |
| 2.6 | coinvariants 0, Z, Z/2 | 0 and Z are torsion-free and the fixer is connected; Z/2 fails the snake-lemma step (KZ line 1547–1549) | keep |
| 1.2 | two branches through one Siegel point | KZ completes the closure, not the normalization (KZ line 1362); the component through the lift is Spf A_G | keep |
| 4.7 headline | no ordinary class; not locally integral | quaternion division group: slopes (0,−1) shift to (1/2,−1/2), not allowed; Γ₀(p) node: two branches | hypotheses needed, both stated |
| 3.8 headline | exceptional type A; Dᴴ | KPZ line 3735 has no (NE) hypothesis; (NE) enters only the connected reduction (KPZ line 3757–3758) | keep |
| 5.6 | C_1=ker(G_3→G_1) | central in G_3, acts through the lift (KZ line 1984–1987); exact at ℓ by centralizers | keep |
| 5.9, 5.10 headlines | ordinary E/F₅ | lift with CM by Z[i]; torus of rank 2 = rank GL₂; γ₀ with (trace, det)=(2/5,1/5), elliptic | keep |
| 6.3 headline | marked point of degree m>1; constant map | f(c)=x fails over F_q; the preimage of the higher stratum is empty | keep |
| 7.6 headline | uniqueness; H¹ convention | Conj(G)(Q)→Conj(G)(Q_ℓ) is injective; (2/5,1/5)↦(2,5) | keep |
| 5.3 (R01) | strongly acceptable target with a Dᴴ factor | supplier §3.13 and §3.16 assume (NE); the source uses Proposition 3.1.12, with no (NE) | gap to declare |
| 5.3 (R01), globalization | K′ totally real against one complex place | real places: Ψ(x,h(i)x) definite; complex place: Ψ(a,h(i)a)−Ψ(b,h(i)b), indefinite | totally real needed |
| 3.8 (R02) | K_1^p=K^p neat | quotient by the trivial group is S_K | sentence to add |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`; both are the checked-out heads and the revisions of `lake-manifest.json`): `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112), `Isocrystal.frobenius` (:124); `TauCeti.AlgebraicGeometry.AbelianVariety` (AbelianVariety/Basic.lean:95); `AbelianVariety.End` (End/Basic.lean:74, `Additive (A ⟶ A)`); `Matrix.transpose_mul_J_mul_eq_det_smul` (SymplecticMultiplier.lean:63); `TauCeti.reductiveCommHopfAlgProperty` (Reductive/Basic.lean); `conjugationAlgHom` (Hopf/Conjugation.lean:66), `productMap_comp_conjugationAlgHom` (:107), `conjugationAlgHom_counit_left`, `_counit_right`, `_coassoc` (:176, :196, :248); `TauCeti.ComoduleAlgebra.coinvariants` (ComoduleAlgebra.lean). All exist where cited. No backticked name in the README is presented as this roadmap's own.

**Lean.** `lake env lean` on `packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file has one `import Mathlib`, one module docstring, the namespace and 0 declarations. The one-tactic probe and the `#check @name` comparison therefore have 0 inputs; nothing changed.

**Headlines.** Seven: §3.8 (KPZ Theorem 7.2.21), §4.7 (density), §4.13 (HT Corollary 2.1.9), §5.9 (KZ Theorem 4.4.6), §5.10 (KZ Corollary 4.4.13), §6.3 (KZ Corollary 5.2.7), §7.6 (KZ Theorem 5.1.4). Each is named in the module docstring with the carrier it lacks. None is statable at the pins. A grep of both pins: "Parahoric", "BruhatTits" and "NewtonStrat" occur in 0 files; "Shimura" occurs in 1 Mathlib file and in Tau Ceti only in Hecke-ring and modular-form files that cite Shimura's book; "Dieudonn" has no Dieudonné-module carrier in Tau Ceti. No padding is possible in a file with no declaration.

**Suppliers.** The citation resolver, run on the README against main and the open heads, lists no cross-roadmap citation and no Lean name found nowhere. Contents read this round:

- FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.13, 3.14, 3.16, 3.17, its Layer 3 headings and its contract with GeometricSatakeAndFusion for the Hodge immersion of local models (the basis of R01);
- ReductiveGroupsPartIII §5.5, which takes the common class as a hypothesis, and the headings of its §§0.7, 1.2 and 3.5;
- the scope sections of GeometricSatakeAndFusionPartII, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration and ReductiveGroupsPartII.

No never-cite roadmap is cited.

Dependency check, prescribed command with `--movable`, exit 0:

```text
depcheck: 235 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gaps.** The 21 declared gaps are precise and each has a named supplier and section. The gap of R01 would be the 22nd; `gap:rg3-stabilizer-closed-immersion` already carries the stabilizer-scheme input of its route, so the new gap does not ask for it again.

**Duplication and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id defined only by a revision and no second copy. The board's package index lists two other packages, AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this subject. Ownership against the open pull requests was checked with the roadmap search for the objects of R01 (existence of good embeddings); no roadmap states them.

Overlap check: read FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration and ReductiveGroupsPartII (the third list is empty); nothing shared: good and very-good embeddings and adapted lifts are owned by the first (integral moduli are named there as downstream), local models and same-field Schubert curves by the second, Conj′ and the abelian-variety application by the third (its §5.5 takes the class of §7.6 as a hypothesis), B(G) by the fourth, PEL Newton strata by the fifth, fixers and parahorics by the sixth.

**Copyright.** Wording: 20 passages were set beside the source lines (the 15 sampled, plus §7.1 against KZ §5.1.1, §7.6 against KZ Theorem 5.1.4, §5.3 against KZ Lemma 4.3.8, §4.11 against HT Lemma 2.1.4 and §4.5 against HT Proposition 1.3.10). The longest shared runs are forced phrases of five or six words ("discrete valuation ring of mixed characteristic", "smooth of relative dimension dim"). Arrangement: KZ's order is §2.4, §3, §4.1, 4.2, 4.3, 4.4, 5.1, 5.2, 5.3. KZ §4.1 is spread over Layers 0, 1, 4 and 5; Layers 1, 3 and 4 rest on KPZ, KP and HT; Layer 5 joins KZ §4.3, §4.4 and Theorem 4.1.11; Layer 7 joins KZ §5.1 and §5.3 after §5.2. The order 4→5→6→7 is forced (§5.6 needs §4.13; §6.3 needs §4.7; §7.4 needs §5.10 and §6.3). No table, figure or example list is taken over.

Source independence: 20 passages compared with 5 sources (KZ, HT, KPZ, KP, K17), none shared; largest share KZ, 34 of 82 source mentions in the 63 locator lines; contents compared with KZ: independent.

## Not verifiable

- The published versions of KZ (Annals), HT (Duke) and K17 (JAMS) were not collated with the recorded preprint or author versions; locators are for the versions `sources.toml` records.
- The 21 declared supplier gaps are contracts; their future proofs cannot be checked here.
- KZ Proposition 3.1.9 rests on KPZ Theorem 3.3.25 and on two preprints it cites for Lemma 3.1.10; I read the KZ statements and proofs, not those inputs.

## Source issues

- **Misprint** in KZ at Proposition 4.2.3(5), printed p.34: the source says the inertia coinvariants of the abelianization are torsion; it should be torsion-free, as Lemma 4.2.4 requires; affects a stated result.
- **Gap** in KZ at §5.1.1, printed p.47: the source says the level is a product at ℓ and then states the theorem for all ℓ≠p; it should define the cover for a general level or assume the product form at every ℓ; affects a stated result.
- **Gap** in KZ at Lemma 4.1.4, printed p.29: the source says the good local symplectic embedding is easily seen to come from a global Hodge embedding; it should give the totally real field whose completion at p is the splitting field; affects the proof.
- **Misprint** in KZ at Lemma 5.2.5, printed p.52: the source says the chosen representative lies in the integral points of the group; it should be a point of the loop group over the Laurent series field, as in the proof of Proposition 5.2.3; affects nothing.
- **Error** in HT at §1.3.15, printed p.20: the source says an ordinary class with Newton point the averaged inverse Hodge cocharacter always exists; it should assume its existence, automatic for quasi-split groups; affects a stated result.
- **Misprint** in HT at §2.1.3, printed p.21: the source says the integral group is the intersection of the Q_p-points of the isogeny group with the automorphisms; it should be the Q-points, as in the proof of Lemma 2.1.4; affects nothing.

## For the human reviewers

- Licence: HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`), in versions dated 27 January 2021 and 27 August 2016; their numbering was not collated with the Duke and JAMS versions.
- Scope: the sources are refereed (KP, Publ. IHÉS 2018; KPZ, Forum Math. Pi 2026; HT, Duke 2022; KZ recorded as Annals 2025); the KZ text read is arXiv v2.
- Supplier choice: R01 names FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII Layer 3 as owner of the existence of good symplectic embeddings (KZ Propositions 3.1.9, 3.1.12); GeometricSatakeAndFusionPartII, which owns the local-model immersions, is the alternative.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "69a24e817e6ddad93b9d24ef90f404e47dfbea2d", "job": "REV-PKG-ShimuraVarietiesPartII~9", "model": "fable", "worker": "chris-x88"} -->
