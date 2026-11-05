# GATE-EllipticCurveModularityPartII~10: reply to human review

One review since the last reply: CBirkbeck, 2026-10-26T19:18:38Z, at head `0e44114`. It has one numbered finding. Its "Checked and found sound" and "Scope and verification limits" sections ask for no change, so they get no number here (see Notes).

## H01 (CBirkbeck) — answered

The conflicts in the companion roadmaps are exactly as the review describes them, but no edit to `TauCetiRoadmap/EllipticCurveModularityPartII/` can remove them, so this pull request does not change.

- **PadicFamilies at `ed1464b`.** Line 85 and §§4.0.1–4.0.3 still build the theta units, the ordered symbols and `modularZeta c d M N k r r′` for every k ≥ 2 (line 2357), plus the reciprocity law (lines 2371–2373) and the CM elliptic-unit argument (line 2384). The README never mentions EllipticCurveModularityPartII.
- **ModularIwasawaMainConjectures at `7527d0f`.** Lines 17, 91 and 93 still give these constructions to PadicFamilies §4.0.

This roadmap's half of the contract is already in place: README line 11 (Scope) and line 1028 (Downstream consumers) state the export contract the review asks the companions to adopt. The review itself says that writing more here will not resolve the companions. The merge order runs EllipticCurveModularityPartII (line 191) → PadicFamilies (193) → ModularIwasawaMainConjectures (263). Because §6.0e comes before both companions, they can cite it now.

What each companion needs:

- **PadicFamilies §§4.0.1–4.0.3.**
  - Import the §6.0e units, ordered symbols, transfers, weight-two classes, raw and pushforward reciprocity, and the CM induced-character/elliptic-unit adapter.
  - Add the equality of its `k = 2, r = r′ = 1` moment with the §6.0e class. Levels, smoothing integers, norm maps, period choices, dual, and the coefficients `W_(M,N)(1)` and `W_f(1)` must all agree, and there is no extra sign.
  - Rewrite line 85 and the ownership sentences of §4.0 so that it extends §6.0e rather than constructing these objects itself.
- **ModularIwasawaMainConjectures.** Lines 17, 91 and 93 should say that at weight two the classes reach it through PadicFamilies' re-export of §6.0e.

The ownership search by object (theta and Siegel units, Kato's Euler system, modular zeta classes, elliptic units) found two more companions with the same pattern. The review does not cite either of them.

- **KatoEulerSystems** (board package #163 at `0ff66a0`, merge order 261).
  - Scope lines 64–72 name PadicFamilies §4.0 as the owner of the units, symbols, `modularZeta` and the reciprocity law. That stays consistent once PadicFamilies re-exports §6.0e.
  - Its §7.9 target `modularAbelianVariety_selmer_finite` (Kato Corollary 14.3, line 2465) contains the §6.0e rank-zero theorem as its case K = ℚ, χ trivial, A = A_f (computed in the table below). It should name §6.0e for that case.
- **ModularSymbolsPadicLFunctions** (#968 at `62f31bc`, merge order 131). Line 149 assigns "Kato's Euler system and explicit reciprocity law" to KatoEulerSystems. At weight two, the reciprocity law is the §6.0e law under this contract.

Whether this pull request should wait for those companion edits before merging is a merge decision. Nothing in this folder blocks the companion edits.

## Notes

- **Unnumbered sections of the review.** The review re-verifies the earlier repairs and records its verification limits. Two of those limits concern sources:
  - Kenku's internal locator: the manifest records Kenku1982 as `uncertified`, and the README cites it by its published locator (References, "cited by its published locator").
  - BPR's finite-range sieve: this roadmap imports BPR Theorem 1.1 as a rational-point theorem (Layer 6 Dependencies) and does not restate the sieve.
- **Citations rechecked this round.**
  - PadicFamilies §§4.0.1–4.0.3 resolve at `ed1464b`; the headings are at README lines 2353, 2369 and 2382.
  - ModularIwasawaMainConjectures lines 17, 91 and 93 resolve at `7527d0f`.
  - EulerSystemsAndKolyvaginSystems §§4.3, 4.17(c) and 4.20 resolve at `7a0e642`; part (c) is at line 3278.
  - K2SymbolsBrauerPartII §§1.1 and 5.5 resolve at the head of its open pull request.
  - The citation resolver reports no cross-roadmap citation and no Lean name found nowhere (main `546d9e4`, 354 open heads).
- **Ownership.** The search covered main, every open roadmap pull request head (by object, as listed above) and the board package KatoEulerSystems. No roadmap earlier than this one in the merge order constructs the weight-two theta-unit classes, their reciprocity or the modular rank-zero theorem. §6.0e therefore remains their owner. KatoEulerSystems and PadicFamilies plan these objects but come later in the order, so the construction moves down to this roadmap.
- **Signatures.** `Suggested.lean` is unchanged from `0e44114`. Its 24 elaborated signatures (none of which lost a section binder) are those the worker extracted at this head. No `#check` was rerun, because no declaration changed.
- **Sources.** No new source was needed. No `needs-references.toml` was written.
- **Commit.** None: nothing changed.

## Adversarial pass

No statement of this roadmap changed. The rows below check that the weight-two import the review asks of the companions is an equality that needs no change of normalization on either side. They also check the rank-zero containment reported under H01.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Twist of the k = 2, r = 1 moment (PadicFamilies §4.0.1) against `W_(M,N)(1)` (§6.0e) | k = 2, r = 1 | PadicFamilies twist k − r = 1 on the weight k − 2 = 0 local system; §6.0e twist 1 on `H¹_et(Y(M,N)_ℚ̄,ℚ_p)` | equal | none |
| Reciprocity factor for p ∤ MN | PadicFamilies `1 − p^(−r)A_p + p^(k−1−2r)B_p` at k = 2, r = 1 | exponents −1 and 2 − 1 − 2 = −1, so `1 − A_p/p + B_p/p`; §6.0e (Kato Theorem 9.5) gives `1 − A_p/p + B_p/p` | equal | none |
| Reciprocity factor for p ∤ M, p ∣ N, and for p ∣ M | same specialization | `1 − A_p/p` against `1 − A_p/p`; `1` against `1` | equal | none |
| Reciprocity domain | (r,r′) = (1,1); excluded pair (k−2,k−1) = (0,1) | PadicFamilies needs one of r, r′ equal to k − 1 = 1, which holds; its extra M ≥ 2 condition applies only at (0,1), not at (1,1); §6.0e imposes no M ≥ 2 | same domain | none |
| Level and smoothing conditions | p = 7: (M,N) = (1,4) and (1,3); c = d = 5; c = 3 | M + N = 5 is admitted and 4 is rejected in both. gcd(5, 6·7·1) = 1 and gcd(5, 6·7·4) = 1, so c = d = 5 is admitted in both. gcd(3, 42) = 3, so c = 3 is rejected in both | agree | none |
| Sign of the moment | {3,7} over ℚ₇, m = 3; swapped pair | PadicFamilies' Chern image is `κ(u) ∪ κ(v)`, which equals §6.0e `R_m(s)`. Cup coordinate 1; ordinary-Chern coordinate 2 = −1 mod 3 (the §6.0e Check, K2SymbolsBrauerPartII §5.5); the swap gives −1 on both sides | equality with no extra sign | none |
| KatoEulerSystems Corollary 14.3 at K = ℚ, χ = 1, A = A_f against §6.0e modular-rank-zero | G trivial; X₀(11) | ℤ[G] = ℤ, `I_χ = ker(ℤ → ℂ) = 0`, so `A(ℚ)^(χ) = A(ℚ)`; S = prime(1) = ∅, so `L_S = L`. `L(A_f,1) = ∏_σ L(f^σ,1)` is nonzero if and only if `L(f,1) ≠ 0`, by the §6.0e embedding-nonvanishing step. For 11a, `L(E,1) ≈ 0.2538 ≠ 0` and `E(ℚ) ≅ ℤ/5`: both statements give finiteness | §6.0e is the trivial-character, K = ℚ case | none here; reported for KatoEulerSystems |

## Build

`lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`: `Build completed successfully (9233 jobs).` The only warnings are `declaration uses 'sorry'`.

## Gate

`gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
