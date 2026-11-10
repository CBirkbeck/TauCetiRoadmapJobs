# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 7ee3f01)

**Verdict:** needs changes

Incremental re-review of the 86 lines changed since `8269baf` in `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md` and `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/Suggested.lean`. Source ids: `Getzler93` is Getzler's Cartan homotopy paper, the text on the author's Northwestern page (12 pages, fetched this round); `Cor06` is arXiv:math/0111096v5; `Zbl <number>` is a zbMATH Open review. Two findings, both P3: one carried, one in a changed passage.

## R01 (P3) — 5.4 and 5.5 still cite a work without a theorem, section or page

**Location.** `README.md` 5.4, lines 899, 906, 909, 918: "(Quillen's notions; Marín 1998)", "(González-Férez–Marín 2007)" three times. 5.5, line 934: "(Marín 1998.)" for three theorems.

**Claim.** This is the remainder of the previous R02. The head repairs it for 3.1 (Getzler 1993, Theorem 2.4 (2)) and for 5.1's definition (Wodzicki 1989, (2), p. 592); the five citations of 5.4 and 5.5 are unchanged, and the pull request's description says so ("cited by work only"). Each proved claim needs its numbered result or page in the cited paper.

**Witness.** 5.1 at this head shows the form: "Wodzicki 1989, Corollary 4.5, p. 609". `Zbl 1137.16010` and `Zbl 0928.16007` confirm the statements, not their numbers.

**Repair.** Give, from the two papers (both are older than four years in Elsevier journals, *J. Algebra* and *J. Pure Appl. Algebra*; the sources service of this review does not read that host, so I could not supply them): in 5.4 the number of the xst criterion, of the monomial example and of its right-handed counterpart in González-Férez–Marín 2007, and the section of Marín 1998 that defines firm and unitary modules; in 5.5 one locator for each of the three bullets (surjective contexts on firm modules, on closed modules, the acceptable-context criterion), in place of the single trailing "(Marín 1998.)".

## R02 (P3) — 3.1 writes cyclic chains as `C(A) ⊗_(k[u]) …`, a tensor product over a ring that does not act on `C(A)`

**Location.** `README.md` 3.1, lines 546–547: "on `HC_*(A)`, the homology of `C(A) ⊗_(k[u]) k[u, u⁻¹]/uk[u]` (Getzler's §2), where `u` acts as `S`".

**Claim.** `C(A)` is a `k`-module with no action of `u`; the tensor product over `k[u]` is not defined. The source's complex is the tensor product over `k` with a graded `k[u]`-module of coefficients, with differential `b − uB`.

**Witness.** `Getzler93` lines 439–445: for a graded `k[u]`-module `W`, the complex is `(C(A) ⊗ W, b − uB)`, tensor over the ground field of line 30; `W = k[u, u⁻¹]/uk[u]` gives `HC`.

**Repair.** Write "the homology of `(C(A) ⊗_k W, b − uB)` for `W = k[u, u⁻¹]/uk[u]` (Getzler 1993, §2, the list before Theorem 2.4), on which `u` acts as `S`". Tested on the statement: `ι_D = b{D} − u B{D}` is polynomial in `u`, so it acts on `C(A) ⊗_k W` for every `k[u]`-module `W`, and `[b − uB, ι_D] = u L_D` there gives `S ∘ L_D = 0` on homology for this `W` and `L_D = 0` for `W` on which `u` is invertible.

## Previous findings

- R01 — repaired: "For a derivation `D` of a unital algebra `A` over a field `k` of any characteristic"; Convention 1: "3.1 and everything else in 4.1–4.2 take `k` a field … which is what 1.4, 3.1 and 5.2 use"; the Summary says "over every field"; the `𝔽₂[x]` over `ℤ` witness is the first Check.
- R02 — partly repaired: 3.1 cites "Getzler 1993, Theorem 2.4 (2), p. 8 of the author's text" and "(2.1) and Definition 2.1"; 5.1 "Wodzicki 1989, (2) and the definition after it, p. 592"; 5.4 and 5.5 are unchanged (R01 above).
- R03 — repaired: `Suggested.lean` lines 30–36 list "3.1–3.2 (Goodwillie's theorems), 4.4 and 4.6" under cyclic homology and add "4.3 and 4.5 …: the differential graded algebra `ΩA = ⊕ A ⊗ Ā^⊗n` of normalised forms of a unital algebra".

## Verified sound

**Gate and build.** My run of the gate at this head with the candidate merge order prints `OK` with every counter 0 (without the order file it reports only `NOT IN ORDER`, which is not a defect for a roadmap the order does not list yet). The dependency check prints `depcheck: 236 roadmaps, 2272 edges, 0 problem(s)`: no UPWARD or CYCLE line. `lake env lean` on `Suggested.lean` gives five warnings, `declaration uses 'sorry'`, at lines 80, 106, 119, 130, 135, and nothing else. No file outside the folder changes; `overlaps.md` lists no open pull request that changes this roadmap or drops an id it cites.

**Lean.** The diff touches only the module docstring (lines 27–36). The seven declarations and their elaborated types are those of the previous review (compared again with `signatures.md`: `glAction` over `CommRing k`; 2.2 with `[Field K] [CharZero K]`; `IsQuasiFree`; the nilpotent lift; the dimension form over `[Field K]`; `isQuasiFree_freeAlgebra` over `CommRing k`; the non-example over `[Field K]`); the padding probe of the previous review (20 attempts, none closes) stands, the statements being unchanged. The one name `roadmaps resolve` lists, `IsQuasiFree.exists_lift_of_nilpotent`, is declared at `Suggested.lean` line 106.

**Changed locators verified against the text (3.1).**

- `Getzler93` line 30: all vector spaces over a field `k` (so the README's "field of any characteristic" is the source's generality); lines 323–333 (page 6): Definition 2.1 (1), `ι = b − uB` as cochains, so `ι{D} = b{D} − u B{D}`, and (2.1), `[b − uB, ι{D}] = u L{D} − ι{δD}`, which for a cocycle `D` is the README's formula; lines 227 and 321–322: `b{D}` and `B{D}` for a 1-cochain are Rinehart's two operators; lines 439–452 (page 8): the coefficient complexes and Theorem 2.4 (2), `u L(D)` null-homotopic on `C(A)[[u]]` for a cocycle `D`, hence `L(D) = 0` on `HP`. The page "p. 8 of the author's text" is right for this file.
- `Zbl 0844.18007`: the bibliographic entry (Isr. Math. Conf. Proc. 7, 65–78, 1993) and the statement about derivations.

**Changed locators cross-checked without the text (Convention 7, 5.1–5.3).** `Zbl 0689.16013` confirms: excision in Wodzicki 1989 is for extensions pure over `k`; the bar complex with the README's `b′`; H-unitality as acyclicity of `B_*(A) ⊗ V` for every `k`-module `V`; its equivalence with excision in Hochschild and in cyclic homology; rational K-excision implies cyclic excision for `A ⊗ ℚ`; Banach algebras with bounded approximate units (so C*-algebras) among the H-unital examples. `Cor06` lines 116–123 give the numbers (3) and (4) and Suslin–Wodzicki's Theorem A. The page numbers 591, 592, 593, 609 are under Not verifiable.

**Cross-roadmap citations in the changed passages (4, resolved in the previous review, unchanged at their heads' ids per `overlaps.md` and `citations.md`).** RefinedTraceMethods §1.2, §1.4; KTheoryFiniteLocalFields §4.0; GeneralAlgebraicKTheory §8.10. "Cross-roadmap citations found nowhere: None."

**The pull request's description** agrees with the head on the changed points: 3.1 over a field by Getzler's Theorem 2.4 (2); Wodzicki's (2)–(4) and Corollary 4.5 cited in 5.1–5.3; Marín's papers cited by work only.

**Adversarial table.** Rows for the changed statements, with computed values; the remaining rows are those of the previous review (at `8269baf`), whose statements the diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 (changed: over a field; Getzler's homotopy) | `D = [x, −]` on `HH₀`; `ℚ[x]`, `x d/dx`; `𝔽_p[x]`, weight `m`; `𝔽₂[x]` over ℤ; `W = k[u, u⁻¹]/uk[u]`, class `u⁻ʲ c` | `[x, a] = 0` in `A/[A, A]`; `L_D xᵐ = m xᵐ ≠ 0` on `HC₀`, `S = 0` there, `HP₀ = k` with `L_D = 0`; homology in degree `≥ 1` only for `p ∣ m`, where `m = 0`; chains have `H₂ = 0` against derived `HH₂ ⊇ 𝔽₂[x] ≠ 0`, now excluded (ℤ is not a field); `u · u⁻ʲ c = u⁻ʲ⁺¹ c`, degree lowered by 2, `u · c = 0`: `u` is `S` | holds over a field | R02 (notation of the complex) |
| Convention 1 (changed) | 3.1 over ℤ; 4.2 separable over ℤ | `𝔽₂[x]/ℤ` excluded as above; `ℤ/2` over ℤ excluded as in the previous R02 | consistent with 3.1, 4.1–4.2 | — |
| Convention 7, 5.1 (locators changed) | `b′(a ⊗ b)`; unital `A` with `s(z) = 1 ⊗ z` | `ab`, so `H₁ = A/A²`; `b′s + sb′ = id` | holds | — |
| 5.2 (locator changed) | `S` flat; `pℤ ⊂ ℤ`; `k ⊕ A` | `Tor₁(S, V) = 0` gives purity; `pℤ ⊗ ℤ/p → ℤ/p` is `0`; flat | holds, pure extensions as in the source | — |
| 5.3 (locators changed) | `εℚ[ε]`; `Cor06` (8), (9) | `A/A² ≠ 0`, not H-unital, not excisive; both directions as cited | holds | — |
| `Suggested.lean` docstring (changed) | 4.3, 4.5 against Tau Ceti `UniversalForms` | `Unitization k A ⊗[k] TensorPower k n A` is the forced-unitisation model, not `A ⊗ Ā^⊗n` | the stated missing carrier is right | — |
| 1.2, 1.4, 2.1, 2.2 headline, 2.5, 2.6, 4.1 (`IsQuasiFree`, nilpotent lift, dimension form), 4.2, 4.3, 4.4, 4.5, 4.6, 5.4, 5.5, 5.6 | as in the previous review | the values of the previous review's table (e.g. projective dimensions `−∞, 0, 1, ∞, 2` for `0, K, K[x], K[ε], K[x, y]`; `[gA E₁₂, gA E₂₁] = gA(E₁₁ − E₂₂)` on `e₂ ⊗ e₂`; `[x dy] ≠ 0` in `HC₁(k[x, y]/(xy))`) | hold | — (previous review) |

## Not verifiable

- Wodzicki 1989: the README says an open scan is on the author's page at Berkeley; that host answered HTTP 403 to the sources service and no other legal copy was found. The numbers (2), (3), (4) agree with `Cor06`; the pages 591, 592, 593, 609, the number of Corollary 4.5 and "proved in its Sections 4–8" were not checked against the text.
- Marín 1998 and González-Férez–Marín 2007: not read (see R01); statements checked against the zbMATH reviews in the previous rounds.
- Goodwillie 1985 (now cited only for 3.2, Theorem II.5.1, through `Cor06` line 94) and the other texts listed in the previous review: unchanged.

## Source issues

- none
