# Review of AnalyticNumberTheoryPartI (pull request #3027 at 8d0b573)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 138 changed lines since `592bdb1`. The five new sections (1.4e, 1.6a, 1.7a, 1.7b, 2.42a) and the edited sentences of the overview, Layer 0, §0.18, the Layer 1 dependencies, scope and references were checked against every section they cite; the mathematics holds, every Check and route inequality was recomputed, and the Bombieri, Bennett–Siksek and Kedlaya locators are correct. The one finding (P2) is that §§1.7a and 1.7b name Lean signatures that this roadmap's `Suggested.lean` does not declare: the only declarations with those names are in a roadmap that consumes these sections. There are five small corrections (two in untouched text) and one format note, none blocking, and one licence question for the human reviewers.

## R01 (P2) — §§1.7a and 1.7b name Lean signatures that this roadmap's `Suggested.lean` does not declare

In this README, "The signature is `…`" marks a statement that `Suggested.lean` carries; §0.18's `character_psi_le` is an example (`Suggested.lean`, line 142). The new sections use the same phrase: "The signature is `deuring_heilbronn_repulsion`" (README line 1043) and "The signature is `exists_prime_modEq_le`" (line 1065). A reader looking for the formal form of Linnik's theorem finds nothing in this roadmap's file. `Suggested.lean` is unchanged from `main` and has no declaration with either name. The only ones are in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/Suggested.lean` (lines 95 and 135), and that roadmap consumes these sections: its README, lines 636–637, calls its own statements corollaries of §§1.7a and 1.7b.

Both theorems can be stated at the pins. The RieszSums declarations elaborate against the same Mathlib and Tau Ceti and say what §§1.7a–1.7b say. The only addition is `ρ ≠ 1`, which the totalized `DirichletCharacter.LFunction` needs at the pole of the principal character. The smallest repair would be to add the two theorems under Layer 1 of `Suggested.lean` with the README's hypotheses. If they are not meant to be Lean targets of this roadmap, the two sentences would instead describe the statements without a backticked name.

## C01 — §1.7a's *Needs:* line omits most of the inputs its route uses

The route of §1.7a rests on several inputs that its *Needs:* line (README line 1061) does not list:
- the second inequality of Bombieri's Théorème 14, which the text calls "a target here";
- Turán's power-sum lemma;
- the large sieve for characters (Bombieri §5, Théorème 11);
- a local zero count;
- the lower bound for `L(1,χ₁)`.

Bombieri states Turán's lemma without proof, as a special case of Turán's second main theorem, whose proof he describes as very involved (p. 42; `bombieri1987` lines 1268–1273). No roadmap this one may consume states it: in this repository it appears only as RieszSumsOverPrimesAndExceptionalZeros 1.7a (c), which consumes this section. By the README's own rule, a source's external proof input remains a target requiring proof, so the lemma and Théorème 14 are targets of §1.7a, but neither has a label of its own.

They could be set out as labelled sub-targets of §1.7a, as §§1.4a–1.4d are for §1.4, each with its locator. They and the remaining inputs would then go on the *Needs:* line: Théorème 11 (or §1.7's large-sieve input), Bombieri's local zero count (p. 42) and §0.12's bound for `L(1,χ)`. No result is blocked by the omission, since the last Check of §1.7a already derives the statement from §0.34.

## C02 — In §1.7b, "lie in the region" says the opposite of what the route uses

Line 1075 reads: "The zeros with `Re ρ≥1/2` other than `β₁` lie in the region of ZerosOfLFunctions 6.3–6.4". In ZerosOfLFunctions, "the region" is the zero-free region; there, 6.3 defines the exceptional zero as the real zero "lying in the region". So the sentence, read literally, puts every other zero inside the zero-free region. The route needs the bound `1−Re ρ≥c/ℒ` instead. "Satisfy the zero-free region of ZerosOfLFunctions 6.3–6.4" would say what is meant.

## C03 — Part of the pull request's description does not fit this roadmap's additions

The description says the added sections are "each a theorem published before 20 November 2026 and stated in the generality of its source". In this roadmap, §§1.4e, 1.7a and 1.7b leave out the effectivity that their sources prove:
- Bennett–Siksek, Theorem 5, gives `c` "absolute effective" (`bennettsiksek2020` lines 795–807);
- Bombieri's Théorème 13 gives an effectively computable exponent, and his Landau–Page lemma and Théorème 14 give effectively computable constants (pp. 39–40; `bombieri1987` lines 1176, 1196 and 1214).

Text that fits would add: "(in AnalyticNumberTheoryPartI §§1.4e, 1.7a and 1.7b without the effectivity of the constants, which the sources prove)".

## C04 — Untouched text: §§0.1, 0.17 and 0.18 claim effective constants from the same supplier that the new sections treat as giving none

§§1.4e and 1.7b drop effectivity because the zero-free region of ZerosOfLFunctions 6.3–6.4 has a constant that "is existential" (lines 943 and 1067); §1.7a drops it as well (line 1047). The last Check of §1.4e adds that §0.18's effectivity "needs an effective constant in the region of ZerosOfLFunctions 6.3–6.4". That supplier does state its zero-free-region constants existentially (ZerosOfLFunctions README, "Not owned here").

Yet the untouched text claims effectivity from that same supplier in three places:
- §0.18 (line 471) claims effective constants on a route through that region;
- §0.1 fixes an "effective" `c_star≤c₁/3`, with `c₁` the supplier's constant (line 77);
- §0.17 claims an effective `c_star` (line 457).

The README now applies two standards to one input, and nothing says where §0.18's effective region constant comes from. A separate change to §0.1's supplier comparison would name that source. §§1.4e, 1.7a and 1.7b could then state the effectivity their sources prove.

## C05 — Untouched text: §2.3a writes the algebraic character with the opposite sign of the norm power

The bullet on algebraic characters in §2.3a (line 1351) writes `χ₀=χ₀,u|·|^σ` and calls `σ` LFunctions Layer 6's ideal-side shift. With `|·|` the idele norm, as in the twist rule of the bullet just above it (`Λ_H(ω|·|^u,s)=A^(−u/2)Λ_H(ω,s+u)`), this gives the completion `Λ_H(χ₀,u,s+σ)`. That contradicts the same bullet's `Λ_H(χ₀,u,s+t−σ)`.

LFunctions' convention table settles the sign: `idealShift` is the negative of the idelic shift, and `‖·‖^(−m)` has ideal values `N𝔞^m`. The new §2.42a uses the right sign: its Check derives `ζ(s−m)` for `N^m`. But it sends readers to "σ as in §2.3a". The fix is to write `|·|^(−σ)`, or to say that the norm there is the ideal norm.

## N01 — Untouched text: §§0.6 and 0.18 cite Iwaniec–Kowalski by name only

§0.6 (line 150) and §0.18 (line 481) cite "Iwaniec–Kowalski Theorem 5.26" and "Theorem 5.27" by name, while the change adds the book to the references as [117]. Citing [117] at both places would let a reader find the reference entry.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | §1.4e estimate | `χ₋₃`, `χ₋₄`, `X=10⁶` | `ψ(10⁶,χ₋₃)=715.0`, `ψ(10⁶,χ₋₄)=−835.8` against `X=10⁶`; no window zero, so error size only | consistent |
| A′ | §1.4e dyadic bookkeeping | `X=1000.7, 12345, 99999.99, 2²⁰+½`; odd `k<200` | `⌊⌊X/2^j⌋/2⌋=⌊X/2^(j+1)⌋` in all; integers of `(⌊k/2⌋,k]` and `(k/2,k]` agree; `2/(1−2^(−1/2))=6.83≤8` | holds |
| A″ | §1.4e height `T` | `log X=3.9, 4, 10` | `e^(√log X)≤X^(1/2)`: false, true, true; needs `log X≥4`, inside "X sufficiently large" | holds |
| B | §1.4e last Check against §0.18 | `c≤c_LS` | term `≤2X e^(−c_LS log X/log N)` is at most `1.38` times the error (`2/1.456`, §0.18) | holds |
| C | §1.6a conjugation | quartic `χ` mod 5, `s=0.3+2i, 0.7+5i, −0.4+i` | `L(s̄,χ⁻¹)=1.4108181060−0.7393693591i=conj L(s,χ)`; equal at all three points | holds |
| D | §1.6a reflection; its Check 1 | same `χ`, `s=0.3+2i, 0.2+7i` | `‖Λ(1−s,χ)‖=0.7297918497=‖Λ(s,χ⁻¹)‖` but `‖Λ(s,χ)‖=1.1142145049`; `0.0672879592` on both sides at `0.2+7i` | holds |
| E | §1.6a Checks 2–3 | principal mod 2; even `χ₅` | `1−2^(−2πi/log 2)=6·10⁻¹⁶i`; `L(0,χ₅)=5·10⁻¹³`, `−(1/5)Σaχ(a)=0` | holds |
| F | §1.6a half-plane form, both directions | `0<Re ρ<1/2` | `ρ↦1−ρ̄` gives real part in `(1/2,1)`; deleted factors have `‖χ(p)p^(−s)‖=p^(−Re s)<1` on `Re s>0` | holds |
| G | §1.7a from Théorème 14 | `C=2`, `c₃=8`, `(1−β₁)ℒ=10⁻⁶` | `(1/c₃)log(1/(C·10⁻⁶))=1.640≥c log(c/10⁻⁶)=1.467` with `c=min(1/c₃,1/C)` | holds |
| H | §1.7a Check 1 | `c=0.1`, `q=3, 10³` | `ℒ=3.8796`: bound `9.70·10⁻¹¹`; `c log(c/(δℒ))=1.939793=ℒ/2`; exponent of `q` is `−1/(2c)=−5` | holds |
| I | §1.7a Check 2 | `c=0.1`, `c_R=0.05` | at `(1−β₁)ℒ=0.0607`, `c log(c/u)=0.0500=c_R` | holds |
| J | §1.7a Check 3 | `c_LS=0.01`, `q=10⁶`, `1−β₁=c_LS/log q`, `ℒ=log 2q` | right side `−3.37·10⁻⁵<0` | holds |
| K | §0.17 as used by §§1.7a–1.7b | `N₁,N₂≤Z`; `log(N₁N₂)≤2 log q` | `3c_star/log(N₁N₂)≥3c_star/(2 log Z)≥c₀/log Z` iff `c₀≤3c_star/2` | holds |
| L | §1.7b and its Check 1 | `3≤q≤300`, every unit `a` | largest `log p/log q=1.829` at `(q,a,p)=(5,4,19)`; least `p≡−1` is `≥q−1` for every `q` | holds |
| M | §1.7b main-term inequality | `β₁∈(1/2,1)`, `log x∈[8,1000]`; `log x=1` | least margin `+0.00125` at `(0.99975, 8)`; at `log x=1`, `β₁=0.99`: `−5·10⁻⁵<0.0025` | holds at `x=q^A`, `A` large |
| N | §1.7b Check 2 | `σ=0.05,…,0.95` | `L(σ,χ₋₃)∈[0.349,0.593]>0`; `ζ(σ)∈[−19.4,−0.549]<0` | holds |
| O | §1.7b window and gap | `q=3`; §0.12 at `ε=1/4` | `1−(log 3/2)/log 3=0.5`; `‖d‖≤q` gives `1−β₁≥c q^(−3/4)` | holds |
| P | §2.42a Check 2 and the sign of `σ` | `N²` over `ℚ`, `s=5` | `Σn^(2−5)=1.2020569032=ζ(3)`; ideal-side shift `m` in LFunctions' table; zeros on `Re s=σ+1/2` | holds; §2.3a has the opposite sign (C05) |
| Q | §2.42a deleted factors, Check 1 | `χ=χ_u N^σ`; modulus `(4)∞` over `ℚ` | `‖χ(𝔭)N𝔭^(−s)‖=N𝔭^(σ−Re s)=1` iff `Re s=σ`; `(1−2^(−s))ζ` vanishes on `Re s=0` | holds |
| R | R01: signatures of §§1.7a–1.7b | both `Suggested.lean` files | 0 such declarations in this roadmap; RieszSums lines 95 and 135, elaborating with only `sorry` warnings | R01 |

- Previous review: no open findings to re-check. Record at the merge base: 4 layers, none removed or retitled; 0 headings removed, 5 added; no item removed; `Suggested.lean` byte-identical to `main`.
- Gate at this head: every check 0 except files changed outside the folder (111, all in this pull request's own folders). Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` exits 0 with 62 warnings, every one `declaration uses 'sorry'`. The file is unchanged and has no new declarations, so the one-tactic probe and the `#check @name` binder pass were not re-run.
- 12 source locators checked against the text: Bombieri pp. 31 (Théorème 11), 39 (Landau–Page lemma, Théorème 13), 40 (Théorème 14 and the Selberg remark), 41 (Théorème 16), 42 (Turán, local zero count), 41–54 (proof, Lemme C ends p. 54), 77 (Théorème 20); Bennett–Siksek Theorem 5, (26); Kedlaya §10.3 p. 60, Conjecture 10.4 and Remark 10.5 p. 61.
- 8 library declarations opened at the Mathlib pin: `DirichletContinuation.lean:149, 266, 291`; `Gamma/Deligne.lean:69` (`Complex.Gammaℝ_ne_zero_of_re_pos`); `Orthogonality.lean:82`; `Chebyshev.lean:442, 485`; `Nonvanishing.lean:404`.
- Cross-roadmap citations resolved: ZerosOfLFunctions 6.3, 6.4, Layer 2 and 8.2–8.8 at this head; LFunctions Layers 5, 6 and 7 and Completed GlobalNumberFields Layer 9 on `main`. Citations of the new sections resolve from RieszSums (lines 249, 403, 636), RiemannHypothesisStatementsAndConsequences (766, 916), ThetaChainsOnDefiniteUnitaryGroups (1300) and FrobeniusRestrictedRieszSums (987).
- Seeded sample: §1.7, an input of §§1.7a–1.7b, was checked for its Bombieri half (Théorème 20, p. 77, and Selberg's bound quoted on p. 40); its Jutila half could not be read. §0.2 (an input of §1.7b, untouched) and the other 13 targets lie outside the change and its dependents and were not re-reviewed.

Overlap check: read ZerosOfLFunctions, RieszSumsOverPrimesAndExceptionalZeros, SieveMethodsAndPrimePatterns, ExplicitNumberFields, LFunctions, ClassicalArithmeticCompletion, ArtinRepresentations (#1711 head), ExplicitZetaBounds and ExplicitPrimeCounting. The conductor-uniform character PNT with the exceptional term is owned here (§1.4e): ZerosOfLFunctions 8.6 states it for fixed `χ` only, and RieszSums 1.4g cites §1.4e. Deuring–Heilbronn and Linnik are owned here (§§1.7a–1.7b): RieszSums 1.7b restates them as corollaries citing these sections, ExplicitZetaBounds 8.4 is an explicit variant, and SieveMethods §2.9's "Linnik" is the least-nonresidue theorem. ClassicalArithmeticCompletion §5.0 has the class-group case of §2.42a's inverse clause. A search of all open heads found no other owner; the heads of LiCoefficientsArithmeticFormula, LFunctions (#2626), ClassicalArithmeticCompletion (#2772) and ZerosOfLFunctions (#3012) were read only through the overlap tool.

Source independence: changed passages only; 9 passages compared with 3 sources (`bombieri1987`, `bennettsiksek2020` arXiv v1, `kedlayaant`); nothing is shared beyond formulas the mathematics forces. Among the literature locators of the changed passages, Bombieri [99] has the largest share, 6 of 22. Contents were not compared, since no layer is added, removed or reordered.

Research link: §§1.7a–1.7b are the Deuring–Heilbronn repulsion and Linnik's least-prime theorem (Linnik 1944; Knapowski 1962; Gallagher 1970; Bombieri, Astérisque 18, §6). §1.4e is the conductor-uniform character PNT (Iwaniec–Kowalski, Theorem 5.27, as used by Bennett–Siksek 2020). The central theorem is the uniform exclusion of Landau–Siegel zeros ([109], 2026). Based on the README and `bombieri1987`.

## Not verifiable

- Iwaniec–Kowalski [117], Theorem 5.27 and Chapters 5 and 18: no legal open copy.
- Linnik [118], I (2) p. 139, and II, §3 p. 348 and the Theorem p. 347: the sources service found no legal copy.
- Knapowski [119], Theorem II, pp. 168–169: no legal copy found.
- Gallagher [120], (26)–(27), pp. 336–337: the publisher copy is paywalled (uncertified).
- Bach [121], §3 p. 360, and Belabas–Diaz y Diaz–Friedman [122], §2 pp. 1187–1188: the publisher's host is outside the sources service's licence classes.
- Davenport [112] (functional equation, primitive characters): no legal open copy.
- Jutila [R97], the half of §1.7 in the seeded sample: the journal's host is outside the service's licence classes.
- Bennett–Siksek, printed p. 374: only arXiv v1 was read, where Theorem 5, (26) is on p. 17; theorem and equation numbers agree.
- Bombieri's Théorème 13: the OCR renders its heading as "15"; it was identified by its place between Théorème 12 (§5) and Théorème 14.

Automatic checks set aside as false positives: the check for files changed outside the roadmap folder, run by hand at this head, lists 111 files, all in roadmap folders that this pull request adds or revises.

## Source issues

- none

## For the human reviewers

- Licence: the sources service has no licence class for the publisher pages of Math. Comp. (Bach 1990; Belabas–Diaz y Diaz–Friedman 2008, both cited by §2.42a) or of Math. Scand. (Jutila 1977, cited by §1.7). Whether these pages are open archives is for you to settle.
