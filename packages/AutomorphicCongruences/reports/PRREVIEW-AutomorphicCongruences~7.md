# Review of AutomorphicCongruences (pull request #1816 at c30ac90)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since e508d2e (four reworded sentences in `TauCetiRoadmap/AutomorphicCongruences/README.md`), with the pull request's title and description read against this head. The folder needs no edit; both findings are about the description.

## R01 (P3) — The description says the Lean states definitions and theorems and builds with a `sorry` warning; it states nothing

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "Validation: the targeted Lake build succeeds with `sorry` as the only warning".
**Claim:** A reader concludes that `Suggested.lean` states headline theorems with `sorry`. At this head it declares nothing, because no headline is statable at the pins, and the build gives no warning.
**Witness:** `TauCetiRoadmap/AutomorphicCongruences/Suggested.lean` lines 8–10 ("None of them is statable at the pins, so the file states nothing"); 0 declarations, 0 occurrences of `sorry`; `lake env lean` exits 0 with empty output.
**Repair:** Replace the two clauses by: "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names each headline and the carriers it lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`);".

## R02 (P3) — The summary says Hida theory is imported; the unitary Hida theory is a target of this roadmap

**Location:** pull request description, summary block: "Katz's measure, Hida theory and generalized matrix algebras are imported rather than rebuilt."
**Claim:** Only the GL₂ and Hilbert (nearly ordinary) Hida theory is imported. The Hida theory of GU(2,2) and the semi-ordinary theory of GU(3,1) are stated here as targets.
**Witness:** `TauCetiRoadmap/AutomorphicCongruences/README.md` lines 474, 765, 909: "### 1.2 Hida theory for GU(2,2): freeness, control and the boundary sequence", "### 2.2 Semi-ordinary Hida theory…", "### 2.9 Semi-ordinary Hida theory on GU(3,1) in general weight"; line 13 imports "totally real nearly ordinary Hida theory" only.
**Repair:** "Katz's measure, Hida theory for GL₂ over ℚ and over totally real fields, and generalized matrix algebras are imported rather than rebuilt; the ordinary Hida theory of GU(2,2) and the semi-ordinary theory of GU(3,1) (§§1.2, 2.2, 2.9) are targets here, on the Igusa towers of gap:unitary-ordinary-igusa."

## Previous findings

- none: the previous report (of e508d2e) was an acceptance and raised no finding. The plan-registration point it recorded as settled is under `## For the human reviewers`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.12, hypotheses on f and K (reworded) | old against new sentence, clause by clause | even weight k ≥ 2; trivial character; N prime to p; K imaginary quadratic, p split: 4 of 4 clauses kept; statement from "let R = O^ur[[Γ_K]]" on is byte-identical | same hypotheses | none |
| §2.12 conclusion (cited by the changed sentence) | `FW line 5713`–`5716`; `CLW-addendum line 221` | FW Lemma 7.31, p. 96: P height one, P ≠ (p), ord_P(L^(Gr,Σ)_(f,K)) ≤ ord_P(E_D); addendum Thm 4.0.1 gives two families ϕ_1, ϕ_2 | locator and inequality direction agree | none |
| §2.14 (reworded) against FW Thm 7.32 | `FW lines 5717–5729`, p. 96 (page markers 5683, 5735) | source: even k, trivial character, N prime to p; (ρ̄_f\|G_(ℚ_p) abs. irreducible) or (f ordinary); each nonsplit q \| N has q ∥ N, at least one such q; 2 nonsplit ⇒ 2 ∥ N; ρ̄_f abs. irreducible on G_K. New text: "ordinary unless abs. irreducible" = the same disjunction (truth table: irr ∨ ord in all four cases); the other 6 clauses each present; twist ℓ ↦ −ℓ^(k/2−1) unchanged | 7 of 7 hypotheses, none added or dropped | none |
| §2.22 (reworded; seeded sample) against Wan-2020 Thms 1.1–1.2 | `Wan-2020 lines 76–104`, pp. 2–3 (markers 44, 85, 121); line 46 | source: family new outside p, square-free tame level N, weight-two member of trivial nebentypus that is the ordinary stabilization of a level-N newform; κ ≥ 6; (a)–(g); Thm 1.2 (a)–(d), fractional ideals after ⊗L; conductor exponents ≤ 1 at v_0, v̄_0 (line 46). New text "new at the primes of N": tame level N is prime to p, so the primes outside p at which newness can fail are those of N | same family; (a)–(g) and (a)–(d) unchanged; pp. 2–4 correct | none |
| §6.4 proof (reworded) against BCS Prop. 5.2.1 and Lemma 5.2.3 | `BCS lines 479–487` (p. 9), `521–530` (p. 10) | (i) p inert in F: a condition at p; (iii) ℓ \| N inert if ℓ ≡ −1 mod p, split otherwise: conditions at ℓ \| N; p ∤ N so the two sets of primes are disjoint. "Any F meeting both with D_F odd": (i), (iii) make F unramified at p and at N, so (D_F, pN) = 1 and D_F > 1 has a prime r ∤ pN; (ii) makes r split in K, so FK/K ramifies above r and FK is not in the splitting field of ρ_g\|G_K (unramified outside pN): (iv) holds. (vi): 5 ramifies in ℚ(√5), so (i) excludes it at p = 5 | "any" is correct; K chosen after F with (ii), as the source does | none |
| R01: `Suggested.lean` against the description | the file at this head | 59 lines, 0 declarations, 0 `sorry`; `lake env lean` exit 0, empty output, 4.1 s | description contradicted | R01 |
| R02: ownership of Hida theory | README headings and scope table | headings containing "Hida theory": 3 (lines 474, 765, 909), all unitary; scope table line 13 imports PadicFamilies §§5.6–5.9 "totally real nearly ordinary Hida theory" | summary sentence too wide | R02 |
| Description, BCS endpoint | README §§7.9, 7.10, 8.1 | line 2254: p > 3 good ordinary, E[p] irreducible, rational; line 2300: equality in Λ ⊗ ℚ_p, in Λ under (im) | summary block's "rationally in general and integrally under the rank-one image condition" agrees | none |
| Description, consumers | README lines 29, 2324–2325; merge order | Layers 1, 2, 3, 4, 7 to ModularIwasawaMainConjectures; §§5.4, 5.10, 5.12–5.13, 6.1–6.6 to HeegnerPointEulerSystems; merge-order lines 396 < 397 < 398 | "They feed …, and Layers 5–6 also feed HeegnerPointEulerSystems" agrees | none |
| Description, owned statements and generality | README lines 9, 37, 342 | lattice theorem: CM quadratic M/F, F totally real, middle rank n ≥ 1; Ch divisorial over noetherian normal domains; Ichino §2.4, Harris §2.6, Nakamura §3.7 listed as owned; Katz from AutomorphicPadicLFunctionsPartII §8.5; generalized matrix algebras from IntegralHeckeAndGaloisDeterminants §1.3 | agree | none |

The rows for the statements the diff leaves untouched stand as in the previous review, of e508d2e.

- Source locators checked against the text: 6 (FW Thm 7.32 p. 96, FW Lemma 7.31 p. 96, Wan-2020 Thms 1.1–1.2 pp. 2–3, BCS Prop. 5.2.1 p. 9, BCS Lemma 5.2.3 p. 10, CLW-addendum Thm 4.0.1).
- Seeded sample: of the fifteen targets only §2.22 falls in a changed passage; checked above. The other fourteen are untouched.
- Library declarations opened: none (the diff changes no Lean and cites no library declaration). The `#check @name` comparison and the one-tactic probe have nothing to run on.
- Cross-roadmap citations in the changed passages: none (the four sentences cite only §§0.4, 2.10, 2.14, 5.13 of this README; anchors present at lines 254, 925, 1026, 1969). Headline theorems: all named in the module docstring as not statable; none added or removed.
- Gate, rerun at c30ac90 against origin/main: every check 0, `OK`, exit 0 (the worker's run also has `build=0`). `git diff --stat origin/main...HEAD` outside the folder: empty.
- Dependency check: `depcheck: 236 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Overlap check: read ModularIwasawaMainConjectures, HeegnerPointEulerSystems, KatoEulerSystems (their relation to this roadmap as settled in the review of e508d2e; the diff adds no object); nothing shared. `overlaps.md`: no other pull request changes this roadmap, no dropped or revision-only id. Ownership against the other open pull requests was not rechecked this round.
- Source independence: changed passages only; 4 passages compared with 3 sources (FW, Wan-2020, BCS), none shared (longest common run 6 words, "a positive proportion of imaginary quadratic fields", `BCS line 525`); largest share FW, 44 of the 125 linked locators of the nine most cited ids; contents not compared again (no layer added, removed or reordered).
- Remark, no change asked: the description's prose and README line 3 both say "the rational and integral ordinary main conjectures … under the rank-one image condition"; only the integral one needs (im), as the summary block and §8.1 state.

## Not verifiable

- `Hung2017` is uncertified and `Ichino2008`, `Ikeda1994`, `Harris1984`, `Rubin2000`, `BST19` are waived; no changed line cites them.
- The description's "after 6 independent review rounds and 2 red-team rounds" is a statement about the job board, not about the head; not checked.

## Source issues

- none

## For the human reviewers

- **Not tested.** The README states 21 `What <Supplier> must provide (gap:…)` contracts; the board plan declares 16 (README-only: `katz-ht93-normalization`, `hecke-l-values-mod-p`, `hida-rankin-selberg-cm`, `anticyclotomic-nonvanishing-mod-p`, `vatsal-theta-mu`). Registering the five is a board task, recorded as settled by the earlier reviews.
