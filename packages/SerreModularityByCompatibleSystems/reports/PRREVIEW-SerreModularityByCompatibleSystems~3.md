# Review of SerreModularityByCompatibleSystems (pull request #2514 at 272ffeb)

**Verdict:** accepted

**Summary.** Accepted: no finding. The fifteen sampled targets were read against Dieulefait–Pacetti, Khare–Wintenberger (I), Khare and Serre at their locators, and every statement, Check and worked value recomputed here holds. There are three small corrections and one format note, none blocking: the description's summary still states Theorem 10.1(i) without the twist, two sentences attribute Dieulefait–Pacetti's general Theorem 1.9(4) to a supplier section that states only Khare–Wintenberger's four prescriptions (which suffice for every use), and "repeats unchanged" overstates what the supplier declares in Lean. The head is the one the previous review read, so its small correction and its format note are still open. One licence question is left for the human reviewers.

## C01 — The description's summary still states Theorem 10.1(i) without the twist that the README carries

A reader of the pull request takes the summary as the theorem. It says the roadmap derives "modularity of odd, irreducible, regular rank-two compatible systems (Khare–Wintenberger, Theorem 10.1(i))". The twist `ρ_{f,λ} ⊗ χ_ℓ` of a newform's system is odd, irreducible and regular, with Hodge–Tate weights `{1, k}`, and no newform is attached to it. The README overview (line 7) and `S7/regular-compatible-systems` (line 390) say "comes, after a twist, from a newform", and the source says "arises up to twist" (KW-I line 855). Writing "modularity, up to a twist, of odd, irreducible, regular rank-two compatible systems" makes the summary agree with the README.

## C02 — ClassicalSerreModularity §I.3 states Khare–Wintenberger's four prescribed lifts, not the general Theorem 1.9(4) that two sentences attribute to it

An implementer who follows the pointer looks in §I.3 for a lift with an arbitrary compatible inertial type and does not find one. In `S2/good-dihedral-prime-insertion` (line 131) the text says "the general existence theorem, Theorem 1.9(1)–`(4)`, is ClassicalSerreModularity §I.3", and item (a) of `S5/globalisation-dependency-check` (line 296) says "case `(4)` is Gee and Snowden (ClassicalSerreModularity §I.3)". At its open head, `I.3/prescribed-lifts` constructs exactly the four lifts of Khare–Wintenberger Theorem 5.1(1)–(4) and cites only [KW-I] and the Annals paper; Gee's and Snowden's theorem for an arbitrary compatible type (DP line 258–261) is not stated there.

No stated result is affected, because every use of Theorem 1.9(4) in this roadmap is one of the four: Paso 1 and the weight-six lift of Paso 6 are Theorem 5.1(2) (parameter `(ω^{k−2} ⊕ 1, 0)`, resp. `(id, N ≠ 0)` at `k = p + 1`); Paso 2 and Lemma 2.3 are Theorem 5.1(4) at `(p, q) = (q, N)` and `(3, 2)`, with `p | q + 1` and a niveau-two character of `p`-power order (KW-I lines 373–377 and 398–414). The smallest repair is to say so: in line 131, "the existence theorem in the four forms used here, Khare–Wintenberger Theorem 5.1(1)–(4), is ClassicalSerreModularity §I.3"; in line 296, "the uses of case `(4)` here are Theorem 5.1(2) and 5.1(4); the general case, due to Gee and Snowden, is not needed".

## C03 — "Repeats their definitions unchanged" holds for four of the twelve Lean names; the other eight are first declared here

Line 33 says the twelve Lean spellings "are those specified, with their Checks, in ClassicalSerreModularity's Arithmetic interfaces" and that `Suggested.lean` "repeats their definitions unchanged"; line 476, the module docstring and the description say the same. A reader who searches ClassicalSerreModularity for `ArisesFrom` or `IsSType` finds nothing: at its head its Lean file declares `GQ`, `IntBar`, `IsFrobAt` and `IsUnramifiedAt` (identical to the ones here, compared declaration by declaration), and its README specifies the coefficient field, oddness, absolute irreducibility, S-type, the Fourier coefficients, the coefficient ring, attachment and the matrix action in words only, saying that this roadmap's file declares them. "Repeats `GQ`, `IntBar`, `IsFrobAt` and `IsUnramifiedAt` unchanged and declares the residual and newform interfaces specified there in words" would be exact.

## N01 — "Definition 2.1" in an S2 Check is Khare–Wintenberger's; Dieulefait–Pacetti have no Definition 2.1

The Conventions (line 23) say Dieulefait–Pacetti's numbered results are cited by their numbers, so the Check on `q = 5` (line 148), "Definition 2.1 asks for `t > 5`", sends the reader to DP, whose only definition in §2 is Definition 2.2 (DP line 536). The good-dihedral definition is KW-I Definition 2.1 (KW-I line 171). Writing "Khare–Wintenberger's Definition 2.1" fixes the pointer.

## Previous findings

The previous review read this same head and had no finding. Its two remarks are unchanged in the text and are repeated above.

- C01 (previous review) — not repaired: the description still reads "modularity of odd, irreducible, regular rank-two compatible systems (Khare–Wintenberger, Theorem 10.1(i))". Raised again as C01.
- N01 (previous review) — not repaired: line 148 still reads "Definition 2.1 asks for `t > 5`". Raised again as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `S1/lifting-theorems-over-the-rationals` | DP Thms 1.4–1.7; `χ₃ ⊕ 1`; `p = 3` distinguishedness | Hypotheses match DP lines 140–184; `χ̄₃` ramified at 3 so `χ̄₃|D₃ ≠ 1`; `χ₃ ⊕ 1` reducible, excluded | holds | none |
| Cited forms of the lifting theorems | KiFM (2.2.17); HT 6.3; TuA 4.7; Paš16 1.1; TuB A; Pan 1.0.2 | Each assumes `ρ̄` modular (or reducible); Kisin's corollary on printed p. 685; HT 1.4 deduced after 6.3 | holds | none |
| `S1/residual-weight-normalization-transition` | `χ̄ ⊕ χ̄²`, `p ≥ 5`; niveau two `(1,3)` at `p = 5` | `1 + p·1 + 2 = p + 3`; twist gives `(0,1)`, weight 2; `1 + 5 + 3 = 9`; twist `(0,2)`, weight 3 ∈ [2,6] | holds | none |
| `S1/fontaine-laffaille-member-not-bad-dihedral` | niveau 1 and 2; `p = 7, k = 5`; `k = 2` | `(p−1) ∣ 2(k−1)`, `k ≤ p` gives `k = (p+1)/2` or `p`; `8/gcd(8,4) = 2`; `2k−1, 2k−3 < 2k < p`; `k=2`: 3, 1 | holds | none |
| `S1/solvable-residual-termination` | reducible; irreducible solvable; `w > 2k ≥ 4`, `q > 5` | Thm 1.6 needs `p ≥ 5`: `w ≥ 5`, `q ≥ 13`; irreducible case Thm 1.3 then 1.4 (DP lines 444–449) | holds | none |
| `S1/weight-two-system` | both directions of the "iff" | `{ρ⁽¹⁾}` modular ⇒ `ρ⁽⁰⁾_w` by 1.4 ⇒ `ρ̄`; `ρ̄` modular ⇒ `ρ⁽⁰⁾_p` by 1.4 ⇒ `ρ̄_w` ⇒ `ρ⁽¹⁾_w`; lift is KW 5.1(2) | holds | none |
| `S2/dihedral-local-type-at-n` | `(q,N) = (7,13), (3,7), (3,2)`; `κ(Art N) = ζ`; residue characteristic 2 | `7∣14`, `7∤12`; `3∣6` so `κ^N = κ`, reducible; image `2q` vs `2q²`; trace `1 − 1 = 0`; swap unipotent in char 2 | holds | none |
| `S2/good-dihedral-prime-insertion` | `q = 13`, `N = 406561`; `q = 5` | prime; `≡ 1` mod 8, 3, 5, 7, 11; `≡ 12` mod 13; `det ρ(Frob_N) = ψ(N)N` not a root of unity; KW 5.1(4) hypotheses met | holds | C02, N01 |
| `S2/large-residual-images` | KW Def. 2.1, Lemma 6.3(i) | `t = q > max(Q, 5, p)` since all other ramified primes `< q`; `N ≡ 1` mod 8 and mod primes `≤ q−1` | holds | none |
| `S3/order-three-type-at-two` | matrices over `ℤ[ζ]`, `π = ζ − 1` | `D₀P = PD₁ = (ζ,0;ζ²,ζ²π)`; `F₀P = PF₁ = (1,π;1,0)`; mod π: `(1,0;1,1)`, `diag(1,−1)`; `α/β = 2 = −1` | holds | none |
| `S3/removing-two` | `k(ρ̄₂) = 4` and `= 2` branches | Steinberg lift (KW 5.1(2)) gives weights `{0,1}`; Lemma 2.3 needs that and 3 unramified; then `k = 2`, KW 5.1(1), Thm 1.5 | holds | none |
| `S3/killing-the-good-dihedral-prime` | reducible; irreducible; bad dihedral at level one | `N ≡ 1 (mod 8)` prime ⇒ `N ≥ 17 > 5`; level one bad dihedral ⇒ `p = 2k−1`, `k` even ⇒ `p ≡ 3 (mod 4)` | holds | none |
| `S4/level-one-system-at-five` | weights 2, 4, 6; characters unramified outside 3 | `k − 1` odd ⇒ `k ∈ {2,4,6}`; only `1, χ̄₃`, odd sum `1 ⊕ χ̄₃`; `4 = 3 + 1`; weight 6 is KW 5.1(2) at `k = p + 1` | holds | none |
| `S5/characteristic-two-closure` | `S₄`, `A₄`; auxiliary `p > 3` | 2-power elements of `PGL₂(𝔽̄₂)` have order ≤ 2; Lemma 1.14 would force `p = 3` or `1`; Thm 1.6 needs `p ≥ 5` | holds | none |
| `S5/qualitative-serre-theorem`, `serre_conjecture_weak` | `p = 2`; elaborated type; one-tactic probe | `−1 = 1` so oddness automatic; conclusion `∃ N k f, 2 ≤ k ∧ ArisesFrom ρ f`; `rfl`, `simp`, `simp_all`, `infer_instance`, `trivial` fail | holds | none |
| `S6/strong-form-by-minimal-lifts` | non-dihedral ⇒ hypotheses of KW 4.1/5.1; scalar `ρ̄|D₂` | `A₄`, `S₄`: normal subgroups with cyclic quotient are irreducible; `ℤ₂^×` pro-2 so characters to `𝔽̄₂^×` unramified ⇒ `k = 2` | holds | none |
| `S6/strong-form-of-serre-conjecture` | weight bounds | Serre §2.6: `[2, p² − 1]` for odd `p`; `{2, 4}` at `p = 2`, and `4 > 2² − 1` | holds | none |
| `S6/level-one-case`, `khare_level_one` | `Δ` mod 11; `p = 2, 3` | `τ(11) = 534612 ≡ 1`, ordinary, 11 not exceptional, no weight-2 level-1 form ⇒ `k = 12`; vacuous at 2, 3; probe fails | holds | none |
| `S6/finiteness-of-level-one-representations`, `finite_level_one_semisimple` | `p = 2`; reducible case | characters factor through prime-to-`p` quotient of `ℤ_p^×`: order ∣ `p − 1`, trivial at 2; Kh line 1226–1228 uses `S₂(Γ₁(p²))` | holds | none |
| `S7/finite-flat-weight-two-case` | Serre Prop. 4; très ramifiée extension | finite and `det|I_p = χ` ⇔ `k = 2` (Se87 lines 479–486); `det = ε χ` ⇒ `ε = 1`; oddness follows from `det = χ̄_p` | holds | none |
| `S7/regular-compatible-systems` | `ρ_{f,λ} ⊗ χ_ℓ`; `{0,0}` | twist has weights `{1,k}`; normalising to `(a,0)`, `a > 0`, gives `k = a + 1 ≥ 2`; KW-I line 855 "up to twist" | holds | C01 |
| `S7/weight-one-reduction-is-onto-for-almost-all-primes` | `k = 1, 2, ≥ 3` | `0 → H⁰/ℓ → H⁰(X_{𝔽_ℓ}) → H¹[ℓ] → 0`; `ω^k(−C) ≅ Ω¹ ⊗ ω^{k−2}`: `H¹ = 0` for `k ≥ 3`, free of rank 1 for `k = 2` | holds | none |
| `S7/weight-one-descent-from-infinitely-many-primes` | `N = 0, 1, 4, 5, 11`; finite set of eigensystems | `N′ = 0, 5, 20, 5, 11`; `Θ(T_r) − t_r` in primes over infinitely many `ℓ` ⇒ norm 0 ⇒ equal | holds | none |
| `S7/odd-artin-weight-one-modularity`, `weight_one_artin_modularity` | elaborated type; probe; `ℓ ∤ |G|` | `|G|` even so `ℓ` odd; Frobenius eigenvalues `1, −1` distinct; conclusion true for `f` or its conjugate; probe fails | holds | none |
| Lean definitions against ClassicalSerreModularity | declaration-by-declaration comparison | `GQ`, `IntBar`, `IsFrobAt`, `IsUnramifiedAt` identical; eight others absent from its Lean file, specified there in words | consistent | C03 |

- Source locators checked against the text: 38 (DP 19, KW-I 10, Kh 3, Se87 3, KiFM 1, HT 1, TuA 1), all correct; in addition the theorem numbers of Paš16, TuB and Pan were found at DP's and the README's citations.
- Library declarations opened at the pins: `IsArithFrobAt` (Mathlib, RingTheory/Frobenius.lean:184), `MonoidAlgebra.Submodule.exists_isCompl` (RepresentationTheory/Maschke.lean:159), `Representation.IsSemisimpleRepresentation` (RepresentationTheory/Semisimple.lean:34), `HeckeRing.GL2.Newform` (Tau Ceti, NumberTheory/ModularForms/Newforms/Newform.lean:104), `NumberField.Chebotarev.frobeniusPrimeSet` and its two density theorems (Tau Ceti, NumberTheory/Chebotarev). No pinned declaration states any of the four theorems; Mathlib's `Algebra.IsUnramifiedAt` is a different notion.
- Cross-roadmap citations resolved: 85 sections or targets, 30 in ClassicalSerreModularity, GL2ModularityLifting and CompletedCohomologyAndLocalGlobalCompatibility at their open heads and 55 in eleven roadmaps on main (one of them completed); all exist. The hypotheses LL1–LL3, CC1–CC5 and LC are stated in GL2ModularityLifting as the README describes them.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- The worker's automatic checks all passed on this head.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else; `#check @` of all sixteen declarations agrees with the README; no section variables are used, so no binder is lost.
- Duplication: the attachment and S-type predicates are owned in words by AlgebraicModularFormsAndSerreWeights §7.5 on main, which the `ArisesFrom` docstring cites; no roadmap's Lean file declares them, and no other roadmap states the four theorems.

Overlap check: read ClassicalSerreModularity, GL2ModularityLifting and PotentialModularityAndCompatibleSystems (open), SmallRamificationAndAbelianVarietyBaseCases, SerreWeightAndLevelOptimisation and AlgebraicModularFormsAndSerreWeights (main, and the two open revisions of the first two); Serre's conjecture and its consequences: this roadmap (ClassicalSerreModularity's head says so); prescribed lifts, compatible systems, good-dihedral lemmas: ClassicalSerreModularity; lifting theorems under named hypotheses: GL2ModularityLifting; terminal cases at five: SmallRamificationAndAbelianVarietyBaseCases §5.12; attachment predicate: AlgebraicModularFormsAndSerreWeights §7.5. Nothing has two owners.

Source independence: 21 passages compared with 4 sources (DP, KW-I, Kh, Se87), none reproduced; the longest shared run is nine words in step 1 of `S3/removing-two` (DP line 611), the name of the lift; largest share DP, 29 of 63 locators in the text; contents compared with DP: independent (DP §2 is spread over Layers S1–S4 with other material, DP §1 is imported, S6–S7 are not in DP; the order of the six steps is forced by the `*Needs:*` lines of `S2/good-dihedral-prime-insertion`, `S2/killing-the-odd-level`, `S3/removing-two`, `S3/killing-the-good-dihedral-prime` and `S4/level-one-system-at-five`).

Research link: Layers S1–S5 are Dieulefait–Pacetti's 2022 proof of Serre's conjecture (Khare–Wintenberger 2009); S6 is the strong form (Khare–Wintenberger Theorem 1.2, Khare 2006); S7 gives Khare–Wintenberger Theorem 10.1(i) and Corollary 10.2(ii), the Artin conjecture for odd two-dimensional representations. Rests on the README and on DP, KW-I and Kh as read.

## Not verifiable

- [Kh97] (Khare, Internat. Math. Res. Notices 1997): not read; the README cites it only through KW-I's reference to it (KW-I lines 873–877 and 976), which was read.
- [KW-II] and the Skinner–Wiles papers: not read; they are cited through ClassicalSerreModularity's targets, not by locator here.
- The two open revisions of SmallRamificationAndAbelianVarietyBaseCases and SerreWeightAndLevelOptimisation named in the description were not compared section by section; no cited id is dropped by them.

## Source issues

- **Error** in DP at Paso 2, p. 11: the source says the residue field of the unramified quadratic extension of `ℚ_N` has order `(N − 1)(N + 1)`; it should be that the field has `N²` elements and its unit group that order; affects nothing.
- **Misprint** in DP at Paso 2, p. 11: the source says the restriction of `κ` to the inertia group at `q` has niveau 2; it should be the inertia group at `N`; affects nothing.
- **Error** in DP at Paso 2, p. 11: the source says the lift has dihedral image of order `2q` at `N`; it should be the projective image, since the determinant of Frobenius is not a root of unity; affects nothing.
- **Error** in DP at Paso 3, p. 12: the source says the minimal lift is unramified at `p_i`; it should be crystalline at `p_i` with unramified Weil–Deligne parameter; affects nothing.
- **Gap** in DP at Remark 6, p. 13: the source says a très ramifiée representation is flat over an extension of even ramification index, and calls flatness over a cubic extension a contradiction; it should be that it is flat over no extension of odd ramification index; affects the proof.
- **Gap** in DP at the definition of minimal lift, p. 6, used in Pasos 3–4, pp. 12–13: the source says minimal means unramified where the residual representation is; it should be Khare–Wintenberger's minimality, which keeps the inertial type at `N`; affects the proof.
- **Gap** in DP at Theorem 1.7, p. 4: the source says the determinant is `ψχ₃^{k−1}` and the local residual representation at 3 is not the identity; it should be `ψ` of finite order and the residual character nontrivial on `D₃`, as in Skinner–Wiles; affects nothing.

## For the human reviewers

- Licence: ClassicalSerreModularity's Conventions §2.2 says its trace and determinant attachment interface follows the Imperial College London FLT project; `TauCetiRoadmap/SerreModularityByCompatibleSystems/Suggested.lean` declares that interface as `ArisesFrom` (lines 90–99). It was not compared with that repository.
