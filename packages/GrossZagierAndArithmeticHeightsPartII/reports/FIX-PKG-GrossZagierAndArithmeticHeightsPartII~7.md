# FIX-PKG-GrossZagierAndArithmeticHeightsPartII~7

This round repairs the five findings of `REV-PKG-GrossZagierAndArithmeticHeightsPartII~6`. I checked each one against the cached legal sources, the pinned libraries and the README's own definitions before editing. All five are correct. F02's suggested repair is applied with two added precisions: the case n ≥ 2, and points of L♭ ⊗ F.

Files changed:

- `packages/GrossZagierAndArithmeticHeightsPartII/README.md`
- `packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean`: module docstring only. There are still no declarations.
- `packages/GrossZagierAndArithmeticHeightsPartII/sources.toml`: the locators of `LZ` and `Z` are extended to the passages newly cited, and `Z` gets `cited_for` §1.1. No new work, no fetch.

`metadata.toml` and `design/plan.json` are unchanged. No supplier gap was added or changed.

## F01 (P1) — applied

Verified. The extraction drops fraction bars: LZ line 3625 reads "1degπ1χ" for (1/deg π₁)·χ, and line 3628 reads "1[E :F0]" for 1/[E:F₀]. So "(−1)nvol(K)" (LZ lines 198, 3636, 3737, 3818, 3861; K line 4167) cannot tell a quotient from a product. The level-scaling argument settles it. Take K′ ⊂ K of index m: the degree is multiplied by m and E′ is unchanged, so c_(K′) = m·c_K. That forces c_K ∝ 1/vol(K).

Change: §13.4 "c_K = (−1)^n·vol(K)" → "(−1)^n/vol(K)", with vol(K) explained. §13.5 → "c_K = (−1)^n/vol(K) of §13.4". The §13.4 sign Check now reads n = 2: +1/vol(K), n = 3: −1/vol(K), because LZ Part 3 assumes n ≥ 2 (LZ line 3195). A new Check records the index-m level change. §§13.7, 13.8 and 13.10 cite c_K without a formula and need no edit.

## F02 (P2) — applied

Verified. LZ lines 2519–2523 (p. 57) say the full Fourier statement for ∂Den_(L♭,V) is not proved. The proof (LZ lines 2572–2598, pp. 58–59) confines the support to M = L♭ ⊥ ⟨u⟩ and then argues on the normal line. §3.4 states only the normal-line vanishing.

Change: the §3.5 route now runs as follows:
- it confines the support to M by LZ Lemma 8.2.2 and local constancy;
- it factors Φ_L♭ = 1_L♭ ⊗ φ⊥;
- it applies the uncertainty principle to φ⊥ on the rank-one space W, with the ⟨u^∨⟩-translation argument as an equivalent;
- it states n ≥ 2 explicitly.

The Layer 3 introduction now says "on the normal line". There are two new Checks: the counterexample on V_n, and a computed rank-two instance. §2.7, which the route no longer uses, is dropped from the *Needs* line.

## F03 (P3) — applied

Verified. §13.3 admits only self-dual or almost self-dual inert places and Krämer ramified places, so no exotic place is admissible. K's proof of Theorem 10.1 (K lines 4170–4176) uses LZ 13.6, LZ 10.5.1, K Theorem 9.7 and Liu/GS19. K's Theorem 9.7 proof (K lines 3981–4001) contains no uncertainty principle; the word does not occur anywhere in K.

Change in §13.10: "§6.8" is removed and the route is restated place by place (§13.5 through §3.5; §4.5 on §4.2; §8.7; §13.7). *Needs* → §§3.5, 4.2, 4.5, 8.7, 10.3–10.4, 13.3–13.5, 13.7, 13.9. In §8.7 *Needs* and in the Layer 8 Dependencies, MetaplecticAutomorphicForms §3.3a is deleted.

## F04 (P3) — applied

Verified at Tau Ceti pin 2fd255d9:
- `TauCeti.FormalScheme.Spf.carrier` is at TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73.
- `TauCeti.FormalScheme.Spf.structureSheaf` is at TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262; it is a sheaf of commutative rings on the carrier.
- No type of formal schemes exists. In the pinned Mathlib, a case-insensitive grep for "formal scheme", "FormalScheme" or "formal spectrum" finds no file.

Change: README "From Mathlib and Tau Ceti" now names the two Tau Ceti declarations and says Tau Ceti has no category of locally noetherian formal schemes, coherent sheaves, supported K-theory or Rapoport–Zink spaces. The `Suggested.lean` docstring makes the same correction. The conclusion that nothing is statable is unchanged.

## F05 (P3) — applied

Verified:
- LZ Theorem 8.2.1 is at line 2531 (p. 58). Its proof ends at line 2598, and p. 60 begins at line 2600.
- LZ §11.1 begins at line 3191, after the page-73 marker at line 3185. LZ contents line 29 also gives p. 73.
- Z Lemma B.2 is at line 4330, after the page-77 marker at line 4326, and part (ii) is at line 4347.

Change: §3.5 "pp. 58–60" → "pp. 58–59". §10.1 "pp. 72–77" → "pp. 73–77". §1.1 "Lemma B.2(ii) of Zhang's appendix" → "(Z Appendix B, Lemma B.2(ii), p. 77)". A search found no other appendix or p. 72 slip: the p. 72 citations of Remark 10.5.4 in §§4.5–4.6 are correct (LZ line 3168, p. 72).

## Checks run

- **Elaboration.** `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean`, run from the content checkout after the docstring edit: exit 0, no output. The file has `import Mathlib`, one module docstring and an empty namespace, so there are zero declarations. The `#check @name` comparison therefore had no input: there is no declaration whose elaborated type could differ from the README. There is no `set_option`, no sorry'd data and no `TauCeti.*` import; the two Tau Ceti names occur only in the docstring.
- **Dependency check.** Exact output, run after the final edit:

      depcheck: 245 roadmaps, 2254 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver** on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The resolver also reported that it did not check Lean names outside TauCetiRoadmap. I checked the two new Tau Ceti names at the pin myself (F04 above).
- **Section numbering.** No section, layer or target was renumbered, renamed or deleted, so no id cited by another roadmap changed.
- **Ownership and sources.** No new construction was introduced, so no ownership question arises. `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. `needs-references.toml` was not needed and was not written.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §13.4 c_K = (−1)^n/vol(K) | n = 2, 3 | (−1)² = +1 → +1/vol(K); (−1)³ → −1/vol(K) | Sign Check restated for n = 2, 3 (LZ Part 3 has n ≥ 2) |
| §13.4 level-change Check | neat K′ ⊂ K of index m = 2 at a split place over ℓ; obstructing place archimedean or of residue characteristic ≠ ℓ | deĝ_T(K′) = 2·deĝ_T(K) (finite étale of degree 2; Sh_(K′)(ℂ) → Sh_K(ℂ) is a 2-sheeted cover, ½∫ doubles); E′_T unchanged; quotient: 1/vol(K′) = 2/vol(K) ✓; product: vol(K′) = vol(K)/2 ✗ | Quotient kept; product refuted |
| §13.5 c_K | inert self-dual v₀, n = 2 | same constant as §13.4; Needs already lists §13.4 | Agrees |
| §3.5 val(u) ≥ 1 | L♭ = ⟨1⟩ (n = 2); L♭ = ⟨ϖ⟩ | ⟨1⟩: val(u) ∈ {0, 1}, val(M) odd → 1; ⟨ϖ⟩: val(u) ∈ {1, 2}, 1 + val(u) odd → 2 | Holds |
| §3.5 confinement to M (LZ Lemma 8.2.2) | n = 2, L♭ = ⟨e⟩ with h(e,e) = ϖ; x = ϖ⁻¹u ∉ M; x = u ∈ M | x = ϖ⁻¹u has norm ϖ⁻²·ϖ² = 1, so L♭ + ⟨x⟩ has invariants (0, 1) and a′₁ = 0 < 1 = val(L♭); x = u gives (1, 2) and a′₁ = 1 ≥ 1 | Agrees with the lemma in both directions |
| §3.5 off L♭ ⊗ F by local constancy | V ∖ M open, L♭ ⊗ F a hyperplane | Φ vanishes on the dense subset (V ∖ M) ∖ (L♭ ⊗ F) of the open set V ∖ M, so it vanishes on V ∖ M | Added to route |
| §3.5 factorization Φ̂ = vol(L♭)·1_(L♭^∨) ⊗ φ̂⊥ | L♭ = ⟨e⟩, h(e,e) = ϖ | L♭^∨ = ϖ⁻¹O_F·e; vol(L♭) = [L♭^∨ : L♭]^(−1/2) = (q²)^(−1/2) = q⁻¹ = q^(−val(L♭)), as in the §3.4 Check | Agrees |
| §3.5 uncertainty principle on W | same; φ⊥ supported in ⟨u⟩, val(u) = 2 | supp φ⊥ ⊂ {val ≥ 2} ⊂ {val > 0}; φ̂⊥ = 0 on W_(<0) by §§2.5, 3.4; hypotheses of MetaplecticAutomorphicForms §3.3a hold on the 1-dimensional W | Applies |
| §3.5 translation equivalent | w = c·u, v(c) ≥ −1 | u^∨ = ϖ⁻²u, norm ϖ⁻⁴·ϖ² = ϖ⁻² (val −2); v(c + ϖ⁻²) = −2, so val(w + u^∨) = −4 + 2 = −2 < 0 | φ̂⊥ ≡ 0, including at w = 0 |
| §3.5 new Check (V_n fails) | L♭ = ⟨e⟩, h(e,e) = ϖ, y = ϖ⁻¹e, w = u; L♭ = ⟨e⟩ with h(e,e) = 1 | h(y + w, y + w) = ϖ⁻¹ + ϖ², val −1 < 0; self-dual case: e ∈ M has val 0 with Φ(e) = φ⊥(0) | Support conditions on V_n are not available; only on W |
| §3.5 Needs without §2.7 | route inputs | Schwartz property and transforms come from §§2.5, 3.4; §2.7 is LZ §6.4, an alternative proof of LZ Cor. 6.3.3 (LZ Remark 6.4.11, line 1811); §2.7 is still consumed by §9.6 | Dropped from §3.5 only |
| §6.8 (pattern) | LL2 proof of Theorem 2.7, lines 1861–1893 | LL2's Φ has full Fourier support in V_int (property (3)); restricting to the 0-coset of 1_(L♭←^∨) gives supp φ̂ ⊂ (V→)_int | No defect; §6.8 unchanged |
| §13.10 route | v inert self-dual; inert almost self-dual (q = 3); ramified Krämer; exotic; archimedean | correction 0 (first Check); c₀ = −1/(q+1) = −1/4; c_(2j) corrections with §8.7; exotic not admissible under §13.3; §13.7 | Route matches K lines 4170–4176 |
| §8.7 Needs | K proof of Theorem 9.7 | vanishing on W_(≤0) by induction and the nonintegral case; constancy on W_(≥0) ∖ {0} (K Theorem 8.2 with 4.16); no uncertainty principle (zero hits in K) | §3.3a removed |
| Pin claims (F04) | Tau Ceti 2fd255d9; Mathlib 1b1ccf4b | carrier at Carrier.lean:73, structureSheaf at StructureSheaf.lean:262; no FormalScheme type; Mathlib: 0 files | Statement corrected |

## Notes for the maintainer

- No Lean name, section number or target heading changed, so no roadmap citing this one is affected.
- **Effect on other roadmaps.** The constant c_K of the arithmetic Siegel–Weil formulas is now (−1)^n/vol(K). A downstream roadmap that copied the earlier product form of c_K from this roadmap should use the quotient. Searching for "vol(K)" in this package's README finds no other occurrence.
- **Reviewer questions for humans.** The review's "For the human reviewers" items (the McGraw03 licence, the certification of the YZZ09/LL1/LL2/Zha12 hosts, and the untested §8.6 and §9.5(b) q = n step) are not findings, and nothing was changed for them.
- **Untrusted text.** No passage in the review or the sources asked for anything outside this job.
