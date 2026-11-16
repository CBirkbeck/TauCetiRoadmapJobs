# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at cb06aa3)

**Verdict:** needs changes

## R01 (P2) — §6.3 restates the Hecke comparison owned by PotentialAutomorphyInfrastructurePartII §3.10

**Location.** `TauCetiRoadmap/ModularityAndLanglandsExtensionsPartII/README.md` line 2663 (§6.3): "prove: (Lemma 6.6) if every `R_v` … is a fixed-type ring … or a fixed-character ring … there is a natural surjection `P_D → 𝕋_D` of `Λ_L`-algebras (nt21 Lemma 6.6, p. 79 …)".

**Claim.** nt21 Lemma 6.6 is already a target of PotentialAutomorphyInfrastructurePartII §3.10, which §6.2 itself names as the owner of `R_D`, `P_D`, `𝕋_D`; the surjection has two owners, and §6.3's sketch re-proves it instead of citing it.

**Witness.** `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` line 915 (pull request #2135 head, §3.10): "Prove that when no local choice is Steinberg there is a natural surjection of `Λ_L`-algebras `P_D → 𝕋_D` … (NT21 §6 … Lemma 6.6, pp. 79–80 …)".

**Repair.** Replace the "(Lemma 6.6) …" clause of §6.3 by: "For data whose rings at `X` are fixed-type or unipotent, the surjection `P_D → 𝕋_D` is PotentialAutomorphyInfrastructurePartII §3.10 (nt21 Lemma 6.6, p. 79). Prove its variant in which fixed-character rings `R^{χ_v}_v` are also allowed (ct17 §5.1, p. 40): it differs only in that the Hecke lift at Iwahori level has the `χ_v`-type on inertia (PotentialAutomorphyInfrastructurePartII §3.13(2)(iii)). Steinberg and partition rings remain excluded." Keep Lemma 6.7 as this section's target; add PotentialAutomorphyInfrastructurePartII §§3.10, 3.13 to its *Needs* line.

## R02 (P2) — §11.2 restates nt26 Lemma 3.1, owned by PotentialModularityAndCompatibleSystems §9.2 and cited as its own input

**Location.** README line 4052 (§11.2): "Under §11.1, prove that there is a RAESDC `σ` on `GL_2(𝔸_F)` which is ι-ordinary, has `HT_τ(r_{σ,ι}) = {0, 2}` … an unramified Steinberg twist at `v_0` … (nt26 Lemma 3.1 and proof, pp. 13–14)."

**Claim.** The same companion `σ` (ordinary, weights `{0, 2}`, determinant `ε^{−2}ω_p`, `r̄_σ ≅ r̄_π`, Steinberg at `v_0`) is the exported target of PotentialModularityAndCompatibleSystems §9.2, which §11.2's own sketch cites as an input: two owners of one statement.

**Witness.** `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md` line 1597 (pull request #1075 head, §9.2): "Export a RAESDC ordinary σ with the same residual representation as π, an unramified Steinberg twist at v₀ … The existence and these component conclusions are the target here."

**Repair.** Replace the statement of §11.2 by: "Take `σ` from PotentialModularityAndCompatibleSystems §9.2 (nt26 Lemma 3.1, pp. 13–14). Prove the form of its local conclusion that §11.4 uses: at every finite `v ∤ p v_0`, `r_{σ,ι}|_{G_{F_v}} ∼ r_{π,ι}|_{G_{F_v}} ⊗ χ_v`, with `χ_v` unramified, `χ_v ≡ 1` modulo `ϖ` and `χ_v² = ε^{−1}ω_p`, so that both sides are points of the lifting ring of determinant `ε^{−2}ω_p`." Route: `r_{π,ι}|_{G_{F_v}}` is generic, hence on a unique component `C` (PotentialAutomorphyInfrastructurePartII §1.3); the irreducible family `r_{π,ι}|_{G_{F_v}} ⊗ χ_t` (`χ_t` unramified, `χ_t(Frob_v) ∈ 1 + 𝔪`) lies in `C`, and so does `r_{σ,ι}|_{G_{F_v}}` by §9.2 there (LocalGaloisDeformationRings §6.8). Keep the API and Checks; cite §9.2 in *Needs*.

## R03 (P3) — a Check of §10.8 is false for additive reduction of principal-series type

**Location.** README line 3921 (§10.8, Checks): "A non-CM elliptic curve over `ℚ` with additive potentially good reduction at `3` (for example one acquiring good reduction over a ramified extension of `ℚ_3`) passes through the `3`-adic step."

**Claim.** The `3`-adic step of §10.8 is used only when `3 ∈ sc(π)`; additive potentially good reduction does not make `π_3` supercuspidal, and every such curve acquires good reduction over a ramified extension.

**Witness.** The twist of `11a1` (good reduction at `3`) by the character of `ℚ(√−3)` has conductor `99`, additive potentially good reduction at `3`, and `π_3` = unramified principal series ⊗ ramified quadratic character: `3 ∉ sc(π)`.

**Repair.** Replace the bullet by: "- A non-CM elliptic curve over `ℚ` whose local component at `3` is supercuspidal (its Weil–Deligne representation at `3` is irreducible) passes through the `3`-adic step. The twist of `11a1` by the character of `ℚ(√−3)` (conductor `99`) has additive potentially good reduction at `3` but a principal-series component there, so `3 ∉ sc(π)` and §10.7 treats it without that step."

## R04 (P3) — §13.6 claims to prove a characteristic-zero statement of the parent; it proves the residual one

**Location.** README line 5039 (§13.6): "This proves the second paragraph of ModularityAndLanglandsExtensions §4.23."

**Claim.** That paragraph asserts ordinary RAESDC automorphy of the characteristic-zero `ϕ_p r_π ⊗ Sym^{r−1} r_π`; §13.6, like nt26 Theorem 5.9, gives only `r̄_{Π,ι} ≅ φ_p(r̄_{π,ι}) ⊗ Sym^{r−1} r̄_{π,ι}` (§13.5 says so itself).

**Witness.** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 2797 (pull request #1180 head, §4.23): "give residual SL₂(𝔽_{p^a}), p^a>M, and ordinary RAESDC automorphy of ϕ_p r_π⊗Sym^{r−1}r_π on GL_{2r}". nt26 line 1759: the conclusion is phrased as residual automorphy.

**Repair.** Replace the sentence by: "It is the second paragraph of ModularityAndLanglandsExtensions §4.23 read residually, with `ϕ_p r̄_π ⊗ Sym^{r−1} r̄_π` in place of `ϕ_p r_π ⊗ Sym^{r−1} r_π`; the characteristic-zero reading is not proved here." In `## Downstream consumers`, write "§4.23 (its second paragraph in residual form, §13.6)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §0.2 pseudocharacter spaces (nt21 §2.11.1, Lemma 2.13, pp. 30–31) | `n = 1`, `F_ṽ = ℚ_3`; `C_5` quotient | dimension 2 = rank of pro-3 quotient `ℤ_3²`; `Hom(ℤ_3^× × ℤ̂, C_5)` has 5 elements, `Hom(ℤ_3^× × ℤ_3, C_5)` has 1 | holds; locator nt21 lines 1432–1488 |
| §0.4 tangent spaces (nt21 Lemma 2.14, p. 31) | `n = 2`, `H² = 0` | `h¹ = h⁰ + h² + 4 = 1 + 0 + 4 = 5` | holds; (1), (2) match lines 1489–1495 |
| §1.2 ordinary continuation (nt21 Thm 2.27, pp. 42–43) | hypotheses (1)–(3) | identical to lines 2053–2056; printed `Z^ord → U` uses HT-regularity with `U ⊂ T^reg` only (line 2076) | holds; README's shrinking correct |
| §2.2 trivialising characters (nt21 Lemma 2.34, pp. 51–52) | `pℤ_p ⊂ ℤ_p`; `⟨4⟩ ⊂ ⟨2⟩`, modulus 3 | `t ↦ t^p` degree `p`, `p` preimages; `2^a ≡ (−1)^a` mod 3 | holds |
| §3.2 boundary weights (nt21 remark after Lemma 3.3, p. 54) | `k = 3, 4, 6` (`m = 0`); `k = 2`, `m = 1` | `w = 4, 24, 624, −2`; `v_2 = 2, 3, 4, 1`; annulus iff `0 < v_2 < 3` | holds |
| §3.3, §3.7 twins and ping-pong | `i = 1` | `m_π = 2`, `k′ = 9`, `s = 2`, twin on `X_3` with slope `6 = 3·2` | holds |
| §4.5 types and congruence (nt21 Prop 1.15, pp. 17–18) | `q = 3`, `p = 7` | `3` has order 6 mod 7; `|C(𝔽_3)| = 28`; `dim τ = 6`, `dim λ = 4·8 = 32` | holds |
| §4.10 KL modules (ct17 Thms 2.3, 2.5, pp. 8–11) | `n = 7, 9, 11` | `1 + 7 = 8 = 4+2+2`; `1 + 11 + 2 = 14 = 6+4+4`; `1 + 16 + 5 = 22` | holds; exponents match lines 395–417 |
| §4.12 signs (ct17 Thm 3.3, table p. 21) | `m = 5`; `m = 3` | `jY − jX + jZ` = twice six shuffles of `(2,1)`,`(1,0)` (12 terms); `jY − jX = 4[1,1,0] + 2[1,0,1]` | holds; printed `[1,0,1]` for `X` (line 1112) fails |
| §5.6 counts (ct17 Thms 3.8, 3.10, pp. 28–32) | `s = 0` | `l > 5`: `4/2 = 2` and `4`; `l = 5`: `1` and `2` | holds; lines 1487, 1500, 1639, 1650 |
| §6.4 Steinberg level raising (nt21 Thm 6.1, p. 76) | `n = 3` | `p ≥ 7`; `[F_ṽ : ℚ_p] > 4`; `q_v ≡ 1` mod `p` on `R_2` | holds; (1)–(5) match lines 3719–3742 |
| §7.4 defect of the printed block (nt21 p. 88) | `r = r_τ ⊗ ω_1ω_0^{2k}` | `r^c ≅ r^∨ ⊗ ε^{−2k}δ_{K/ℚ}`; `δ|_{G_{F_0}} ≠ 1` (`q_1` split in `K`, inert in `F_0/F_0⁺`) | holds; source issue below |
| §9.1 setting (nt21b §2, pp. 5–6) | `n = 2, 10` | `p^a > 5`: `𝔽_7` yes, `𝔽_5` no; `p^a > 19`: `𝔽_23`, `𝔽_25` yes, `𝔽_19` no | holds; (6)–(11) match lines 244–255 |
| §10.3, §10.8 seasoning (nt21b Def 3.6, Thm 3.1) | `n = 3` | `t > 48` gives `53`; `158` composite, `211` prime, `212 = 4·53` | holds; §10.8 Check fails (R03) |
| §11.1 auxiliary data (nt26 §3, pp. 12–16) | `ζ_p ∈ F_{1,v}` (nt26 line 749) | implied: `r̄` trivial at `v | p` and `det r_π = ε^{−1}` give `ε̄ = 1` there | holds; `q_{v_0} = 19` for `p = 5` |
| §11.2 companion (nt26 Lemma 3.1) | PotentialModularityAndCompatibleSystems §9.2 | same `σ`, same five properties | duplicate (R02) |
| §6.3 Hecke comparison (nt21 Lemma 6.6) | PotentialAutomorphyInfrastructurePartII §3.10 | same surjection, same exclusion of Steinberg rings | duplicate (R01) |
| §13.4 propagation (nt26 Lemma 5.8, pp. 42–44) | `r = 4`, `q = 17`, `x = 2`, `y = 3`; `q = 43` | forbidden set `{1,2,4,8,9,13,15,16}`; eigenvalues `7,6,10,11,14,12,3,5`; swapped slots repeat `xy³ = xy^{−3}` | holds |
| §13.6 witness (nt26 Thm 5.9, p. 44) | hypotheses (1)–(7) | match lines 2061–2075; conclusion residual (line 1759) | holds; cross-reference R04 |
| §13.10 induction | `n = 6, 7, 11, 12` | `(5,1)`: SP 1, 2, 4; `(5,2)`: 1, 2, 3, 3; `(7,4)`: 3, 4, 5, 3; `(7,5)`, `(11,1)` | holds |
| `symPowerEulerProduct_levelOne_entire` | `n = 0`; `Δ`, `n = 2`, `p = 2` | `n = 0` gives `ζ(s)`; `α² + αβ + β² = 576 − 2048 = −1472`; `|α^jβ^{n−j}| = p^{n(k−1)/2}` | holds; Satake.lean:91 is arithmetic normalisation |
| `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` | `y² = x³ − x`, `n = 4` | `a_5 = −2` (8 points mod 5); `α²β² = p²` gives `ζ(s−2)` pole at `s = 3 = n(k−1)/2 + 1` | holds; CM exclusion necessary |
| `HasQuadraticSelfTwist` | `M = 0, 1, 2`; `Δ`, `χ_{−4}`; CM form | `M = 0`: sign character, no prime tested; moduli 1, 2 trivial; `252·(−1) ≠ 252`; inert `a_p = 0` | holds |
| `symPowerEulerFactor` | swap `α, β`; `n = 1` | proved `example` elaborates; `n = 1` gives `1 − a_p x + αβx²` | holds |

- Source locators checked against the text: 39 (nt21 15, nt21b 6, nt26 9, ct17 8, th24 1); none is flagged unverified in the README.
- Library declarations opened at the pins: Tau Ceti `Satake.lean:91, 117, 161, 191`, `Newform.lean:104`, `LFunction/Basic.lean:192`, `JacobsonMorozov.lean:87, 199`; Mathlib `Multiplicity.lean:359`, `Bertrand.lean:225`, `Discriminant/Basic.lean:275`, `DirichletCharacter/Basic.lean:79, 88, 107`, `MulChar/Basic.lean:130`, `Resultant/Basic.lean:934`, `QExpansion.lean:172`, `GaussianInt.lean:50`: all present as cited.
- Cross-roadmap citations resolved: 148 section ids in 22 supplier roadmaps at their open heads (`roadmaps show`), plus AdicSpacesPartV §§1.1, 1.4, 1.5 and SmoothRepresentationsOfLocalGroups SR.1.5 on main; all found, content compared for 17 of them.
- Gate (my run at cb06aa3): every check 0, `OK`; no outside-folder change. Depcheck: `depcheck: 256 roadmaps, 2433 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives only the two `sorry` warnings (lines 98, 117); `#check @` of all 4 declarations matches §§14.4–14.5, `[NeZero N]` kept; `simp`/`exact?` close neither theorem: no padding.
- Gaps: 15 slugs, identical in `design/plan.json` and the README; none unowned; none already provided at the supplier heads read (SpringerResolutionAndCharacteristicCycles Layer 6 has no equivariant K-theory; PotentialAutomorphyInfrastructurePartII §8.16 states finiteness only).
- PR text: title and description agree with the head (new roadmap, 4 declarations, gate results); no sentence contradicted.
- Settled finding F03 of the round-4 repair report (Kazhdan–Lusztig owner) not re-raised: its reason (the edit belongs to the other roadmap) holds.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII and NoncommutativeAndEquivariantIwasawa (scopes), and the cited sections of PotentialModularityAndCompatibleSystems, GL2ModularityLifting, SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants; shared: nt21 Lemma 6.6 comparison (owner PotentialAutomorphyInfrastructurePartII §3.10, R01), nt26 Lemma 3.1 companion (owner PotentialModularityAndCompatibleSystems §9.2, R02), the parent's statements §§4.5–4.31 (owned there, proved here by design), Kazhdan–Lusztig classification (owner §4.9 here; also SmoothRepresentationsOfLocalGroupsPartII §7.4, settled).

Source independence: 22 passages compared with 5 sources (nt21, nt21b, nt26, ct17, th24), none shared beyond forced statements (longest run 8 words, a definition clause, nt21b line 1065); largest share nt21, 95 of 270 locators; contents compared with nt21: independent (Layers 0–8 ↔ nt21 §§2, 2, 2, 3, 1, 4, 6, 7, 8 with ct17 and th24 material merged in; nt21 §5 supplied elsewhere); Layers 9–10 ↔ nt21b §§2–3 and 11–13 ↔ nt26 §§3–6 in the order forced by §10.6 *Needs* §9.8 and §13.10 *Needs* Layers 11–12.

## Not verifiable

- kl87 Theorem 7.12 and §8, bbm82 Théorème 3.1.1, kw09 Proposition 9.3: uncertified (paywalled), settled; cited by locator only.
- ct17 p. 26, uniqueness of the irreducible submodule after (3.9) (§4.12 says it fails): the socle of that induction was not recomputed.
- chen14 §§4.1–4.2 and con99 Theorem 3.4.2: not in the sample; texts not opened.

## Source issues

- **Error** in nt21 at proof of Lemma 2.12, p. 31: the source says Schur's lemma makes two polarized extensions with the same restriction equal; it should be that they differ at `c` by a scalar `λ ∈ 1 + 𝔪_A` and are conjugate by `(α, 1)`, `α² = λ^{−1}`; affects the proof.
- **Gap** in nt21 at proof of Theorem 2.27, p. 43: the source says `Z^ord → U` is a closed immersion because the parameters are Hodge–Tate regular, with `U` chosen only in `X^irr × T^reg`; it should first shrink `U` into `T^{HT-reg}`; affects the proof.
- **Misprint** in nt21 at Lemma 3.3, p. 54: the source says `z ∈ X_{i′}`; it should be `z′ = τ(z) ∈ X_{i′}`; affects nothing.
- **Error** in nt21 at proof of Proposition 7.4, p. 88: the source says Theorem 4.1 applies to `π_2 = τ_0 ⊗ |·|^{(n−2)/2}ιω_1ω_0^{n−1}`; it should be a conjugate self-dual block, which this is not (it differs from its polarized dual by `δ_{K/ℚ}|_{G_{F_0}} ≠ 1`); affects the proof.
- **Misprint** in ct17 at Theorem 3.3(i), p. 21: the source gives `X` the exponent `[1, 0, 1]` for `m = 3`; it should be `[1, 0, −1]`, as in Theorems 2.3 and 2.5; affects nothing.
- **Misprint** in ct17 at §3.5, p. 27: the source writes "ε1(X) or ε(Z) = −1"; it should be `ε_1(Z)`; affects nothing.
- **Misprint** in nt21b at proof of Theorem 3.1, p. 27: the source applies KW09a Lemma 6.3 to `Proj r̄_{π,ι}`; it should be the good-dihedral form `π′`; affects the proof.
- **Gap** in nt21b at proof of Theorem 3.1, p. 27: for `2 ∈ sc(π)` the source concludes by Proposition 3.11, whose hypothesis `3 ∉ sc` may fail for the new form; it should conclude by the case `2 ∉ sc` treated first; affects the proof.
- **Misprint** in nt26 at Lemma 3.4(5), p. 16: the characters are of `K_1` but the Hodge–Tate condition uses embeddings of an undefined `K`; it should be `K_1`; affects nothing.

## For the human reviewers

- The Kazhdan–Lusztig classification is stated both in §4.9 here (merge order 304) and in SmoothRepresentationsOfLocalGroupsPartII §7.4 (pull request #1815 head, README line 1557; merge order 316); settled here in repair round 4 as an edit for that roadmap.
- `gap:components-under-field-extension` asks AdicSpacesPartV Layer 1 (on main) for base change of irreducible components; that roadmap's scope (its README line 23) excludes "base change of global irreducible components".
- Layers 7 and 14 avoid nt21's odd-rank induction because of the block defect in nt21, proof of Proposition 7.4 (p. 88), which this review recomputed (README §7.4 Check); no published correction was located.
