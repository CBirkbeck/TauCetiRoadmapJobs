# Review of AnalyticNumberTheoryPartI (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 178 changed lines since `aecb53a`. The five new sections (1.4e, 1.6a, 1.7a with its sub-targets (i) and (ii), 1.7b, 2.42a), the two new Lean statements and the edited sentences of the overview, Layer 0, §0.18, the Layer 1 dependencies, the scope and the references were checked against the sections, suppliers, library declarations and sources they cite, and every Check and route inequality was recomputed; the mathematics holds and there is no finding. The folder is unchanged since the previous review, so its four remarks stand: there are four small corrections (two of them in untouched text) and one format note, none blocking. One correction is new: the description's merge-order block gives no order against the other open pull request that edits this README. One licence question is left for the human reviewers.

## C01 — §1.7a(ii)'s *Needs:* line calls Bombieri's Théorème 11 "the large-sieve input of §1.7", which it is not

An implementer who builds the large sieve that §1.7 needs will not have the inequality that §1.7a(ii) uses. The end of the *Needs:* line of §1.7a(ii) (README line 1065) reads "the large sieve inequality for characters ([99][R99], §5, Théorème 11), the large-sieve input of §1.7". Théorème 11 (p. 31; `bombieri1987` lines 952–957) weights each modulus by `log(Q/q)` and assumes `a_n=0` whenever `n` has a prime factor `≤Q`. The Montgomery half of §1.7's route, Théorème 20, is proved from Théorème 10, the unweighted hybrid inequality (p. 82; line 2825), and §1.7's own *Needs:* line asks only for a "native large-sieve inequality for Dirichlet polynomials". The proof of Théorème 14 is where Théorème 11 enters (p. 50; line 1580).

The line would be right as: "the large sieve inequality for characters with the weights `log(Q/q)`, for coefficients supported on integers with no prime factor `≤Q` ([99][R99], §5, Théorème 11, p. 31)", without the clause about §1.7. By the README's rule that a source's external input stays a target, it is then a target of §1.7a(ii).

## C02 — The description's merge-order block states no order against the other open pull request that edits this README

Pull request #3036 ("cite the sections a need uses, not whole layers") rewrites *Needs:* lines throughout this README and adds new ones; one of them is inserted directly after §1.4d's paragraph, exactly where this pull request inserts §1.4e, so the two heads conflict in this file. The `merge-order` block of the description lists nine shared folders and says "No open pull request must merge before this one", but it names neither `AnalyticNumberTheoryPartI` nor #3036.

The two do not change the same targets differently: #3036 edits only *Needs:* lines of sections this pull request leaves alone. A line in the block would settle it, for example "`AnalyticNumberTheoryPartI`: **this pull request**. Also changed by #3036: whichever merges second is rebased onto the first", with #3036, if it is second, also giving the *Needs:* lines of §§1.4e, 1.6a, 1.7a, 1.7b and 2.42a its citation style (they cite "LFunctions Layers 5, 6 and 7" and "GlobalNumberFields 9" as whole layers).

## C03 — Untouched text: §§0.1, 0.17 and 0.18 claim effective constants from the zero-free region that §§1.4e, 1.7a and 1.7b treat as existential

Carried from the previous review and unchanged. §§1.4e and 1.7b drop effectivity because the region of ZerosOfLFunctions 6.3–6.4 has a constant that "is existential" (README lines 943 and 1071), and the last Check of §1.4e says that §0.18's effectivity "is not given by this route". Yet §0.1 (lines 58 and 77), §0.17 (line 457, "There is an effective absolute `c_star>0`") and §0.18 (line 471) claim effective constants on routes through that same region. A separate change would either name the source of an effective region constant in §0.1's supplier comparison, or drop "effective" in those three places.

## C04 — Untouched text: §2.3a writes the algebraic character with the opposite sign of the norm power

Carried from the previous review and unchanged. The last-but-two bullet of §2.3a (line 1355) writes `χ₀=χ₀,u|·|^σ` with `σ` "LFunctions Layer 6's ideal-side shift". With `|·|` the idele norm, as in the twist rule of the bullet before it (`Λ_H(ω|·|^u,s)=A^(−u/2)Λ_H(ω,s+u)`), this gives the completion at `s+σ`, against the same bullet's `Λ_H(χ₀,u,s+t−σ)`. LFunctions' convention table makes the ideal-side shift the negative of the idelic one (`N^m` is `‖·‖^(−m)`). Writing `|·|^(−σ)`, or saying that the norm there is the ideal norm, fixes it. The new §2.42a has the right sign (its Check gives `ζ(s−m)` for `N^m`) and refers the reader to this bullet.

## N01 — Untouched text: §§0.6 and 0.18 cite Iwaniec–Kowalski by name instead of as [117]

Lines 150 and 481 cite "Iwaniec–Kowalski Theorem 5.26" and "Theorem 5.27"; the change adds the book to the references as [117], and the new sections cite it by that number.

## Previous findings

- No finding (R) was open. C01 of the previous review — not repaired: "the large sieve inequality for characters ([99][R99], §5, Théorème 11), the large-sieve input of §1.7" (line 1065); C01 above.
- C02 — not repaired, untouched text: "There is an effective absolute `c_star>0`" (line 457) against "whose constant is existential" (line 1071); C03 above.
- C03 — not repaired, untouched text: "written `χ₀=χ₀,u|·|^σ` with `χ₀,u` unitary and `σ` LFunctions Layer 6's ideal-side shift" (line 1355); C04 above.
- N01 — not repaired, untouched text: "Iwaniec–Kowalski Theorem 5.27" (line 481); N01 above.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | §1.4e statement and window | `N=3`; `N=2` (excluded) | `log(4N)=2.485≤3 log N=3.296` at `N=3`; window `β₁>1−(log 3/2)/log 3=1/2`; sign `−X^β₁/β₁≈−X` | holds |
| B | §1.4e dyadic blocks | `X=1000.7, 12345, 99999.99, 2²⁰+½`, 14 halvings | `⌊k_j/2⌋=⌊X/2^(j+1)⌋` in all 56 cases; geometric constant `2/(1−2^(−1/2))=6.83≤8` | holds |
| C | §1.4e choice of `T` | `N>X^(1/2)`; `N≤X^(1/2)` | `log X/(√log X+log N)<2`, so factor `≥e^(−2c)`; `e^(√log X)≤X^(1/2)` iff `log X≥4`; for `log N>√log X`, `log²(NX)≤4 log⁴N` | holds for large `X` |
| D | §1.6a conjugation | quartic `χ` mod 5, `s=0.3+2i, 0.7+5i, −0.4+i` | `L(s̄,χ⁻¹)=1.4108181060−0.7393693591i=conj L(s,χ)`; equal to 16 digits at all three | holds |
| E | §1.6a reflection and Check 1 | same `χ`, `s=0.3+2i, 0.2+7i` | `‖Λ(1−s,χ)‖=0.3263728371=‖Λ(s,χ⁻¹)‖`, but `‖Λ(s,χ)‖=0.4982918749`; `0.0300920902` both sides at `0.2+7i` | holds; inverse is needed |
| F | §1.6a half-plane form, Checks 2–3 | `0<Re ρ<1/2`; principal mod 2; even `χ₅` | `Re(1−ρ̄)=1−Re ρ>1/2`; `‖1−2^(−2πi/log 2)‖=6·10⁻¹⁶`; `L(0,χ₅)=0`, `L(1/2,χ₅)=0.2318` | both directions hold |
| G | §1.7a statement, "every `ℒ`" | `c=0.1`, `1−β₁=10⁻⁶`, `ℒ=3.880, 5, 10, 20` | right side `0.2618, 0.1981, 0.0921, 0.0426`: decreasing, so larger `ℒ` is weaker; `≤0` once `(1−β₁)ℒ≥c` | holds |
| H | §1.7a Checks 1–3 | `q=3`, `γ₁=14.1347`; `c_R=0.05`; `q=10⁶`, `c_LS=0.01` | `ℒ=3.8796`, bound `9.70·10⁻¹¹`, `c log(c/(δℒ))=1.93979=ℒ/2`; threshold `0.0607`; right side `−3.37·10⁻⁵<0` | hold |
| I | §1.7a from Théorème 14 and §0.17 | `N₁,N₂≤Z`; `Q=T` in §1.7 | `3c_star/log(N₁N₂)≥c₀/log Z` iff `c₀≤3c_star/2`; §1.7 gives `T^((8+2ε)(1−α))`; `1≤C(1−β₁)log T·T^(c₃(1−β))` | repulsion follows |
| J | §1.7a(i) Turán | second main theorem, `M=K−1`, all `1≤N≤K≤400` | `log[2(N/(8e(K+N−1)))^N]+K log 50≥1.5257`; any labelling since `‖z₁‖≤max‖z_j‖` | holds |
| K | §1.7a(ii) local zero count | 2·10⁵ random zeros in the disc, `Re ρ≤1`, `r∈(0,1]` | `min r·Re 1/(1+r+iv−ρ)=0.50000≥1/4` (exactly `1/(2r)` on the boundary); pole term `≤1/r` | `C(r log T+1)` holds |
| L | §1.7a(ii) inputs | Bombieri pp. 31, 50, 53, 82 | Théorème 11 has weights and a sieved support; Théorème 14's proof uses it; Théorème 20's uses Théorème 10 | C01 |
| M | §1.7b statement and Check 1 | all `3≤q≤300`, every unit `a`; `q=3,a=1` | largest `log p/log q=1.8295` at `(q,a,p)=(5,4,19)`; least `p≡1 (3)` is 7, `A≥1.771` | holds, `A>1` |
| N | §1.7b route inequalities | `β₁∈(1/2,1)`, `log x∈{8,20,100,1000}`; `3≤q<50`, five `T` | least margin of `1−x^(β₁−1)/β₁−min(1,(1−β₁)log x)/4` is `+0.00062`; `(q(T+2))²−q(T+4)≥24` | hold for `x=q^A`, `A` large |
| O | `deuring_heilbronn_repulsion` against §1.7a | elaborated type; `ρ=1`; `Re ρ≥1` | `IsQuadratic ∧ χ₁≠1` = real nonprincipal; `2≤analyticOrderAt` = multiple; `ρ≠1` removes only the pole's junk value; no zero on `Re≥1` | agree |
| P | `exists_prime_modEq_le` against §1.7b | `q=1,2`; one-tactic probe | `3≤q` excludes both; `simp`, `rfl`, `infer_instance`, `exact Nat.forall_exists_prime_gt_and_modEq` all fail | agrees; not padding |
| Q | §2.42a every modulus, Check 1 | modulus `(4)∞` over `ℚ` | `(1−2^(−s))ζ(s)`: extra zeros on `Re s=0` only, `‖χ₀(𝔭)N𝔭^(−s)‖=N𝔭^(−Re s)<1` on `Re s>0` | holds |
| R | §2.42a algebraic characters, Check 2 | `N²` over `ℚ`, `s=5` | `Σn^(2−5)=1.2020569031=ζ(3)`; zeros in `(m,m+1)` on `Re s=σ+1/2`; LFunctions recenters at `s−idealShift` | holds; §2.3a sign is C04 |
| S | §2.42a rationals and inverse | `χ` mod `q`, `χ_ℚ` | series agree term by term on `Re s>1`; strip form and `Re s>0` form agree since no zero on `Re s≥1` | holds |
| T | C03: §§0.1, 0.17, 0.18 against §§1.4e, 1.7b | effectivity of the region constant | lines 58, 77, 457, 471 say effective; lines 943, 1071 say existential | unchanged |

- Source locators checked against the text: 11 (Bombieri Théorème 11 p. 31; Landau–Page and Théorème 13 p. 39; Théorème 14 and Selberg's remark p. 40; Théorème 16 p. 41; Turán and the local zero count p. 42; pp. 50, 53, 82; Bennett–Siksek Theorem 5, (26); Kedlaya Conjectures 7.8 and 10.4, Remark 10.5, pp. 45, 60–61).
- Library declarations opened at the Mathlib pin: 9 (`NumberTheory/LSeries/DirichletContinuation.lean:149, 266, 291`; `NumberTheory/MulChar/Basic.lean:443`; `NumberTheory/LSeries/Nonvanishing.lean:404`; `NumberTheory/DirichletCharacter/Orthogonality.lean:82`; `NumberTheory/Chebyshev.lean:442, 485`; `NumberTheory/LSeries/PrimesInAP.lean:463`); `Complex.Gammaℝ_ne_zero_of_re_pos` found in use at `NumberTheory/LSeries/ZMod.lean:422`.
- Cross-roadmap citations resolved: ZerosOfLFunctions 6.3, 6.4 with (4d), Layer 2 and 8.2–8.8, on `main` and at this head; LFunctions Layers 5, 6 and 7 and its shift convention on `main`; Completed/GlobalNumberFields Layer 9. RieszSumsOverPrimesAndExceptionalZeros cites §§1.4e, 1.7a and 1.7b back as corollaries (its README lines 636–637, 1160).
- Record against the merge base: 4 layers, none removed or retitled; 0 headings removed, 5 added; 0 Lean declarations removed, 2 added.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Nothing is changed outside roadmap folders.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 64 warnings, all `declaration uses 'sorry'`. The elaborated types of the two new theorems were compared with §§1.7a–1.7b: every binder is in their own signatures, none is lost, nothing changed.
- Seeded sample: none of the 15 targets lies in a changed passage. Of those the change cites, §1.6 was checked against Kedlaya (Conjecture 7.8 p. 45, Conjecture 10.4 and Remark 10.5 pp. 60–61) and §0.2 against its use in §1.7b; the other 13 are outside the change and its dependents.
- Folder unchanged since the head the previous review read (empty diff from `71bbefa`).

Overlap check: read RieszSumsOverPrimesAndExceptionalZeros (scope and its 1.7b), ZerosOfLFunctions (6.3–6.4, Layer 2), SieveMethodsAndPrimePatterns (§2.9), ExplicitNumberFields, AnalyticNumberTheoryPartII and ExplicitZetaBounds. The repulsion and Linnik's theorem are owned here (§§1.7a–1.7b): RieszSums restates them as corollaries citing these sections, in its own namespace, so no fully qualified name clashes; SieveMethods §2.9's "Linnik" is the theorem on least quadratic non-residues; ExplicitZetaBounds names an explicit variant. The character prime-number estimate with the exceptional term is owned here (§1.4e); ZerosOfLFunctions keeps the region. Nothing else is shared. The other open head that edits this README was read for its changes to this file only (C02).

Source independence: changed passages only; 9 passages compared with 3 sources (`bombieri1987`: the statements of §§1.7a, 1.7a(i), 1.7a(ii) and 1.7b, the Landau–Page reading, the local zero count and the docstring of `deuring_heilbronn_repulsion`; `bennettsiksek2020`: §1.4e; `kedlayaant`: §1.6a), none shared beyond formulas the mathematics forces; largest share `bombieri1987`, 7 of 23 literature locators of the changed passages; contents not compared, since no layer is added, removed or reordered.

Research link: §§1.7a–1.7b are the Deuring–Heilbronn repulsion and Linnik's least-prime theorem (Linnik 1944; Knapowski 1962; Gallagher 1970; Bombieri, Astérisque 18, §6); §1.4e is the conductor-uniform character prime-number estimate (Iwaniec–Kowalski 2004, Theorem 5.27, as used by Bennett–Siksek 2020). Rests on the README and on `bombieri1987` and `bennettsiksek2020`.

## Not verifiable

- Bombieri, p. 42 (the right side of Turán's lemma) and p. 41 (the exact region of Théorème 16): the recognised text is illegible there (`bombieri1987` lines 1270–1271 and 1252–1253). The hypotheses were read; the bounds were checked mathematically (rows I and J).
- Iwaniec–Kowalski [117] (Theorem 5.27, Chapters 5 and 18), Davenport [112], Linnik [118], Knapowski [119], Gallagher [120], Bach [121] and Belabas–Diaz y Diaz–Friedman [122]: no text of any of them is among the texts held for this roadmap, so their locators were not read.
- Bennett–Siksek, printed p. 374: the text read is the preprint, where Theorem 5 and (26) carry the same numbers (`bennettsiksek2020` lines 795–807); the printed page was not seen.
- Bombieri's Théorème 13: the recognised text prints its number as "15" (line 1176); it was identified by its place at the head of §6, before the Landau–Page lemma and Théorème 14.

## Source issues

- none

## For the human reviewers

- Licence: Bach [121] and Belabas–Diaz y Diaz–Friedman [122] (Math. Comp., cited by §2.42a) and Jutila [R97] (Math. Scand., cited by §1.7) are cited by publisher locator with no text held; whether the publishers' pages are open archives is yours to settle.
