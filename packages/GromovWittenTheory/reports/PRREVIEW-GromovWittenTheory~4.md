# Review of GromovWittenTheory (pull request #990 at 6e5e2be)

**Verdict:** accepted

:robot: Independent AI review, incremental: 22 changed lines since b74118f (12 insertions, 10 deletions, README.md only; Suggested.lean and metadata.toml unchanged; nothing outside the folder). The gate passes at this head on an independent rerun, the dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output. All three findings of the previous review are repaired. Two P3 notes remain, both introduced by the R03 repair; neither blocks.

## R01 (P3) — The normalization sequence is attributed to the proof of Stacks Lemma 18.3, which uses a four-term sequence

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:324` (§3.2): “the sequence and its long exact cohomology sequence are those of the proof of Stacks Project, Lemma 18.3, Tag 0CE3”; line 774 (References): “Lemma 18.3, Tag 0CE3, whose proof uses the normalization sequence `0 → 𝒪_X → f_*𝒪_Y → 𝓕 → 0`”.

**Claim:** The three-term sequence `0 → 𝒪_X → f_*𝒪_Y → 𝓕 → 0` is the one the README uses and needs. The proof of Lemma 18.3 (Tag 0CE3) does not assume `X` reduced and writes the four-term sequence `0 → 𝒢 → 𝒪_X → f_*𝒪_Y → 𝓕 → 0` with a kernel `𝒢`; it proves only the inequality `h¹(X) ≥ h¹(Y)`. The three-term sequence, with injectivity of `𝒪_X → f_*𝒪_{X′}` for reduced `X` and its long exact cohomology sequence, is in the proof of Lemma 18.4 (Tag 0CE4), the next lemma.

**Witness:** stacks-curves lines 1681–1683 (Lemma 18.3's proof: four-term sequence with `𝒢`); lines 1698–1702 (Lemma 18.4's proof: “Assume X is reduced. Then `𝒪_X → f_*𝒪_{X′}` is injective”, the three-term sequence and its long exact cohomology sequence).

**Repair:** At lines 324 and 774 cite Lemma 18.4, Tag 0CE4 (for reduced `X`) for the short exact sequence and its long exact cohomology sequence, or keep Lemma 18.3 and say that its sequence carries a kernel term that vanishes for reduced `X`. No formula changes; the Tag 0C4D item (6) citation is exact.

## R02 (P3) — “Algebraic-atlas setting” is not Pardon's or the roadmap's vocabulary

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:222` (§1.2): “is Pardon, Definition 9.3.1, p. 100, in the algebraic-atlas setting”.

**Claim:** Pardon's §9 constructs an *implicit atlas* on the stable-map moduli space (Theorem 9.2.10) and Definition 9.3.1 is stated in that setting; the README itself says “implicit-atlas axioms” at line 88. “Algebraic-atlas” is defined nowhere and names no object in the source.

**Witness:** pardon2016 line 4353 (“`A_GW` is an implicit atlas on `M̄^β_{g,n}(X)`”), lines 4355–4364 (Definition 9.3.1); README line 88.

**Repair:** Replace “in the algebraic-atlas setting” by “in the implicit-atlas setting” (or “for the implicit atlas of Theorem 9.2.10”).

## Previous findings

- R01 — repaired: line 164 now says the completions “need not be internally graded”, proves internal grading exactly when `c₁(TX, J)` pairs to zero with `H₂(X; ℤ)`, and gives the witness `Σ_k q^(kA + k²B)`; line 175 adds the `T² × T²` and K3 control; line 597 says “an element may have components … unless `c₁(TX, J)` vanishes on `H₂(X; ℤ)`”.
- R02 — repaired: line 664 cites Kock (5.1.7.1)–(5.1.7.2) “in the algebraic setting and in genus zero … with the higher-genus statement left open” and keeps the all-genus analytic comparison as this roadmap's; line 712 cites Kontsevich–Manin 1998, Lemma 1.5.3, p. 6, “derived there from the Behrend–Manin axioms” for the all-genus dilaton equation and writes (5.1.7.3) against the genus-zero virtual class; the Kock reference entry says “stated in genus zero”.
- R03 — repaired: §3.2 (line 324) cites Stacks Tag 0C4D item (6) for the δ-invariant and Deligne–Mumford §1, p. 77, facts b) and c) for the residue-matched dualizing sheaf and the duality; §6.5 (line 562) says the capped trace formula has no source and is a target; §1.2 (line 222) cites Pardon Definition 9.3.1; §2.1 (line 249) says the weighted adjoint is a definition with no further source. The Stacks 18.3 locator slip is R01 above; the wording slip is R02.

## Verified sound

**Gate and build.** Independent rerun of the full gate at `6e5e2be3c31cb1ad95c8277aeb629e9929a71961`: every check zero, `OK`, exit 0 (10 s). Dependency check with `--movable` against the board order and main content:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.SG"`). `lake env lean` on Suggested.lean: exit 0, no output (15 s). Suggested.lean is byte-identical to the file r3 read: `import Mathlib`, one module docstring, the namespace and no declaration, so the `#check` signature comparison and the one-tactic padding probe have zero subjects; no sorry'd data, no `set_option`, no process prose. The headline list and the per-headline statements of what is missing at the pins (stable-map moduli, `M̄_(g,n)` with weighted pairing, the Novikov ring, rational Chern classes) are unchanged and were verified at the pins in r2 and r3 (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`); nothing in the diff touches them.

**Sources read for the changed passages.** All five works were fetched through the sources service from legal copies (Stacks download, Numdam, arXiv, Kock's author page); the folder has no `sources.toml` and no manifest was edited.

| Passage | Source passage read | Result |
|---|---|---|
| 3.2 δ-invariant of a node | stacks-curves lines 1931–1941 (Lemma 19.7, Tag 0C4D, p. 44; item (6) at 1940–1941: reduced, δ-invariant `1`, two geometric branches) | Exact. |
| 3.2 normalization sequence | stacks-curves lines 1677–1688 (Lemma 18.3, Tag 0CE3, p. 38: four-term sequence), 1691–1704 (Lemma 18.4, Tag 0CE4, p. 39: three-term sequence for reduced `X`) | Three-term sequence is in 18.4's proof (R01). |
| 3.2 dualizing sheaf of a nodal curve | dm1969 lines 85–104 (§1, printed p. 76–77: `ω_{C/S}` from duality theory [H]; fact b) residue-matched 1-forms on the normalization with simple poles at the node branches; fact c) `Hom_k(H¹(C, 𝓕), k) ≅ Hom(𝓕, ω_C)`); Definition 1.1 at 76–82 (`g ≥ 2`, algebraically closed `k` in b), c)) | Exact; the facts are stated there with a reference to duality theory, as the README says. |
| 1.2 coarse pushforward | pardon2016 lines 4344 (page 100 marker), 4355–4365 (Definition 9.3.1: pushforward of the virtual class under the tautological map to `M̄_(g,n) × X^n`), 4366 (Lemma 9.3.2) | Exact; wording note R02. |
| 8.2 Kock stable-map formulas | kock2001 lines 1860 (p. 50), 1883–1888 ((5.1.7.1)), 1889–1890 (p. 51, chapter “Gromov-Witten theory in genus zero”), 1899 ((5.1.7.2)), 1900 (author's note that the statement should be made for any genus), 1902 ((5.1.7.3): `π_{0*}ψ_0 = (2g − 2 + n)·[M̄_(0,n)(X, β)]^virt`) | Exact; the README now states the genus-zero scope and the virtual-class form. |
| 8.4 all-genus dilaton | km1998 lines 278–281 (Lemma 1.5.3, printed p. 6: `⟨τ₁1 τ_{d₁}γ₁ … ⟩_{g,β} = (2g − 2 + n)⟨…⟩_{g,β}`, “follows from the axioms … stated in [BM] and proved in [B]”) | Exact, all genera, attributed to the Behrend–Manin axioms as the README says. |
| 6.5 capped trace | No source claimed; README line 562 says so | Consistent with r3 R03's repair request. |
| 2.1 weighted adjoint | No source claimed; README line 249 says so | Consistent. |

**Suppliers.** No supplier citation changed; `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name found nowhere (main `9c6e95d`, 441 open heads). The diff adds no `*Needs:*` item and no supplier subsection; the depcheck edge count (1461) is unchanged from r3.

**Ownership and duplication.** The diff introduces no new object; the Hodge-bundle, capped-trace and ψ-class ownership searches of r2 and r3 stand. Ownership against open pull requests without supplied files was not checked beyond the indexed `roadmaps grep` of the previous rounds.

**Adversarial computations on the changed statements.** Coefficients are ℚ.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| 0.2 internally graded iff `c₁ = 0` on `H₂` (“if”) | K3; `T² × T²`; `X = pt` | Every monomial has degree `2c₁(A) = 0`, so `Λ_ω = Λ_ω^0 = ⊕_D Λ_ω^D`; for `V` graded, `(V ⊗̂ Λ_ω)^D` = functions into `V^D` and `V` has finitely many degrees, so the sum is internal; `X = pt`: `H₂ = 0`, `Λ_ω = ℚ` in degree `0` | Correct. |
| 0.2 “only if” witness | `S²`, `A = B = [S²]`: classes `k + k²`, areas `k + k² → ∞`, degrees `4(k + k²) = 0, 8, 24, 48, …` | Below `C = 10` the support has classes `0, 2, 6` (three); degrees pairwise distinct; coefficients `1` | Correct. |
| 0.2 witness with `ω(A) < 0` and coincident degrees | `S² × S²` areas `1, 1`; `A = −[S²×pt]` (`ω = −1`, `c₁ = −2`), `B = [pt×S²]` (`ω = 1`, `c₁ = 2`) | Areas `k² − k = 0, 0, 2, 6, …` (finitely many below any `C`); degrees `4(k² − k) = 0, 0, 8, 24, …`; degree-`0` component `q^0 + q^(A+B) ≠ 0`; each degree hit by at most two `k`, so infinitely many degrees | Correct; the statement's “nonzero components in infinitely many degrees” survives coincidences since all coefficients are positive. |
| 0.2 existence of `B` with `ω(B) > 0` | closed `X^{2m}`, `m ≥ 1` | `∫_X ω^m ≠ 0` so `[ω] ≠ 0` in `H²(X; ℝ) ≅ Hom(H₂(X; ℤ), ℝ)` (universal coefficients, `Ext(·, ℝ) = 0`); some `B` has `ω(B) ≠ 0`, replace by `−B` if negative | Correct. |
| 0.2 `T² × T²` Check | `c₁ = 0`; `S²` series `Σ q^k` | `Λ_ω = Λ_ω^0`; `Σ q^k` has degrees `0, 4, 8, …`, not a finite sum of homogeneous elements | Correct; the “never internally graded” control fails exactly on `T² × T²`. |
| 3.2 `h¹(𝒪_C)` from the long exact sequence | smooth genus `g`; irreducible one-node rational; two spheres with two nodes; chain of two spheres | `Σ g_v + |E| − |V| + 1`: `g + 0 − 1 + 1 = g`; `0 + 1 − 1 + 1 = 1`; `0 + 2 − 2 + 1 = 1`; `0 + 1 − 2 + 1 = 0`; `b₁(Γ)` = `0, 1, 1, 0` | Correct in all four. |
| 3.2 DM fact b) on the one-node rational curve | `ℙ¹` with `0 ~ ∞` | `dz/z`: residues `+1` at `0`, `−1` at `∞`, sum `0`; space of dimension `1 = h¹` | Correct. |
| 1.2 Pardon pushforward degree | `(0, 3, ℓ)` on `ℂP²` | `d = 2(−1 + 3 + 3) = 10`; class in `H_10(pt × (ℂP²)³)`; pairs with `pt ⊗ pt ⊗ H` of degree `10` to `1` (the r3 §2.2 row) | Consistent. |
| 8.2 Kock (5.1.7.3) in genus zero | `X = pt`, `M̄_(0,4) → M̄_(0,3)` | `∫ψ̄ = 1 = 2·0 − 2 + 3` | Correct. |
| 8.4 KM1998 Lemma 1.5.3 in genus one | `X = pt`, `⟨τ₁τ₁⟩₁ = (2 − 2 + 1)⟨τ₁⟩₁` | `∫_{M̄_(1,2)} ψ₁ψ₂ = 1/24 = 1 · 1/24` | Correct; the excluded `⟨τ₁⟩₁` case is as in r3. |
| 7.1 grading sentence | `ℂP¹`, `(0,3)`, `γ = (pt, pt, pt)`; K3 | `Ω_(0,3)(γ)` is homogeneous of degree `6 − 2 = 4` with `c₁(A) = 2` forced (the r3 7.1 row); on K3 every element of the completion is in degree `s + 2(g−1)m` | Correct; the sentence now agrees with §0.2. |

**Carried forward from the previous report (statements the diff leaves untouched; values as in r3, which recomputed them at b74118f):** Conventions (virtual dimension `2=2`, `0=0`, `4=4`; operation degree `2=2`; energy density `2`, normalized `1`; left duals `−β, α`); 0.1 (areas `1, −1, 0`; `0` adjoined, `(0,2,0)` empty; torus Check `∫_Δ = 1`, `∫_(E×y) = 0`, area `1 + √2`); 0.2 (support `Σq^k` below `3` has `3` terms; `a + b√2 < 3` finite; `aF₁ − aF₂` excluded; `0⊗Λ=0`; `det [[0,1],[−1,0]] = 1`; closed pieces; `4a + 4b`; components below `3` are `D = 0,4,8`; `c₁ ∈ {4}` for `D = 8`; `a q^(D/4)`, piece `0` at `D = 6`); 0.3 (`ℂP²` bound `3`: `4` classes, `4` decompositions; torsion `2` lifts); 1.1 (`2g−2+n = 1,1,0,0`; `2m − 2`; orders `1` vs infinite); 1.2 (dimensions `0`, `10`; `C₂→C₂`, `C₄→C₄`); 2.1 (`1/2` vs `1`; `π_*1 = 0`, `π_*h = 1`; `ξ_*1 = 2[pt]^∨`); 2.2 (`s = d = 10 → 1`; `12 ≠ 10 → 0`; `r = −4 → 0`); 2.3 (`1 − 1 = 0`; `x, x²` classes `1, 0`; `z, z²` classes `1, 2`); 3.1 (`1/2, 1/2`; character `−1`); 3.2 (ranks `1, 0, 2`; involution `−1`; one-node `1`, two-node `2 → 1`); 3.3 (`Ob` ranks `0, 1`; `r = 0`); 3.4 (`2, 1, 0`; `−1/24`; `λ² = 0`; `8 > 6`; `e(TM)[M] = χ(M)`); 4.1 (`−ℓ`, torsion `0`; `2ℓ` area `2`); 4.2 (`1, −1`; `+1`); 4.3 (`s − 2m`; `s`); 5.1 (`1,1,2`; `(1,1)→0`; `π_*1 = 0`, `π_*ev^*H = 1`); 5.2 (`8 ≠ 10 → 0`; `∫pt = 1`); 5.3 (`1 = 1·1`; `A = 0 → 0`); 5.4 (`1`, `0`, `1`); 6.1 (`1+1−1−1 = 0`; antidiagonal; `−1`); 6.2 (`(pt,pt,H,H)`: `0 = 1·0`; `(pt,H,H,H)`: `1 = 1·1 + 0`; conic `r = −4`, `18 > 12`); 6.3 (`2 = 2`, `0 = 0`); 6.4 (`1·2/1`, `2·1/1`, `2·4/4`, `1·2/2`; `ξ_*1 = 2τ_D`); 6.5 (`14 ≠ 12 → 0`; `12 = 12 → 1`); 6.6 (`1·∫H³ = 0`; `1·∫H² = 1`; collision stratum `3 > 2`); 7.1 (`4 = 0 + 4`; unit only at `A = 0`); 7.2 (`H⋆H = H²`, `H⋆H² = q`, `H²⋆H² = qH`, `16 > 12`; `x⋆x⋆x = q`; `ℂP¹` `x⋆x = q`; `T²` duals); 8.1 (`∫(a+D)² = 1`, `∫ψ̄₁D = 0`; `1`, `2`; anchors `1` vs `3`; `1/24` vs `1/12`); 8.2 (`ψ₁ = ψ̄₁` on a point; `−2 + 1 = −1`; `c₁(L^12)/12 = c₁(L^6)/6`); 8.3 (`1, 1, 1/24`; `1, 1`; `−1`); 8.4 (`1 = 1`, `2 = 1+1`; `0 = 0+0`; `(−2+1)·1 = −1`); 8.5 (`ψ̄₁ = 0`, correction `[D₁]` gives `1`); 8.6 (`0 = 0`; `1 = 1·1`; `2 = 1+1+0`; `⟨τ₁(pt) pt 1⟩ = 1`). None of these statements changed in the diff.

## Not verifiable

- The construction targets §1.2 (chart-level lift), §2.1 (weighted adjoint), §3.2 (scalar Hodge family), §6.5 (capped trace) and the analytic-carrier versions of §§8.2, 8.4–8.6 have no primary source stating them, and the README now says so at each; the algebraic analogues (Kock, Kontsevich–Manin 1998, Deligne–Mumford, Stacks) were verified at their locators above. The sampled instances are consistency tests, not proofs.
- Ownership against open pull requests without supplied files was not checked beyond the indexed `roadmaps grep` of the previous rounds; the diff introduces no new object.
- The folder has no `sources.toml`; this review edits no manifest. No cited text was paywalled or inaccessible; `needs-references.toml` was not needed.

## Source issues

- **Gap** in kock2001 at (5.1.7.2)–(5.1.7.3), printed p. 51 (lines 1899–1902): the source states the forgetful comparison and the push-down `2g − 2 + n` inside its genus-zero chapter, against the genus-zero virtual class, and its own note leaves the general-genus statement unwritten; it should either restrict to `g = 0` or state and prove the all-genus version; affects nothing (the README now cites it for genus zero only).
