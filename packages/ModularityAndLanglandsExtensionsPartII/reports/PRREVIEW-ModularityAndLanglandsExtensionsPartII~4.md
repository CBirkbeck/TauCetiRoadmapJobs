# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at b05eba7)

**Verdict:** needs changes

## R01 (P3) — §1.2 misdescribes what the printed proof of nt21 Theorem 2.27 leaves out

**Location.** `TauCetiRoadmap/ModularityAndLanglandsExtensionsPartII/README.md` lines 860–862: "The printed proof uses the chosen neighbourhood as if regularity and irreducibility held throughout it; the argument here first shrinks `U` into …".

**Claim.** The printed proof does choose `U` inside the irreducible, regular locus. What it does not arrange is Hodge–Tate regularity on all of `U`, which it then uses for the closed immersion. The sentence names the two properties the source has and omits the one it lacks.

**Witness.** nt21 line 2065 takes `z_n ∈ U ⊂ 𝒳^{irr}_{ps,n} × 𝒯^{reg}_n`. nt21 line 2076 then says the parameters lie in `𝒯^{HT-reg}_n` and concludes that `𝒵^{ord} → U` is a closed immersion.

**Repair.** Replace the sentence by: "The printed proof takes `U` inside `𝒳^{irr}_{ps,n} × 𝒯^{reg}_n` and then uses Hodge–Tate regularity of the parameters at every point of `U`, which it has not arranged; the argument here first shrinks `U` into `𝒳^{irr}_{ps,n} × (𝒯^{reg}_n ∩ 𝒯^{HT-reg}_n)`, which is Zariski open and contains `δ_n`." The proof sketch that follows needs no change.

## Previous findings

- R01 — not repaired: deferred (D01)

## Deferred findings

- D01 — resolved: the description's `depends-on` block now lists #2268, and the `merge-order` chain ends "#2268 (OrdinaryAutomorphicFormsAndModularityLiftingPartII) → this pull request".

## Verified sound

The head is the one the previous review read; the folder has not changed. Every row below was recomputed against the source text this round.

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §0.1 continuation lemma (nt21 Lemma 2.2, p. 24) | disc with `𝒳 = {0}`; two axes in the bidisc; `𝒴` a point | no affinoid neighbourhood of `0` inside `{0}`; at `y ≠ 0` only that axis is forced; at `0` hypothesis fails | holds |
| §0.2 Checks, `n = 1` | `p = 3`, target `C_5` | `Hom(ℤ_3^× × ℤ̂, C_5)` has 5 elements, `Hom(ℤ_3^× × ℤ_3, C_5)` has 1; pro-3 quotient `ℤ_3²`, dimension 2 | holds |
| §1.1 (nt21 Theorem 2.24, pp. 40–42; Remark 2.25) | `n = 3`; hypotheses (1)–(3) against source | 3-regular: `(α/β)^i ≠ 1` for `i = 1, 2`, so `α ≠ ±β`; the three hypotheses and conclusion agree with nt21 lines 1943–1953 | holds |
| §1.2 (nt21 Theorem 2.27, pp. 42–43) | hypotheses against source; `n = 2`; CM form | hypotheses agree with nt21 lines 2049–2058; `σ_2` is the identity; normaliser of a torus does not contain `SL_2`; source remark wrong, see R01 | statement holds; R01 |
| §2.2 (nt21 Lemma 2.34, pp. 51–52) | `pℤ_p ⊂ ℤ_p`; `⟨4⟩ ⊂ ⟨2⟩` modulo 3 | restriction is `t ↦ t^p`, degree `p`, surjective on the open disc; `2^a ≡ (−1)^a` mod 3 cuts out even powers | holds |
| §3.4 (nt21 Lemma 3.4, pp. 54–55) | `l = 5, 7`; `Δ` | mod 5: `2³ = 3`, `2⁵ = 2`, both of order 4; mod 7: `2³ = 1`, `2⁵ = 4`, `2⁷ = 2`, orders 1, 3, 3; `Δ`: slopes 3, 8; `X² − X + 3 = (X − 2)(X − 4)` | holds |
| §4.1 (nt21 pp. 8–10) | `n = 2`; `𝔽₉/𝔽₃` | `Φ_2^t = −Φ_2 = Φ_2^{−1}`; `𝔽₉^×/𝔽₃^×` cyclic of order 4, a character of order 4 is trivial on `𝔽₃^×` and ramified | holds |
| §5.10 (ct17 Theorem 4.2, p. 35; Remark 4.5, p. 37) | `a = 2, b = 1`; `l = 5, s = 1` | ranks `a + 3b` and `a + b`: `2(a + b) = 6 > 5`; `a ≤ b` against `a > b`; §5.6 counts `2^s = 2`, `2^{s+1} = 4` | holds |
| §6.9 (th24 Theorem 6.11, pp. 39–40; Theorem 4.5(1), p. 20) | `n_1 = n_2 = 1`, `q = 2`, `k = 𝔽_5`, `𝔽_7` | `2 · 1^{−1} · 2 = 4 ≠ 1`; exchanged `1 · 3 · 2 = 6 = 1`; in `𝔽_7` ratios of `{3, 1}` are 3, 5, not in `{2, 4}` | holds |
| §7.4 (nt21 Proposition 7.4, pp. 85–88) | the rank-two block; `n − 1 = 2k` | `r^c ≅ r^∨ ⊗ ε^{6k−8k} δ = r^∨ ⊗ ε^{−2k}δ`; after the twist `ε^{−1}δ` against `ε^{−1}`; `δ ≠ 1` on `G_{F_0}` | holds; defect in source confirmed |
| §7.5 (nt21 Theorem 7.1, p. 83; at20 Theorem 5.1, p. 19) | `TS_1`; step `1 → 2`; `n = 6` | `Π = 1` on `GL_1`, `St_1` trivial; at20 allows `n ≥ 1`; `48 · (2n)!` divisible by `48 · n!`; `6 = 2 · 3` needs `TS_3` | holds |
| §9.2 (nt21b Lemma 2.2, p. 7) | `1 ⊕ ε^{−1}` and its dual; `n = 3` | `Sym²` weights `{0, 1, 2}`; dual gives `{0, −1, −2}`; length `2 ≤ p − 2` only for `p ≥ 5` | holds |
| §9.5 (nt21b Proposition 2.6, p. 13; Lemma 2.7, p. 14) | dimension count; `p = 3` | `dim W_∞ = q + 4\|S ∪ S_∞\|`; `1 + 3[F:ℚ] + 3\|S\| + g` gives the same; `3^a > 5` forces `a ≥ 2` | holds |
| §9.6 (nt21b Proposition 2.8, p. 17; Lemma 2.9, p. 18) | dimension count; `γ = 0`; rank one | `1 + 3\|S ∪ S_∞\| + 2q + 1 = q + 4\|S ∪ S_∞\| + γ`; `(1 + x)² = 1` gives `x² + 2x`, degree 2 | holds |
| §10.7 (nt21b Proposition 3.11, p. 26) | the two implications; primes removed | `H_k ⇒ H′_{k+1}` by §10.6, `H′_k ⇒ H_k` by §§10.5, 10.6; `2, 3 ∉ sc(π)` so every removed prime is `≥ 5` | holds |
| §12.2 (nt26 Lemma 4.2, pp. 28–29; Corollary 4.3, p. 29) | crystalline and ordinary non-crystalline places; `r = 1` | both cases as in nt26 lines 1327–1352; `r = 1` is the twist of the rank-two trace by a character | holds |
| §13.2, §13.3 (nt26 Theorem 5.5 and Lemmas 5.6, 5.7, pp. 40–42) | `r = 2`, `r = 3`; `t = 13`; `l = 2`, `t = 17` | `{0,1} + {0,1}` repeats 1, `{0,1} + {0,2} = {0,1,2,3}`; `103 ≡ −1`, `53 ≡ 1` mod 13; `17 \| 2⁴ + 1` so only `l^a ≥ t − 1` | holds |
| §13.10 (nt26 Theorem 6.4, p. 50) | `n = 6, 7, 11, 12` | primes in `(n/2, n)`: 5; 5; 7; 7, 11. Indices used: `{1,2,4}`; `{1,2,3,3}`; `{3,4,5,3}`; `{4,5,6,2}` or `{1,2,10}`, all `< n` | holds |
| §14.1 (Theorem 7.1 and Theorem E in every rank) | `p = 577`, `n = 3`; `ℚ_{p²}` | `577 = 2 · 288 + 1`, prime, `≡ 1` mod 4; `4 ≤ 575`; `T_v² ≡ 4 ≡ (q_v + 1)²`; Layer 13 uses Layers 6, 9 only, no cycle | holds |
| §14.4 `symPowerEulerProduct_levelOne_entire` | `n = 0, 1, 2`; `Δ`; zeros of factors | `n = 0` gives `ζ(s)`; `n = 1` region `Re s > (k + 1)/2`; `576 − 2048 = −1472`; a factor vanishes only on `Re s = n(k − 1)/2` | holds |
| §14.5 `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` | level 32 CM form, `n = 2, 4`; weight one; `M = 0`; `Δ` at `p = 3` | `n = 4`: inert eigenvalues `p²·(+,−,+,−,+)`, leaving `ζ(s − 2)`, pole at 3; `n = 2`: `L(s − 1, χ_{−4})`, entire; `252 · (−1) ≠ 252`; `Nat.Coprime p 0` forces `p = 1` | holds |
| `HasQuadraticSelfTwist` | `M = 1, 2, 4`; wrong model `ψ = 1` | moduli 1, 2 carry only the trivial character; `ψ ≠ 1` and `0 < M` are in the body; `χ_{−4}` mod 4 witnesses the level-32 form | determines the predicate |
| Elaborated signatures against README | 4 declarations | `hk : 2 ≤ k`, `hn : 1 ≤ n`, `[NeZero N]` and both `hαβ` are in the elaborated types; product over `{p // ¬ p ∣ N}` as in §14.5 | agree |

- **Source locators checked against the text:** 52 (nt21 23, nt21b 10, nt26 7, th24 4, ct17 6, at20 1, con99 1), all at the stated pages.
- **Library declarations opened at the pins:** 16, among them `satakeParameters` (`TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91`), `exists_satakeParameters_eq_pair` (`:117`), `CuspForm.hasEntireExtension_qExpansion_coeff` (`LFunction/Basic.lean:192`), `Nat.multiplicity_pow_two_sub_one` (`Mathlib/NumberTheory/Multiplicity.lean:359`), `Nat.exists_prime_lt_and_le_two_mul` (`Bertrand.lean:225`), `changeLevel_eq_cast_of_dvd'` (`DirichletCharacter/Basic.lean:107`).
- **Cross-roadmap citations resolved:** 56 section ids in 20 roadmaps, on main or at the open heads; none missing.
- **Gate (my run):** every check 0, `OK`; nothing changed outside the folder. Depcheck: `depcheck: 261 roadmaps, 2526 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings (lines 98, 117).
- **Padding probe:** on a scratch copy, `first | simp | rfl | infer_instance | exact?` closes neither theorem; no near-match in the pinned libraries.
- **Gaps:** 14 slugs, identical in `design/plan.json` and the README, each with a named supplier.
- **Pull-request text:** title and description agree with the head; the supplier lists now include #2268.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PadicLocalLanglandsForGL2Qp, ArithmeticGaloisRepresentations and SmoothRepresentationsOfLocalGroups (scope sections), and SmoothRepresentationsOfLocalGroupsPartII SRU.7. Statements of symmetric power functoriality: ModularityAndLanglandsExtensions owns them, this roadmap proves them. Definite unitary forms at `l = 2`: OrdinaryAutomorphicFormsAndModularityLiftingPartII, cited. Kazhdan–Lusztig classification: this roadmap (§4.9), see the human-reviewer bullet.

Source independence: 23 passages compared with 7 sources (nt21, nt21b, nt26, th24, ct17, at20, con99); longest shared run 6 words, in a statement that can be written one way; largest share nt21, 96 of 273 locators; contents compared with nt21: independent (Layers 0–2 ↔ §2, 3 ↔ §3, 4 ↔ §1, 5 ↔ §4, 6 ↔ §§5–6, 7 ↔ §7, 8 ↔ §8; §1 is moved, §2 is split in three, Layers 4–7 also carry ct17 §§2–6 and th24 §6, the order 5 → 6 → 7 is forced by Layer 6's Dependencies (Layers 4–5) and the *Needs* line of §7.4 (§§5.4, 6.4), and Layer 8 depends on Layers 2–3 only).

## Not verifiable

- kl87 Theorem 7.12 and §8 (§4.9): uncertified, cited by locator only.
- bbm82 Théorème 3.1.1 (§9.2 and its gap): uncertified, cited by locator only.
- kw09 Proposition 9.3 (the gap of §9.6): uncertified, cited by locator only.

## Source issues

- **Error** in nt21 at the proof of Proposition 7.4, p. 88: the source says the rank-two block, a twist of the base change of an auxiliary form, satisfies the hypotheses of its Theorem 4.1; it should be conjugate self-dual, but differs from its conjugate dual by the quadratic character of `ℚ(i)/ℚ` restricted to the base field; affects the proof.
- **Gap** in nt21 at the proof of Theorem 2.27, p. 43: the source says the parameters over the chosen neighbourhood are Hodge–Tate regular, having chosen it only in the irreducible regular locus; it should first shrink the neighbourhood into the Zariski open Hodge–Tate regular locus; affects nothing.
- **Error** in nt26 at the proof of Lemma 5.7, p. 42: the source says an element of prime order `t` in the projective image forces a field of size greater than `t`; it should be size at least `t − 1`, since 17 divides `2⁴ + 1`; affects nothing.
- **Gap** in nt26 at the proof of Lemma 5.7, p. 42: the source says the two tensor representations are adequate because they are residually irreducible; it should check irreducibility after restriction to the cyclotomic extension `F(ζ_t)`, which the lifting theorem uses; affects nothing.

## For the human reviewers

- The Kazhdan–Lusztig classification is stated in §4.9 here (README line 1871; merge order 304) and in SmoothRepresentationsOfLocalGroupsPartII SRU.7.1 (pull request #1815, README line 1484; merge order 316), which does not cite this roadmap.
- `gap:components-under-field-extension` asks AdicSpacesPartV Layer 1, on main, for base change of irreducible components; that roadmap's scope paragraph excludes "base change of global irreducible components".
- README §13.6 (lines 5120–5122) records that the second paragraph of ModularityAndLanglandsExtensions §4.23, read in characteristic zero, fails for `r ≥ 2` (weights `{0, 1, 1, 2}` repeat). That statement belongs to the other roadmap.
- Layers 7 and 14 avoid the odd-rank induction of nt21 because of the defect listed under Source issues. I did not search for a published correction.
