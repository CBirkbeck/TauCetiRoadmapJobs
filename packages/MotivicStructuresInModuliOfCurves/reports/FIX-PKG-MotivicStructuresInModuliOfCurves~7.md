# FIX-PKG-MotivicStructuresInModuliOfCurves~7

This round repairs the four findings of `REV-PKG-MotivicStructuresInModuliOfCurves~6` on `packages/MotivicStructuresInModuliOfCurves`.

Changed files:
- `README.md`;
- `sources.toml`: locators and `cited_for` of `keel`, `getzler-semiclassical`, `petersen-genus-two` and `petersen-abelian-surfaces` (no new work, no new key).

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no supplier gap was added or changed. The review's "For the human reviewers" section was not acted on.

## F01 (P1) — applied differently

New target §3.6 "Cusp multiplicities of genus-one and genus-two moduli beyond the polynomial range" (Layer 3, not §1.7: it needs §3.1, and Layer 1 precedes Layer 3). §11.3: multiplicity `11` by Poincaré duality and §4.7. §§11.4, 11.5, 11.6, 11.9, 12.3: "is Getzler's" / "by evaluating §1.4" → §3.6; *Needs* updated. Also §12.4, §12.10.

- The finding is right. §1.6 covers `g = 1, n ≤ 10` and `g = 2, n ≤ 7` only; nothing owned `429`, `6006`, `186263`, `264`, `836`, and §§11.4–11.6, 11.9 need them (CLP proves spanning or a lower bound only: clp lines 1079–1080, 1088–1089, 1094–1098, 1049–1054).
- §3.6 states, in both realizations: `e_c(M_{1,1}, Sym^{2k}V) = −S_{2k+2} − 1` (the weight-zero Eisenstein line and the cusp realization; getzler-semiclassical lines 509–514); `e_c(M_{1,m})` as `(L − V)_{m−1}` expanded in the `SL₂` representation ring over `ℤ[L]`, each symplectic contraction carrying `L`, and the equivariant class by Getzler's residue formula (lines 517–544); the cusp-isotypic part of every `H^{odd}(M̄_{1,n})` through an explicit sum over stable trees (the only graphs carrying `S_{2k+2}` in genus one, all automorphism-free); the genus-two classes `e_c(M₂, V_{a,b})`, `a + b ≤ 12`, through the Torelli isomorphism `M₂^{ct} ≅ A₂` (petersen-genus-two line 153), `H*(A₂) = ℚ ⊕ ℚ(−1)` (line 258) and Petersen's Theorem 2.1 (petersen-abelian-surfaces lines 145–178, Remark 2.2 at 183–188); and the five multiplicities with locators getzler-semiclassical lines 638–642 and clp lines 1049–1051, 1092–1098, 1151–1155. Six Checks with computed values.
- Placement differs from the suggested repair because §1.7 would have needed §§3.1–3.2 from a later layer. The route of the suggested repair is otherwise kept; the genus-one route is made explicit (and was recomputed, below).
- The genus-two inputs (compact-type Torelli in genus two and Petersen's computation on `A₂`) are owned by no roadmap: SiegelModularForms excludes "cohomology of local systems" on `A₂` from its scope, StableReductionPartII §6.3 has only the smooth full-level Torelli morphism, and AutomorphicGaloisRepresentations treats no Siegel threefold. Scope now lists them as a fourth family of inputs owned here (§3.6). The stack `A₂` itself is imported from PELModuli §M5.2 (new `### From PELModuli` contract; PELModuli is earlier in the merge order).
- Pattern: every attribution of a number to "Getzler's" or to an evaluation of §1.4 was replaced (§§11.3–11.6, 11.9, 12.3); §12.4 states `186263` and gains `3.6` in its *Needs*; §12.10's Check said "CLP's inputs describe all odd cohomology of degree at most fifteen", now §3.6, and its route used §12.9 for genus-one `H¹⁵`, which §12.9 does not cover (`g ≥ 2`), now §3.6. "How to read the build", the Layer 3 introduction and Dependencies, and the Layer 11 Dependencies (duality for §11.3) are updated.
- Source issue found while checking (the review also reports it): getzler-semiclassical line 640 prints the `n = 14` row as `286L³ + 6006L² + 286L`; the recomputation gives `286 + 6006L + 6006L² + 286L³`. Added under "Corrections to the sources".

## F02 (P2) — applied

§8.5 now imports the canonical embedding and genus-four ideal from CanonicalModelsAndGonality §§3.4, 9.1, 3.9(b), read through AlgebraicCurves Layer 12, and owns only uniqueness and rationality of the quadric and the converse. *Needs*: SchemeAndStackFoundations Layer 3 → CanonicalModelsAndGonality §§3.4, 3.9, 9.1; AlgebraicCurves Layer 12; SchemeAndStackFoundations §§2.20, 3.3. Contract, Scope and Layer 8 Dependencies updated.

- Verified: main `TauCetiRoadmap/SchemeAndStackFoundations/README.md` Layer 3 is §§3.1–3.8 (genus, Riemann–Hurwitz, Riemann–Roch, Picard objects) and contains no canonical embedding. CanonicalModelsAndGonality (head of its open pull request) §3.4 is Noether's theorem over a perfect field, §9.1 its scheme form (canonical morphism a closed immersion onto the canonical model, `g ≥ 3`), §3.9(b) the genus-four ideal over `k̄`.
- Differences from the suggested text: the statement is over a perfect field `k` (the counts are over `𝔽_q`), not over an algebraically closed field; §9.1 is cited for the scheme form; uniqueness and `k`-rationality are proved from the kernel of `Sym² H⁰(C, ω) → H⁰(C, ω^{⊗2})`, whose formation commutes with extension of `k`; the converse names its route (adjunction `ω_C ≅ O_C(1)`, `h⁰(O_C(1)) = 4` by the Koszul resolution) and therefore also SchemeAndStackFoundations §2.20 (dualising sheaves). BFP locator widened to pp. 1334–1335 (bfp lines 500–505, 516).

## F03 (P3) — applied differently

Conventions: "Algebraic-cycle constructions of Layers 4–6 … point counts of Layers 7–9" → "The algebraic-cycle constructions of Layers 5–7 are over fields of characteristic zero, except the definitions and permanence properties of §§5.1–5.2, which, like §0.6, hold over an arbitrary field. The point counts of Layer 1 (§§1.1, 1.5 and 1.6) and of Layers 8–9 …".

- The finding is right (Layer 4 is cohomological; Layer 7 has no count). The suggested sentence would have put §5.1 ("over a field `k`") and §5.2 (whose `BC₂` Check is over any field of characteristic not two) in characteristic zero, contradicting their statements; hence the exception.

## F04 (P3) — applied

§2.6: "(Keel, Introduction, results (1) and (4), pp. 545 and 549, …)" → "results (1) and (4), p. 545, and the list of results proved from the blow-up description, (1), p. 549, and (6), p. 550, … the divisor presentation with its three relations"; *Needs* "§§5.1–5.6 (… blow-ups)" → "§§5.1–5.7 (… the blow-up decomposition of §5.7)". `sources.toml` `keel` locator updated.

- Verified: keel lines 20–29 (p. 545), 180–181 (p. 549), 203 (result (4), the rank recursion, p. 550) and 227–239 (result (6), the presentation, p. 550); main SchemeAndStackFoundations §5.7 begins at its line 8375 and carries the blow-up decomposition at line 8476. No other citation of §§5.1–5.6 for blow-ups exists in the README.

## Checks

- Dependency check, with `--movable`:

```text
depcheck: 240 roadmaps, 2268 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `lake env lean packages/MotivicStructuresInModuliOfCurves/Suggested.lean` from the content checkout: exit 0, no output. The file is unchanged (`import Mathlib`, the module docstring, an empty namespace).
- `#check @name` comparison: `Suggested.lean` declares nothing, so there is nothing to compare; the one "declaration" of `scratch/signatures.md` and `scratch/library-matches.md` is the word "and" of the docstring, a false lead. No Lean name was added or removed, and the README presents no backticked name as this roadmap's own.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (checked against main and 458 open heads), including PELModuli §M5.2 and CanonicalModelsAndGonality §§3.4, 3.9, 9.1.
- House-style scan of the README: no LaTeX delimiters, machine paths, review or round labels, or process words.

## Adversarial pass

Genus-one multiplicities recomputed independently with a short exact script (rational polynomial arithmetic, kept in the job's scratch directory): genus-zero classes `e(M̄_{0,s+1})` by the tree recursion, `c_m` as the `Sym^{2k}V` multiplicity in `(L − V)_{m−1}` with the contraction twist, and `Σ_m c_m B_{n,m}`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.6 genus-zero input | `s = 3, 4, 5, 6` | `e(M̄_{0,4}) = L + 1`, `e(M̄_{0,5}) = L² + 5L + 1`, `L³ + 16L² + 16L + 1`, `L⁴ + 42L³ + 127L² + 42L + 1` | Matches Keel's Betti numbers (`b₂(M̄_{0,5}) = 5`, §2.6 Check). | none |
| §3.6 `e_c(M_{1,m})` | `m = 2, 3` | `(L − V)` gives `L·L = L²`; `(L − V)(L − V − 1) = L² − L − (2L − 1)V + Sym²V + L`, so `e_c = L³ − L² − 1 + L² = L³ − 1` | Matches `#M_{1,2} = q²`, `#M_{1,3} = q³ − 1`. | none |
| §3.6 `S₁₂` multiplicities | `n = 11, …, 15` | `1`; `11, 11`; `66, 429, 66`; `286, 6006, 6006, 286`; `1001, 53053, 186263, 53053, 1001` (powers `L⁰, L¹, …`) | Equal to getzler-semiclassical lines 635–642, except the misprinted `n = 14` row; palindromic as duality requires; `L⁰` coefficients `binom(n − 1, 10)` as §4.7. | Correction added. |
| §3.6 contraction twist | `n = 13` without the twist | `77, 418, 66` (sum `561` unchanged) | Not palindromic: the twist is pinned by duality. | Check added. |
| §3.6 by hand | `n = 12`, `n = 13` | `66 + (11L − 55) = 11 + 11L`; `(286L + 2431) + (858L − 4290) + (66L² − 715L + 1925) = 66 + 429L + 66L²`; `σ₂(L, …, L − 11) = 66L² − 726L + 1925` | Holds. | Checks 1–2. |
| §3.6 `S₁₆` | `n = 15` | `c^{(14)}_{15} = 1`, `B_{15,15} = 1`, sum `1` | One `S₁₆` in `H¹⁵(M̄_{1,15})`, as clp line 1155. | none |
| §3.6 Eisenstein line | `k = 1` | `H¹(M_{1,1}, Sym²V) = ℚ(−3)` (Eisenstein); duality `H¹_c(Sym²V) ≅ H¹(Sym²V(2))^∨(−1) = ℚ(−1)^∨(−1) = ℚ(0)`; `H⁰_c = H²_c = 0` | `e_c = −S₄ − 1 = −1`, weight zero. | none |
| §3.6 genus two `(0, 0)` | `M₂`, `A₂`, `Sym² M_{1,1}` | `e_c(A₂) = L³ + L²` (duals of `ℚ`, `ℚ(−1)`), `σ₂(L) = (L² + L²)/2 = L²`, `e_c(M₂) = L³` | Matches `#H₂(𝔽_q) = q³` (§8.3 at `g = 2`). | Check 4. |
| §3.6 Petersen terms | `(4,4)`, `(9,1)`, `(9,3)`, `(10,0)`, `(11,1)` | `s′₁₂L⁵` in `H²_c` and `H³_c`, cancels; `S_{a+3} = S₁₂` at `a = 9`; `s₁₆ S₁₂(−2) = L²S₁₂` at `(11,1)`; `s₁₄ = 0` at `(10,0)`; `H²_c(A₂, V_{10,0}) ⊇ s₁₂ℚ = ℚ` | The Euler characteristic does not depend on `s′`. | Check 5. |
| §3.6 genus two `(2, 12)` | weights `11, …, 29` | `d = 15`; `H¹¹ = 0` (§10.8), `H¹⁹, H²¹, …` dual to `H¹¹, H⁹, …` `= 0`; `S₁₂`-part `−(264L + 836L² + 264L³)S₁₂` | Consistent with `264 = 66 + 132 + 66` (§11.6), `836 = 825 + 11` (§11.9). `264`, `836` themselves not recomputed. | Check 6. |
| §11.3 duality | `(1, 12)` | `d = 12`; `H¹³ ≅ (H¹¹)^∨(−12)`; `S₁₂^∨ = S₁₂(11)`, `S₁₂(11)(−12) = LS₁₂`; `dim H¹¹ = 2·binom(11,10) = 22` | `(LS₁₂)^{⊕11}`, independent of Getzler. | Route changed. |
| §11.6 statement | `264` independent maps | Kernel of `(LS₁₂)^{264} → H¹³` is `LS₁₂ ⊗ W′`, `End(S₁₂) = ℚ`; `W′ = 0` by independence; dimensions `528 = 528` | `H¹³(M̄_{2,12}) ≅ (LS₁₂)^{⊕264}` holds as an isomorphism, as a graphical basis requires. | `^ss` dropped from the conclusion. |
| §8.5 uniqueness | `g = 4` | `dim Sym²H⁰(ω) = 10`, `h⁰(ω²) = 9`, kernel `1`; over `k̄`, the degree-two part of `(Q, F)` is `k̄Q` | One quadric, defined over `k`. | Route added. |
| §8.5 converse | `(2, 3)` in `ℙ³` | `deg C = 6`, `ω_C = O_C(2 + 3 − 4) = O_C(1)`, `2g − 2 = 6`, `g = 4`; `I_C(1)`: `0 → O(−4) → O(−1) ⊕ O(−2) → I_C(1) → 0`, `H⁰ = H¹ = 0`, so `h⁰(O_C(1)) = 4` | Complete canonical system. | Route added. |
| §8.5 rank | rank-two `x₀² − εx₁²` | geometrically two planes | Excluded by "irreducible over `k̄`" (§3.9(b)), as §8.4 Check 3. | none |
| Conventions (F03) | §§5.1, 5.2, 5.3, 7.1 | §5.1 "over a field `k`", §5.2 `BC₂` Check in characteristic `≠ 2`, §5.3 over `ℂ`/characteristic zero, §7.1 characteristic zero | Exception needed for §§5.1–5.2. | Applied with exception. |
| §2.6 locators (F04) | keel pages | result (6) at keel lines 227–239, page marker 550 at line 200; result (4) at line 203 | Presentation is (6), p. 550. | Applied. |

## Ownership, sources and notes for the maintainer

- Ownership: the new §3.6 states objects (Euler characteristics of `M_{1,n}`, `M_{2,n}`, and of the local systems on `M_{1,1}`, `M₂`) that no roadmap on main or at an open head owns (searched by object: Serre characteristics, `e_c` of `M_{1,n}`, Eichler–Shimura with compact supports, local systems on `A₂`, Torelli). The only near hits are an Examples paragraph of ArithmeticLocallySymmetricSpaces (`Sym^k` cohomology of modular curves) and StableReductionPartII §6.3 (smooth full-level Torelli), neither of which states what §3.6 needs.
- Scope question for a human: §3.6 now owns, as an input, the Euler characteristics of `V_{a,b}`, `a + b ≤ 12`, on `A₂` (Petersen's Theorem 2.1, which rests on Harder's Eisenstein cohomology and the discrete spectrum of `PGSp₄`), and the genus-two compact-type Torelli isomorphism. §11.1 already used Petersen's theorem in all weights as a cited input; it is unchanged. A Siegel-threefold or automorphic roadmap would be the natural owner of the cohomology of local systems on `A₂`; none plans it, and SiegelModularForms excludes it explicitly.
- `264` and `836` were not recomputed (the genus-two assembly needs the `Sp₄` branching and the equivariant genus-one classes); they are CLP's values (clp lines 1049–1051, 1094–1095), consistent with the lower bounds `264` (§11.6) and `836 = 825 + 11` (§11.9) proved in this roadmap.
- New supplier edge: PELModuli §M5.2 (earlier in the merge order, line 116 against this roadmap's line 343).
- No section, layer or target id was renumbered or removed; §3.6 is new. Other roadmaps' citations of this one are unaffected (none exist).
- Sources: nothing fetched; every locator added is in a cached text (getzler-semiclassical, petersen-genus-two, petersen-abelian-surfaces, clp, bfp, keel). `needs-references.toml` was not written.
