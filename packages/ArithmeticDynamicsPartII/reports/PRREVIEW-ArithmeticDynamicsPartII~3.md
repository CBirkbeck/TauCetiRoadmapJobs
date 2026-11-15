# Review of ArithmeticDynamicsPartII (pull request #1686 at 7dd79a5)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since 16dd84b (README §3.0, two target paragraphs; `## References`, two new entries), plus the pull request's title and description. The gate fails on two style hits, so the folder cannot be accepted at this head; all three findings are P3.

## R01 (P3) — `[Fintype K]` beside `[Field K]` in `semisimple_orbit_congruence`

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/Suggested.lean:243` “theorem semisimple_orbit_congruence (K : Type*) [Field K] [Fintype K] (hq : 3 ≤ Fintype.card K)”, and `:247` “let q := Fintype.card K”.

**Claim:** The gate’s `statement-hygiene` rule refuses `[Fintype K]` beside `[Field K]`; a finite field is stated with `[Finite K]` and `Nat.card K`.

**Witness:** Gate at 7dd79a5: “line 243: P3 `[Fintype K]` beside `[Field K]` (theorem `semisimple_orbit_congruence`)”.

**Repair:** Replace `[Fintype K]` by `[Finite K]` and both `Fintype.card K` by `Nat.card K` (lines 243, 244, 247). Tested on a scratch copy: `lake env lean` gives the same 23 `sorry` warnings and nothing else; at K=𝔽₅, t=1 both cardinals are 5 and the statement is unchanged (divisor 3, orbit 36).

## R02 (P3) — `[Fintype K]` beside `[Field K]` in `valuation_orbit_congruence`

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/Suggested.lean:255` “theorem valuation_orbit_congruence (K : Type*) [Field K] [Fintype K] (hq : 3 ≤ Fintype.card K)”, and `:260` “let q := Fintype.card K”.

**Claim:** Same rule as R01.

**Witness:** Gate at 7dd79a5: “line 255: P3 `[Fintype K]` beside `[Field K]` (theorem `valuation_orbit_congruence`)”.

**Repair:** Replace `[Fintype K]` by `[Finite K]` and both `Fintype.card K` by `Nat.card K` (lines 255, 256, 260). Tested in the same scratch copy as R01; it elaborates with `sorry` the only warning.

## R03 (P3) — The DKS13 reference line misquotes the bound of the cited theorem

**Location:** `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:1085` “its bound 2d₀D(3h₀/(2d₀)+Σ_ℓ h_ℓ/d_ℓ+c(n,n,N)) gives the form C(n,N)(Dⁿ⁺¹h+dDⁿH+dDⁿ⁺¹)”.

**Claim:** The cited theorem has one height h, the maximum over the Fⱼ, in every summand, not a height h_ℓ per polynomial; as written the line attributes a stronger bound to the source. The line also uses D for the source’s degree product and for §3.0’s degree bound.

**Witness:** DKS13 line 166 sets h as the maximum of the h(fⱼ) and D as the product of the min{s,r+1} largest degrees; DKS13 lines 175–186 have the summand h/d_ℓ.

**Repair:** Replace the clause by: “its bound 2d₀Δ(3h₀/(2d₀)+Σ_ℓ H/d_ℓ+c(n,n,N)), where Δ is the product of the min(N,n+1) largest degrees of the Fᵢ, d₀=max(1,deg G), h₀ is the height of G and H the maximum height of the Fᵢ, gives the form C(n,N)(Dⁿ⁺¹h+dDⁿH+dDⁿ⁺¹)”. Tested: Δ≤Dⁿ⁺¹, ΔΣ_ℓ H/d_ℓ≤(n+1)DⁿH, d₀≤d give 3Dⁿ⁺¹h+2(n+1)dDⁿH+2c·dDⁿ⁺¹.

## Previous findings

- R01 — repaired: §3.0 now cites “quoting DKS13, Theorem 2, which is Theorem 0.2 of the arXiv version specialised to V=𝔸ⁿ” and “quoting BS02, §4.1 Theorem”; both works are in `## References` with locators (the DKS13 line’s formula is R03).
- R02 — repaired: “A nonzero constant Fᵢ=c gives b=|c|, r=1, Qᵢ=sign(c)·G and the other Qⱼ=0 directly, within the bound since log|c|≤H. This extends the nonconstant-polynomial formulation without changing the bound.”

## Verified sound

| Statement | Instances tried and computed values on both sides | Result / change |
|---|---|---|
| §3.0 Nullstellensatz, new constant clause | Fᵢ=c≠0: c·sign(c)·G=|c|·G¹, so b=|c|, r=1; log|c|≤H≤C·dDⁿH holds once C≥3⁻ⁿ⁻¹ (d,D≥3). H=0 forces c=±1, log b=0. Check F₁=2, G=1: 2·1=2·1. | Holds; R02 of the previous report repaired. |
| §3.0 Nullstellensatz, citation of DKS13 | DKS13 lines 164–188 on V=𝔸ⁿ: deg V=1, ĥ(V)=0, r=n; bound 3Δh₀+2d₀ΔΣ_ℓ H/d_ℓ+2c·d₀Δ ≤ 3Dⁿ⁺¹h+2(n+1)dDⁿH+2c·dDⁿ⁺¹; hypothesis d_s≥1 at line 166. | Locator and “every Fᵢ nonconstant” correct; the reference line’s h_ℓ is R03. |
| §3.0 torsion bound, citation of BS02 | BS02 lines 306–313 (§4.1 Theorem, preprint p. 7): at most 22V(f) or infinitely many with a factor xⁱyʲ−ω, (i,j)≠(0,0); lines 449–457 (Remark 3, p. 10): V(f)=d²/2 at worst, 22·d²/2=11d². | Locators, pages and the derivation of 11d² correct. |
| `semisimple_orbit_congruence` (R01) | Enumerated oriented orbits: (q,t)=(5,1): n=6, m=6, divisor 6/gcd(6,4)=3, orbit 36; (7,3): n=8, divisor 2, orbit 64; (11,4): n=10, divisor 5, orbits 40, 60; (5,0): divisor 1, orbit 16. | True at each; unchanged by `Nat.card`. |
| `valuation_orbit_congruence` (R02) | Same carrier change; `Nat.card K = Fintype.card K` (5, 7, 11 above), so q³−q and the valuations are unchanged. | Statement unchanged by the repair. |

Rows for the statements the diff leaves untouched stand as in the previous review, of `16dd84b`.

- Gate rerun at 7dd79a5: every check 0 except `statement-hygiene=2` (R01, R02), `FAIL`; no stray file, no change outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).
- Dependency check: `depcheck: 243 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line; no supplier gap declared.
- Elaboration: `lake env lean` on `Suggested.lean`, 8 s, 23 `declaration uses sorry` warnings and nothing else; the diff changes no Lean line, so signatures and the padding probe stand as in the previous review.
- Source locators checked against the text: 5 (DKS13 Theorem 0.2 and its nonconstancy hypothesis; BS02 §4.1 Theorem, its page 7, Remark 3 and its page 10). The seeded sample has no target in the changed passages.
- Pull request text read against the head: the title and each sentence of the summary block and the prose agree with the README and `Suggested.lean` at 7dd79a5 (`stable_card_dvd` with p≠3; `squarefree_integral_image` with local transitivity and MP(p); consumers as in `## Downstream consumers`; Nullstellensatz, torsion bound and primitive-group theory owned in §3.0 and §7.5a; build, dependency and outside-folder counts as recomputed above). No finding.
- Cross-roadmap citations: the diff adds none. NonabelianLevelStructures (open) cites §§0.1, 1.4, 2.1–2.4, 3.6–3.7, 4.2, 6.0–6.6, 7.2–7.4a of this roadmap; all exist at this head.
- Overlap check: read NonabelianLevelStructures, PolynomialGaloisGroupsPartII, ErdosProgressionPowers; level stacks, trace dictionary and orbit congruences: owner ArithmeticDynamicsPartII §6.0–§6.6 (NonabelianLevelStructures cites them); Babai’s estimate: PolynomialGaloisGroupsPartII §4.4; divisor-subpower estimate: ErdosProgressionPowers §0.9; nothing owned twice.
- Source independence: changed passages only; 4 passages compared with 3 sources (CKSZ14, DKS13, BS02), none shared (longest common run 5 words, a standard name); largest share C24, 51 of 187 source-key mentions; contents not compared again, the diff adds, removes and reorders no layer.
- Remark (untouched text): NonabelianLevelStructures `README.md:55` asks this roadmap for alternating containment at p≡3 mod 4 under MP(p) as a declared gap, which `README.md:15` here places outside the roadmap; see the last section.

## Not verifiable

- DKS13, published version (Ann. Sci. ENS 46): not opened; “Theorem 2” is identified with arXiv Theorem 0.2 through CKSZ14 line 133 and the matching bound.
- BS02, published pages 67–85: not opened; the text read is the author-page preprint, whose section and page numbers the README cites as such.
- M25 and DM96: settled uncertified; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Licence: BS02 was read from the author’s university page (`webhomes.maths.ed.ac.uk`), a host the sources service does not classify; I passed it as an author page.
- Licence: DKS13 and BS02 are cited in `README.md:1085–1086` but the board’s `sources.toml` for this roadmap has no entry for either.
- Scope: M25 (2025), the route of §1.4, is recorded uncertified and is cited 13 times; I did not establish whether it is refereed.
- Scope: the headline `squarefree_integral_image` states the origin plus the primitive locus, where C24 Theorem 5.5.8(b) (C24 line 4688) states full surjectivity; the first review recorded the source as in error (mixed points modulo 65).
- Scope: NonabelianLevelStructures `README.md:55` declares `gap:markoff-alternating-three-mod-four` with this roadmap as supplier; `README.md:15` here says that statement, proved with the classification of finite simple groups in MP18 Theorem 1.4, is outside this roadmap.
