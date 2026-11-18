# Review of AutomorphicCongruences (pull request #1816 at 7b2fc66)

**Verdict:** accepted

**Summary.** Accepted: no finding. The fifteen sampled sections and the headline statements agree with their sources at the cited places, every worked value recomputes, and the one change of substance since the last review (Serre's conjecture now taken from SerreModularityByCompatibleSystems Layer S6) resolves and creates no cycle. There is one small correction (§§5.4 and 5.10 say Wan's paper prints `p > 5` and `κ0 > 2`; it prints `p ⩾ 5` and `κ0 ⩾ 2`) and two format notes, none blocking. Five points are left for the human reviewers, the main one being that §2.12 is a theorem the README itself says is not in the literature.

## C01 — Wan's Theorems 3, 86 and 101 are stated for `p ⩾ 5` and `κ0 ⩾ 2`, not for `p > 5` and `κ0 > 2` as §§5.4 and 5.10 say

A reader is told that the roadmap extends Wan's theorem to `p = 5` by its own argument and must reach weight two by a detour through weight `p + 1`; neither is needed, and the hypothesis `κ0 > 2` of §§5.4 and 5.10 is narrower than the source's.

In the source paragraph of §5.4 (line 1637) and of §5.10 (line 1765) the text reads "Wan-2015 prints p > 5 and κ0 > 2". The published pages show otherwise: Theorem 101 on p. 88 reads `p ⩾ 5` and `κ0 ⩾ 2`, and Theorem 86 on p. 70 reads `p ⩾ 5` (I rendered both pages of the publisher's PDF). The mistake comes from the text extraction, which turns every `⩾` into `>`: the extracted text has no `≥` or `⩾` on any of its 95 pages, and shows `ord > ord` in Proposition 98 and Theorem 100 (`Wan-2015 lines 4343–4344, 4400`), which §§0.7 and 5.8 rightly read as `≥`.

The stated results stay true: `p ≥ 5` is what the README assumes, and a family through an ordinary weight-two form also has the weight `p + 1` member the README uses. The smallest repair: delete the two sentences beginning "Wan-2015 prints p > 5 and κ0 > 2" with the justification of `p = 5` that follows each, and write `κ0 ≥ 2` in the hypotheses of §5.4 (lines 1631 and 1635) and §5.10 (line 1761). The remark on the weight `p + 1` member would then be a Check rather than part of the statement.

## N01 — One sentence of the supplier contracts still points downward

In the contract for CompletedCohomologyAndLocalGlobalCompatibility (gap fw-zeta-local-descent, line 2321) the text says "constructed in §3.6 below"; the contracts now stand after the layers, so §3.6 is above.

## N02 — The eighteen "The interface is used in" sentences do not parse

Each joins a section link to a full clause with "to" ("is used in §2.4 to the joint ideal … avoids every height-one prime", §2.3; "to Its local quotient length measures the cuspidal Eisenstein congruence.;", §5.6, with doubled punctuation). "is used in §2.4, where …" or a colon would read correctly.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.3 semi-ordinary Klingen families | `CLW lines 2200–2211, 3108–3111`; `CLW-addendum lines 221–239` | Source: weight two, `k ≥ 6` even, two families in the ♮ space ⊗ ℚ, divisibility in `Ô^ur[[Γ_K]] ⊗ ℚ`. README: the same, `R[1/p]` | agrees | none |
| §2.6 CAP exclusion | `CLW lines 6296–6346`; `FW lines 5736–5753`; eigenvalues 1, 2, 3, 4 | Slopes: `v(α₁)+v(α₂)=0`, both `≥ −1/2`; ratio `p^(±1)` only at `(−1/2, 1/2)`, the ordinary case. `e₁..e₄ = 10, 35, 50, 24` | agrees | none |
| §2.7 CLW localized divisibility | `CLW lines 6217–6231`; `A = O[[X,Y]]`, `M = A/(Y)` | `M ⊗_A R = R/(Y)`, torsion. Source's printed tensor over `O[[X]]`: `M ≅ O[[X]]`, giving `R`, free. `A/(X)`, `A/(p)` die in `R` | README's reading is the meaningful one | none |
| §2.8 integrality and p-inverted form | `CLW lines 6232–6248, 6367–6385`; `p = 3`, `𝔫 = 7`, `𝔫 = 5` | `φ(7) = 6`, `v₃ = 1`; `φ(5) = 4`, `v₃ = 0`. `u/3` and `u`: same ideal after inverting 3, only `u` integral | agrees | none |
| §2.11 Greenberg = Hida · Katz · h_K | `FW lines 5282–5292`, p. 89; `K = ℚ(√−23)`, `p = 3` | `h_K = 3`; `−23 ≡ 1 mod 3`, so 3 splits. Dropping `h_K` changes `ord_(3)` by 1 and nothing after inverting 3 | agrees | none |
| §2.12 two-family theorem | `FW lines 5640–5654, 5692–5716`; `CLW-addendum lines 12–48`; `O[[X,Y]]` | `1/(k−1)`: 1 at `k=2`, 1/3 at `k=4`. `O[[X,Y]]/(F(X)) = (O[X]/F)[[Y]]` is a domain where `G(Y) ≠ 0`: no common height-one prime | proof route sound; statement is the roadmap's own | none (see human reviewers) |
| §3.6 equivariant zeta morphism | `NAK lines 2132, 2529–2540, 2694–2707, 2727` | Pages 48, 56, 60, 61 as cited. τ-equivariance and the two corestriction cases match Theorem 3.16 | agrees | none |
| §3.7 universal zeta morphism | `NAK lines 140–183`; `p = 5`; `C = [A —X→ A]`, `A = k[[X]]` | (N1)–(N5), (i)–(iii) match. `1/2 ≡ 3 mod 5`. `H¹(C) = 0`, `H¹(C ⊗ᴸ k) = k`. Cokernel for `A/f`: `H²(C)[f]` | agrees | none |
| §3.8 specialization to Kato | `NAK lines 2934–2941`, p. 66; (77) at `NAK line 3413`, p. 78 | Euler product over `Σ ∖ {p}`; independence of (55) from `End = E`. Steinberg at ℓ: `ρ^(I_ℓ)` a line, degree 1 | agrees | none |
| §4.4 family to classical points | `FW lines 4260–4310`, pp. 72–73; `T/T`, `1/T`, `T/1` at `T = 0` | Source: `(α/β)`, `λ(f)(β) ≠ 0`, étale `x` off the zero set, all `γ_ψ` units. Values 1, undefined, 0 | agrees | none |
| §4.10 constancy of the λ-defect | `NAK lines 3496–3504, 3656, 3662–3675`; `Λ/(ϖ)`, `Λ/(T)`, `Λ/(T−p)` | Statement has `dim H²`; last proof display prints `H¹`. `Λ/(ϖ)`: `λ = 0`, `M/ϖ` infinite. `λ = 1, 1`, ideals differ | README's `H²` is right | none |
| §5.6 coefficient Eisenstein ideal | `Wan-2015 line 4148`, p. 81; `Λ = h = ℤ` | `H=8, λ=3`: `(5)`. `H=2, λ=1`: `ℤ`. `ℤ → ℤ/5`, `H = λ`: `I_D = 0`, kernel `(5)` | agrees | none |
| §5.8 polarized 1+2+1 extension | `Wan-2015 lines 4295–4344, 4359–4400` | Conditions (1)–(10), `Φᵗ = −ν(c)Φ`, `ρ`, `χ`, `χ′ = νχ^(−c)` match. Ranks `1+1 = 2`. `6ℤ_(2) ∩ ℤ = (2)` | agrees | none |
| §6.2 restriction to K | `BCS lines 441–469`, p. 9; valuations 3 against 2+2 and 1+1 | `(ϖ³) ⊇ (ϖ⁴)` holds, `(ϖ³) ⊇ (ϖ²)` fails. Source prints the two summands over `M`; over `K` is meant | agrees | none |
| §7.9 rational cyclotomic theorem | `BCS lines 59–68, 531–550`; `char = (p)`, `L = 1` | Source: `p > 3`, (irr_ℚ), equality in `Λ ⊗ ℚ_p`, (5.4) rational without (im). Example: equal in `Λ[1/p]`, `ord_(p)` 1 against 0 | agrees | none |
| §8.1 aggregate | `BCS lines 59–77`; transvections `[[1,1],[0,1]]`, `[[1,p],[0,1]]` | Cokernels `ℤ_p` and `ℤ_p ⊕ ℤ/p`. (a) rational without (im), integral with it; (b) is §4.5 | agrees | none |
| §0.7 lattice theorem | `SU lines 2282–2299`, p. 61; `Wan-2015 lines 4343–4345`; `K = ℚ(i)`, `p = 5` | `(1+i)⁴ = (2i)² = −4 = 1 − 5`. Wan's Proposition 98 is clause (iii) for every `n` | agrees | none |
| §1.10 SU two-variable divisibility | `SU lines 1550–1559`, p. 41; 11a1, `p = 7`, `ℓ = 113` | Point count: `a₁₁₃ = 9`. `(114² − 81)/113² = 12915/12769`, `12915 = 3²·5·7·41`, `v₇ = 1`. `113 ≡ 2 mod 3`, inert | agrees | none |
| §1.11 SU cyclotomic divisibility | `SU lines 1592–1604`, p. 42; 11a1, `p = 7`, `K = ℚ(√−3)` | Point count: `a₇ = −2`. `−3 ≡ 2² mod 7`; `−3 ≡ 8 mod 11`, a nonresidue. Four bullets of Cor. 3.6.3 match | agrees | none |
| §2.14 FW divisibility | `FW lines 5717–5728`, p. 96 | Even `k`, trivial character, `p ∤ N`, `q ∥ N` nonsplit, `2 ∥ N` if nonsplit, twist `ℓ ↦ −ℓ^(k/2−1)`: all in the README | agrees | none |
| §§4.3, 4.5 FW main conjectures | `FW lines 4016–4045`, pp. 68–69 | Three hypotheses and `ℓ ∥ N` match. Parity: `k−1` odd, `p−1` even, so `2a ≡ k−1 mod (p−1)` has no solution | agrees | none |
| §§5.4, 5.10 Wan's family divisibility | `Wan-2015 lines 3550, 4411–4426`; publisher's PDF pp. 70, 88 rendered | PDF: `p ⩾ 5`, `κ0 ⩾ 2`. Extracted text: `>`; 0 lines with `≥`/`⩾`, 90 with `>` | README's remark on the print is wrong; statement true | C01 |
| §6.6 BCS product divisibility | `BCS lines 479–517`, pp. 9–10 | `p ≥ 5`, (i)–(vi); rational containments, then `μ = 0` (Prop. 4.2.2) gives the integral ones | agrees | none |
| §7.8 factor separation | defects `(1,0,0,0)`, `(1,−1,0,0)`; ideals in a domain | Sums 1 and 0; only `(0,0,0,0)` passes both bounds. `x·∏_(j≠i) L_j = a·∏ L_j` gives `x = a·L_i` | holds | none |
| §7.10 integral refinement | `E: y² = x³ − 4x + 7`, `p = 5` | `Δ = −16·1067 = −16·11·97`; `#E(𝔽₃) = 7`, `#E(𝔽₅) = 4`; `9 − 12 ≡ 2 mod 5`, nonresidue; `6048 ≡ 9 mod 11`; `v₅(10/11) = 1` | every value as stated | none |
| §§3.2, 3.3 Serre input (changed since last review) | SerreModularityByCompatibleSystems at its open head | Layer S6 states a newform of weight `k(ρ̄)`, level `N(ρ̄)` for odd irreducible `ρ̄`; that README never cites this roadmap; merge order 266 < 406 | resolves, no cycle | none |
| `Suggested.lean` | elaboration at the pins | 59 lines, 0 declarations, 0 `sorry`; exit 0, no output. Docstring names §§1.10–1.11, 2.7–2.8, 2.14, 2.20–2.22, 4.3, 4.5, 5.10, 6.6, 7.9–7.10 | agrees with README | none |
| Pull request text | title, summary block, prose against the head | Folder not on main; 3 files, 2432 insertions; depends-on lists SerreModularityByCompatibleSystems and no longer ClassicalSerreModularity; endpoints named are §§1.10–1.11, 2.7–2.8, 4.3, 4.5, 5.10, 7.9–7.10 | agrees | none |

- Previous review: it had no finding; nothing to repair. Since the head it read, 163 lines moved (scope and supplier contracts to the end, text identical after sorting) and ClassicalSerreModularity Layer R27.6 became SerreModularityByCompatibleSystems Layer S6 in five places.
- Source locators checked against the text: about 75, in 7 sources (CLW, CLW-addendum, FW, NAK, Wan-2015, BCS, SU), covering all fifteen sampled targets; every page and number as cited, apart from C01.
- Library declarations opened at the pins: `Ideal.comap` and `Ideal.mem_comap` (`Mathlib/RingTheory/Ideal/Maps.lean` 47, 80), `Ideal.map_span` (185), `Module.length` (`Mathlib/RingTheory/Length.lean` 31), `IsReduced`, `IsRegularLocalRing`, `TauCeti.fittingIdeal`, `TauCeti.ContCohomology.H1`, `oddPrimeDiscriminant`. All present. The `#check` comparison and the one-tactic probe have no declaration to run on.
- Cross-roadmap citations resolved at main or the open heads: 56 section or layer citations in 21 roadmaps, all present under the cited number.
- Automatic checks, rerun: all pass, the targeted build included. Dependency check output: `depcheck: 201 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Changes outside the folder: none.

Overlap check: read ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, KatoEulerSystems, HeegnerPointEulerSystems, RankOneConverse, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa; nothing shared. The lattice theorem, Ichino's triple product formula, the Yager module, the Klingen families and the universal zeta morphism appear elsewhere only as citations of this roadmap, or as different objects (Gan–Ichino, Yager's two-variable functions, Siegel-modular Klingen series).

Source independence: 19 passages compared with 7 sources, none shared beyond formulas and hypothesis lists; largest share FW, 44 of 180 locators; contents compared with FW: independent (FW §§2–3 fall in Layer 3, §4 and §7 in Layer 2 with CLW, §5 in Layer 4, in a different order; Layers 0, 1, 5–8 have no FW counterpart).

Research link: the endpoints are the main theorems of Skinner–Urban (2014), Castella–Liu–Wan (2021, addendum 2023), Fouquet–Wan (2021), Wan (2015) and Burungale–Castella–Skinner (2024), with Nakamura's zeta morphisms (2020); they supply the reverse divisibilities of the GL₂ main conjectures. Rests on the README and the sources read.

## Not verifiable

- The page numbers of the journal print of BCS cited in §§7.8–7.10 ("proof, p. 12"): the text at hand is arXiv v2, where the same theorem and proof are on pp. 2 and 10, as §§6.2, 6.6 and 8.1 cite them.
- `Hung2017` (uncertified) and `Ichino2008`, `Ikeda1994`, `Harris1984`, `Rubin2000`, `BST19` (waived) are cited by locator only; Harris's Theorem 2.5.6 was checked only as CLW, FW and SU quote it.
- The 21 supplier contracts were not each re-derived; the 16 declared ones read as precise and single-purpose, and none asks for a section its supplier already has.

## Source issues

- **Misprint** in NAK at proof of Theorem 5.13, last display, p. 84: the source says the residual side subtracts the dimension of the first Iwasawa cohomology; it should be the second, as in the theorem's statement; affects nothing.
- **Misprint** in BCS at proof of Lemma 5.1.1, p. 9 (arXiv v2): the source says the two Shapiro summands are Selmer groups over the quartic field M; it should be over K, for the form and its quadratic twist; affects nothing.
- **Misprint** in CLW at proof of Theorem 8.2.1(2), p. 81: the source says the main conjecture is applied under conditions (dist) and (dist); it should be (irred) and (dist); affects nothing.
- **Misprint** in CLW at Theorem 8.2.1(1), display (8.2.1), p. 78: the source says the Selmer dual is tensored with the localized ring over the cyclotomic subring; it should be over the full two-variable Iwasawa algebra; affects a stated result.
- **Gap** in FW at Proposition 7.29, p. 96: the source says three auxiliary L-values are units at once, by nonvanishing for almost all twists; it should use two families, each with two units; affects the proof; corrected in print at CLW-addendum §1 and Theorem 4.0.1 (weight two).

## For the human reviewers

- **Scope.** §2.12 (README line 817) states the two-family Fourier–Jacobi theorem in weight `k`, which the README says "is not stated in the literature"; §1.10 replaces Skinner–Urban's appeal to their Proposition 13.4.1(ii) by its own Euler-factor argument.
- **Not tested.** The README states 21 supplier contracts; the board plan declares 16 (README only: `katz-ht93-normalization`, `hecke-l-values-mod-p`, `hida-rankin-selberg-cm`, `anticyclotomic-nonvanishing-mod-p`, `vatsal-theta-mu`).
- **Not tested.** The extracted text of `Wan-2015` shows every `⩾` as `>` (no `≥` on 95 pages); inequalities from it need the PDF. C01 is one consequence; other roadmaps citing it may have others.
- **Scope.** ModularIwasawaMainConjectures, at its open head (its README lines 1905 and 1968), says §7.10 here has "extra correction-unit" hypotheses and asks this roadmap for three further contracts; §7.10 at this head assumes only (im).
- **Not tested.** The journal print of BCS, cited for page numbers in §§7.8–7.10, was not read; only arXiv v2 is recorded.
