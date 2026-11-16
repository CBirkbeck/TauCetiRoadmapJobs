# Repair report: ArithmeticKTheoryPartII, round 6

Review settled: REV-PKG-ArithmeticKTheoryPartII~5 (two findings, both P3). Both were verified against the cached FGV author copy and the roadmap's own text, and both were applied. Only `packages/ArithmeticKTheoryPartII/README.md` changed (7 lines). `Suggested.lean`, `metadata.toml`, `sources.toml` and the plan's `gaps` are unchanged.

## F01 (P3) — applied

Verified with the FGV page markers (`=== page N ===`, each followed by the running head that carries N):

- Lemma 7.7 opens at FGV line 1805, on p. 39 (the marker is at line 1764). Its proof ends with the ⟨c⟩-splitting step at FGV line 1871, on p. 41 (the marker is at line 1866).
- Theorem 7.1 opens at FGV line 1668, on p. 36 (the p. 36 marker is at 1622 and the p. 37 marker at 1671). Remark 7.2 is at FGV line 1684, on p. 37.

Changes:

- §6.1: "pp. 39–40" → "pp. 39–41".
- §6.3: "pp. 37, 41–42" → "pp. 36–37, 41–42".
- §6.2 had the same defect: its range was short of a cited section. "§§7.2–7.3 … pp. 40–42" → "pp. 39–42", because §7.2 opens at FGV line 1778, on p. 39. The equations run from (7.12) at line 1865 (p. 40) to (7.19) at line 1943 (p. 42), and the proof ends at line 1965 (p. 42).

To check the whole pattern, I compared the cited FGV line of each of the 46 parenthesised FGV locators with its page range. One failed before the repair (§6.3) and none fails after. I also checked where every cited proof ends: Lemma 4.8, Proposition 4.7, Lemmas 7.4 and 7.6, Theorems 7.8, 7.10, 8.1 and 8.4, and Lemma 8.5 (table below). No other range is short.

## F02 (P3) — applied

Verified by comparing, layer by layer, the supplier and cross-layer items of every *Needs* line with the layer's Dependencies block. I also compared each supplier contract header with the sections the *Needs* lines cite from that supplier (23 suppliers).

There are exactly three omissions:

- Layer 0 lacks ArithmeticGaloisDuality R02.2, which §0.5 needs.
- Layer 7 lacks EtaleCohomologyFoundations §§F.0.2, F.4.1–F.4.6, which §7.4 needs.
- Layer 8 lacks §4.3, which the Hodge pairing in §8.4 needs.

One contract header is short: EtaleCohomologyFoundations, which omits F.0.2.

Changes:

- Each missing item is appended to its layer's Dependencies.
- The contract header "§§F.0.3, F.4. Consume integral/finite Tate twists…" becomes "§§F.0.2–F.0.3, F.4. Consume the finite étale Galois category and fundamental groupoid of Spec ℤ[1/p] (§F.0.2), integral/finite Tate twists (§F.0.3) and lisse coefficient categories with pullback (§F.4)."

F.0.2 exists on main as "Finite étale Galois categories and the étale fundamental groupoid" (EtaleCohomologyFoundations README line 200). It is stated for every scheme, and its Galois-category part for connected nonempty schemes; Spec ℤ[1/p] is one, because ℤ[1/p] is a domain. No other supplier header is short.

## Checks

- **Elaboration:** `lake env lean packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0. Its only messages are "declaration uses `sorry`" at 52:8 and 95:8. No `TauCeti.*` import is used, so nothing had to be built.
- **Signatures:** I put `#check @` for all four declarations (`exists_split_prime_with_signs`, `conjugateFractionalIdeal`, `IsSkewCMLine`, `exists_cm_lines_with_ideal_product`) in one scratch copy and elaborated it once. Every binder is present: p, n, `Nat.Prime p`, `p ≠ 2`, `0 < n`, `Field`, `NumberField`, `IsCyclotomicExtension {p ^ n} ℚ K`, `IsCMField`, ε, Φ with its one-per-conjugate-pair hypothesis, and `L ≠ 0`. Each type agrees with the README statement in §§2.3–2.4 and with the worker's signature file. Nothing changed.
- **Supplier direction:**

```text
depcheck: 245 roadmaps, 2246 edges, 0 problem(s)
```

  Exit 0, with no UPWARD, CYCLE or moved line.
- **Citations:** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name missing.
- **Overlaps:** no open pull request changes this roadmap, drops an id it cites, or is the only one defining an id it cites. The added citation of EtaleCohomologyFoundations §F.0.2 is to main.
- **Ownership:** no new construction was introduced, so there is no new ownership question.
- **Gate failures:** none were listed for this round.
- **Sources:** no new source was needed and `needs-references.toml` was not written.

## Adversarial record

Only locators and dependency lists changed. No mathematical statement, definition or Check changed, so the table records the computed values for each changed item.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.1 locator | Lemma 7.7, statement and proof | start: line 1805 (p. 39, marker 1764); □: line 1871 (p. 41, marker 1866) | pp. 39–40 is short | pp. 39–41 |
| §6.3 locator | Theorem 7.1, Remark 7.2, §7.3 | Theorem 7.1: line 1668 (p. 36; p. 37 marker at 1671); Remark 7.2: line 1684 (p. 37); §7.3: 1874 (p. 41) to □ at 1965 (p. 42) | p. 36 missing | pp. 36–37, 41–42 |
| §6.2 locator | §§7.2–7.3, (7.12)–(7.19) | §7.2: line 1778 (p. 39); (7.12): 1865 (p. 40); (7.19): 1943 (p. 42); □: 1965 (p. 42) | p. 39 missing | pp. 39–42 |
| Every other FGV locator: line in range | 46 locators | cited line's page inside the stated range: 45 of 46 before, 46 of 46 after | Only §6.3 failed | Covered above |
| "and its proof" ranges | Lemma 4.8; Prop. 4.7; Lemmas 7.4, 7.6; Thms 7.8, 7.10, 8.1, 8.4; Lemma 8.5 | 1263–1293: pp. 28–29 (range 28–29); 1232–1274: pp. 27–28 (27–29); 1747–1774: pp. 38–39 (38–39); 2009–2021: pp. 43–44 (43–44); 2044–2121: pp. 44–46 (44–46); 2217–2259: pp. 48–49 (48–49); 2295–2317: p. 50 (50); 2318–2338: pp. 50–51 (50–51) | All covered | None |
| Layer 0 Dependencies | §§0.1–0.5 Needs | Needs items not in Dependencies: 1 before (R02.2), 0 after | Fixed | Added R02.2 |
| Layer 7 Dependencies | §§7.1–7.7 Needs | 1 before (F.0.2, F.4.1–F.4.6), 0 after | Fixed | Added |
| Layer 8 Dependencies | §§8.1–8.6 Needs | 1 before (§4.3 of "§4.3–§4.4"), 0 after | Fixed | Added §4.3 |
| Layers 1–6 Dependencies | all Needs | 0 omissions (Layer 4 has §1.1; Layer 6 has §§0.5, 3.2–3.5, 4.5, 5.1, 5.3, 5.4) | Complete | None |
| Contract headers | 23 suppliers, each header against the union of cited sections | ArithmeticKTheory {3.1–3.5, 5.2, 6.11, 6.15–6.16, 7.1–7.5} ⊆ header; StableHomotopyKTheory {3.20, 3.27, 3.34–3.37, 4.16–4.27, 5.1–5.19, 7.1–7.28} ⊆ header; EtaleCohomologyFoundations {F.0.2, F.4.1–F.4.6} ⊄ {F.0.3, F.4} | One short header | F.0.2 added |
| F.0.2 applies to Spec ℤ[1/p] | connectedness, nonemptiness | ℤ[1/p] is a domain, so Spec is irreducible, hence connected; Spec contains (0), so it is nonempty | Hypotheses hold | None |

## For the maintainer

- No name changed. Other roadmaps cite no id of this roadmap that was moved or dropped.
- The FGV author copy has 64 pages. All page locators refer to it, as `sources.toml` says. The 13 source issues the review lists (misprints and two gaps) were already handled by the README's statements and need no further change here.
- Ownership against open pull requests: no new object was introduced, so no new search was needed. The citations that were added (EtaleCohomologyFoundations §F.0.2, ArithmeticGaloisDuality R02.2, §4.3) were already in the *Needs* lines and resolve on main.
- No suspicious instructions were found in the review text.
