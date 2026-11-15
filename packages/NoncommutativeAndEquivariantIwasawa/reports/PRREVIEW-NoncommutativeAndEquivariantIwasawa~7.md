# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at a638121)

**Verdict:** needs changes

Incremental re-review of the 50 lines changed since `6f7588d` (README only; `Suggested.lean` unchanged), plus the pull request's title and description. Three P3 findings; no statement is false.

## R01 (P3) — The rewritten use-sentence leaves out Layer 5

**Location:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:127`: "Only §§6.1 and 7.9–7.18 use these results."

**Claim:** Layer 5 also uses the results of ClassicalArithmeticCompletion §§7.12a–7.12c. Its Artin values are built through the finite-Hecke/Artin comparison, which README:129 now bases on §7.12c's rank-one identification. The sentence is false, and so is the description's restriction to "§§6.1 and 7.9–7.18".

**Witness:** README:2307 defines artinLValue "through Brauer induction from finite-order Hecke characters, whose continuation and functional equation are the finite-Hecke/Artin comparison in Exact supplier contracts", and says §§5.5–5.8 and Layer 6 use it. README:2517 lists the comparison as a dependency of Layer 5.

**Repair:** Replace README:127 by "Layer 5 (the Artin values artinLValue and artinLValue_induction of its introduction, used by §§5.5–5.8 and Layer 6), §6.1 and §§7.9–7.18 use these results." In the description, replace "used in §§6.1 and 7.9–7.18" by "used in Layer 5's Artin values, §6.1 and §§7.9–7.18".

## R02 (P3) — Five citations still name the "local-constant contract" that the change deleted

**Location:** README:4109 (§7.15 step 3), "Use the shared local-constant contract of ClassicalArithmeticCompletion"; the same phrase at README:24, 4134 (§7.15 *Needs:*), 4390 (Layer 7 Dependencies) and 4553 (References).

**Claim:** The change removed the README's only definition of this contract (old README:46 and the old opening of the ClassicalArithmeticCompletion subsection) and replaced it with §§7.12a–7.12c everywhere else. These five citations now point to nothing.

**Witness:** ClassicalArithmeticCompletion on main (`3cf7342`) has no heading or phrase "local-constant contract" or "forwarding" (0 hits). Its local constants are §7.12a (Tate) and §7.12b (Weil, Deligne–Langlands), at its README:14065 and 14109.

**Repair:** README:4109: "Use the Weil local constants of ClassicalArithmeticCompletion §7.12b, with §7.12a's additive characters and measures, and the raw parameter of §F.6." README:4134: "ClassicalArithmeticCompletion §§7.12a–7.12b". README:24: "…of ClassicalArithmeticCompletion §7.12b and §§7.13, 7.30." README:4390: "ClassicalArithmeticCompletion §§7.12a–7.12c". README:4553: "ClassicalArithmeticCompletion Layer 7, including §§7.12a–7.12c".

## R03 (P3) — The restored §6.6 *Needs:* line omits §6.1, which the statement and proof cite

**Location:** README:2728: "*Needs:* [6.2] (The Burns–Kato patching principle); [3.11] (`SK₁` and the quotient `K′₁` …); TauCetiRoadmap ClassicalArithmeticCompletion §7.86."

**Claim:** §6.6 takes the orbit set `𝒞` and the idempotents `e_[χ]` from §6.1, but its *Needs:* line does not list §6.1. The previous report's R01 repair prescribed this line, and that prescription was incomplete.

**Witness:** README:2710 (statement): "Put `𝒞=I_{ℚ_p}(C_n)` as in §6.1". README:2718 (proof, step 1): "the orbit-summed primitive idempotents `e_[χ]` of §6.1". §6.1 defines `e_[χ]` (README:2595).

**Repair:** README:2728: "*Needs:* [6.2](#62-the-burnskato-patching-principle) (The Burns–Kato patching principle); [6.1](#61-the-main-conjecture-for-abelian--prime-to-p-galois-groups) (the orbit set `𝒞=I_{ℚ_p}(C_n)` and the idempotents `e_[χ]`); [3.11](#311-sk-and-the-quotient-k-of-iwasawa-algebras) (`SK₁` and the quotient `K′₁` of Iwasawa algebras); TauCetiRoadmap ClassicalArithmeticCompletion §7.86."

## Previous findings

- R01 — repaired: §§6.3–6.6 are again four `###` subsections (README:2642, 2661, 2681, 2708), each with its Kakde locator after the theorem and its own *Needs:* line. The text is identical to `e311e48`. The six links in §§6.16, 6.26 and 6.34 resolve. The prescribed §6.6 line was incomplete (R03).
- R02 — repaired: "AI assistance: GPT-6 (Codex) and Claude, for the port from the accepted explorer package and for the author-side red-team and review repairs."

## Verified sound

| Statement | Instances tried | Values on the compared sides | Result / change |
|---|---|---|---|
| Supplier claim, README:125, against ClassicalArithmeticCompletion §§7.12a–7.12c | The nine items listed | Trace characters, self-dual measures, Tate ε with local functional equation (CAC 14065–14107); Weil ε, conductor, `a_F(Ind V)` formula (14109–14135); Euler factors, induction, rank one, Brauer continuation, `Λ=WΛ̄` (14137–14157) | All nine found on main. |
| Comparison, README:129: trivial-character residue after deleting `Σ` | `F=ℚ(i)`, `Σ={(1+i)}` | `Res ζ_{ℚ(i)} = 2π·h·R/(w√4) = 2π/8 = π/4`; times `(1−N(1+i)⁻¹) = 1/2` gives `π/8` | Agrees with §7.12c ("trivial character gives the Dedekind zeta completion"). |
| README:127, "Only §§6.1 and 7.9–7.18" | Layer 5 Artin value, `F=ℚ(√5)`, `χ` mod 5 even, `k=2` | `B_{2,χ}=5·(1−4−9+16)/25=4/5`, `L(χ,−1)=−2/5`; `ζ(−1)L(χ,−1)=1/30=ζ_{ℚ(√5)}(−1)`. Built on §7.12c's rank-one continuation (README:2307) | Used outside the listed sections: R01. |
| §7.15 ε, README:4109 | `V=ℚ_p(1)`, `ψ_p` with kernel `ℤ_p`, `dx(ℤ_p)=1` | Unramified: `a=0`, `ν=0`, §7.12a's formula `χ(c)q^ν vol = 1`; the README Check also gives `1`. "local-constant contract": 0 hits in CAC or elsewhere in the README | Values agree; citation dangling: R02. |
| §6.6 statement and *Needs:*, README:2710, 2728 | `p=5`, `C_n=C₃`, trivial action | `5≡2 mod 3`, so the orbits are `{1}` and `{χ,χ²}`; `ℤ₅[C₃]≅ℤ₅×ℤ₅[ζ₃]`, ranks `1+2=3`. `𝒞` and `e_[χ]` come from §6.1 | Statement sound; §6.1 missing from *Needs:*: R03. |
| §6.3 *Needs:*, README:2659 | Proof inputs against the line | Step 1 uses §3.11, step 2 uses §6.2; line = {6.2, 3.11}. Kakde Thm 21 (`kakde line 837`, p. 19): `μ=0`, `U≤H` open pro-`p` normal, `K′₁`-injectivity | Match. |
| §6.4 *Needs:*, README:2679 | Proof inputs against the line | §3.11 steps 2 and 6, CAC §7.63, §6.2 = line. Kakde Thm 27 (`kakde line 950`, p. 21): `ℚ_p`-elementary hypotheses, one-dimensional conclusion | Match. |
| §6.5 *Needs:* and Check, README:2706, 2704 | `p=3`, `C=C₃`, `P=C₂` by inversion | Inputs {6.1, 3.11, 3.14, 6.2} = line. `1+(ζ₃−1)ℤ₃[ζ₃]` is pro-3; squaring is bijective because `2∈ℤ₃^×`. Kakde Thm 33 (`kakde line 1211`, p. 27): `K₁`-injectivity as printed | Match. |
| §7.11 *Needs:* → CAC §7.12c, README:3940 | `F=ℚ`, `ρ=1`, `S={∞,5}` | `L_S(s)=ζ(s)(1−5^{−s})`: simple pole at 1, leading coefficient `1·(1−1/5)=4/5`; §7.12c supplies the continuation | Supplier fits. |

The rows for untouched statements stand as in the previous review, of `6f7588d`.

- Source locators checked against the text: 4. Kakde v3 Theorems 21, 27, 33 and 36 are at `kakde line 837`, 950, 1211 and 1289 (pp. 19, 21, 27, 29); Theorem 36's hypotheses (`p-ℚ_p`-elementary, MC for each `χ`, `K′₁(Λ_{O_χ}(U_χ))`-injectivity) match README:2710.
- Seeded sample: none of the fifteen sampled targets lies in a changed passage; §6.15 appears only as an anchor in the changed §6.16 *Needs:* line. They were not re-certified this round.
- Cross-roadmap citations resolved: 7. These are ClassicalArithmeticCompletion §§7.12a, 7.12b, 7.12c, 7.13, 7.30, 7.63 and 7.86 (its README:14065, 14109, 14137, 14159, 14582, 15384, 15913) on main `3cf7342`; the branch's merged copy is byte-identical. ArithmeticGaloisRepresentations, AdelicAlgebraicGroups and AutomorphicLFunctionsAndLocalFactors are no longer named, and `epsilonWeil` occurs nowhere.
- Internal links: 378, all resolving under GitHub's slug rules, including the eight links to the §§6.3–6.6 anchors.
- Gate rerun at this head: every counter 0, `OK`; nothing outside the folder differs from `origin/main`. Dependency check: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/Suggested.lean` gives seven `sorry` warnings and nothing else. The file is unchanged since `6f7588d`, so the signature and padding results stand.
- Pull request text against the head: the title, the summary block and the prose agree with the README (a new folder of three files, 13 Lean declarations, seven sorried theorems, ClassicalArithmeticCompletion §§7.12a–7.12c), apart from R01's restriction. The README names ten roadmaps that are neither on main nor in the merge-order chain, all as consumers (README:454, 556, 1850, 1893, 2541, 4018, 4070–4074, 4080, 4473, 4477), so "Apart from the suppliers in the merge order, the roadmaps not on main … are consumers" holds.
- Remark (untouched §7.15 text, no change asked): step 3 uses `ψ_p` valued in `Q̄_p^×`, while ClassicalArithmeticCompletion §7.12b constructs complex-valued constants; the coefficient transfer is not stated.

Overlap check: searched SelmerIwasawaCohomology, IntegralIwasawaTheory, IntegralIwasawaTheoryPartII, EulerSystemsAndKolyvaginSystems, PadicFamilies, PadicMeasuresIwasawaAlgebras and ClassicalArithmeticCompletion for the objects of the changed passages (Tate and Weil local constants, finite-image Artin functions, Burns–Kato reductions). The local constants and Artin functions are owned by ClassicalArithmeticCompletion §§7.12a–7.12c (on main) and imported here; nothing else is shared, and no other roadmap cites §§7.12a–7.12c.

Source independence: changed passages only. 5 passages compared with 1 source: the four restored theorem and locator passages of §§6.3–6.6 against `kakde line 837`, 950, 1211 and 1289, with at most three consecutive words shared ("open pro-p", "normal in G"), all forced by the statement, plus the new README:125 summary, which paraphrases a roadmap on main and no source. The largest share stays with kakde. Contents were not compared again: the change adds, removes or reorders no layer.

## Not verifiable

- Deligne (1973), §3.12(A)–(D), Theorem 4.1 and §8.12 at README:131: the locators are unchanged and the scan was not reopened this round.
- Whether Deligne (1973) transfers the constants of §7.12b to `Q̄_p` coefficients (the remark above) was not settled, because the scan was not read.

## Source issues

- none

## For the human reviewers

- none
