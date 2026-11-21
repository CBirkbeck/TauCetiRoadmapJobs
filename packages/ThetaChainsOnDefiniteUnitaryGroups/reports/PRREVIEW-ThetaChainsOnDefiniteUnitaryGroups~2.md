# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #2918 at 1ab8578)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** needs changes

**Summary.** Changes are needed. The mathematics I could compute holds:
- every Check and worked example I recomputed is right, including the CM constants of 3.1c, the branching integer of 3.9, the exceptional sets of 2.7, and the Hecke-character criterion of 2.4 with its counterexamples;
- every cross-roadmap citation resolves.

The three findings are about what the text claims:
- R01: two headline statements in the Summary claim more than 3.3 and 3.10 prove.
- R02: the statements whose routes the README leaves open rest on the formal proof, with no locator into it.
- R03: the Summary's description of the host draws a false implication.

There are also six small corrections and one format note. The human reviewers decide on the scope question raised by the main source, an unrefereed formal proof announced on 20 November 2026.

## R01 (P2) — Two headline statements of the Summary claim more than the layers prove

**Why it matters.** The Summary is where a reader takes the headline theorems from. As written, it promises an explicit constant and an unconditional period bound, and the layers give neither.

**What I found.**
- *The constant.* Headline 2 (line 8) says the step is "Up to an explicit nonzero constant" the class-set theta lift; the `Suggested.lean` docstring (line 36) repeats "up to an explicit constant". But:
  - 3.3 (i) (line 1739) only asserts that some `c₀(j) ∈ ℂ^×` exists.
  - The constant of 3.3 (iii) is `c_K(j) = vol(K_∞K)·c₀(j)·n_Â`, which contains that `c₀(j)`.
  - The route of 3.5 (lines 1850–1852) says that the values of the constants `c_K(j)` are "Not given here".
- *The period bound.* Headline 3 (line 9) bounds the top period "at every finite place". 3.10 (lines 2057–2061) proves this only for forms of the base tuple. For a tuple `ξ`, it covers only the places whose residue characteristic is not below `Q(ξ)`.

**Repair.**
- In both files, write "up to a nonzero constant (`c_K(j)` of 3.3 (iii))".
- In headline 3, add "for the base tuple (for a tuple `ξ`, at the places whose residue characteristic is not below `Q(ξ)`)".

## R02 (P2) — The statements whose routes are left open rest on [FormalProof] alone, which the README cites with no locator

**Why it matters.** Where a route stops, the reader and the implementer have only the source to go on. The References (line 2245) give [FormalProof] as "the reference of every target marked *NEW*". But no target names a module or declaration of that formalisation. Statements the README marks as not proved are therefore supported by nothing a reader can find.

**What I found.** The routes leave these open:
- 2.2a (d), the passage from `U(S^∨)` to `U(S)` (line 456);
- in 2.6:
  - `K(n)·E ⊂ E(N)` (line 910);
  - (a)(iii), marked "classical" (line 910);
  - `|σ(β)|² = N(𝔞)^{p+q}` (line 914);
  - the class-number bound for `f ≤ 5` (line 929);
- 3.1d, lines 1566 and 1577–1581:
  - (o), on which the definition of `Θ^{CM}_{L,L′}` itself rests ("The construction and (b) are definitions once (o) holds");
  - (a);
  - the bound of (c);
  - the eighth-power law in (f), on which (d), and through 3.2 API (c) the integrality of 3.6, depend;
- the 𝔭-integrality inputs of 3.2 API (c) (line 1713);
- the reading of the moved datum in 3.3 (i)–(ii) (line 1790), on which headline 2 rests.

**Repair.**
- Two of the 2.6 gaps close in a line each:
  - *`K(n)·E ⊂ E(N)`.* If `α ≡ 1 mod^× N𝒪_E`, then `N_{E/K}(α) ≡ 1 mod N𝒪_K`. So the norm carries the ray group of `E` mod `N` into that of `K` mod `n`, and Artin-map functoriality gives the inclusion.
  - *`|σ(β)|²`.* Write `ρ = σ|_E`. Since `E` is CM and abelian, `|ρτ̄(γ)| = |ρτ(γ)|`. Hence `|σ(∏_τ τ(γ)^pτ̄(γ)^q)|² = N_{E/ℚ}(γ)^{p+q}`, which equals `N(𝔞)^{h_E(p+q)}`.
- For the others, do one of three things:
  - name the declaration(s) of the formal proof that prove them (a declaration name is an exact locator in a Lean formalisation);
  - give a published theorem with its number and page;
  - complete the route.

## R03 (P2) — The Summary asserts that split ramification away from `d` makes `E/F` unramified, which is false

**Why it matters.** The opening paragraph (line 3) is where a reader learns the standing hypotheses. It omits the condition at `d` that Layer 2 needs.

**What I found.** Line 3 says "every prime other than `d` that ramifies in `E` splits in `K`, so `E/F` is unramified at every finite place".
- *Counterexample.* Take `E = ℚ(ζ₇)` with `K = ℚ(√−7)` and `d = 7`. `E` is abelian, `7 ≡ 7 (mod 8)`, and no other prime ramifies, yet `ℚ(ζ₇)/ℚ(ζ₇)⁺` is ramified above `7`. The same happens for `E = K`.
- *What the layers say.* Layer 2 (line 240) assumes `SplitRamification d` with `σ_d ≠ c`. FrobeniusRestrictedRieszSums §0.3 (c) at its head says that, under split ramification, `E/F` is unramified exactly when `σ_d ≠ c`.
- The pull-request description repeats the sentence.

**Repair.** Write "…splits in `K`, and the inertia group at `d` has order `2` and does not contain complex conjugation, so `E/F` is unramified at every finite place".

## C01 — The route of 2.6 (b) bounds each Kummer step too generously to give (b)

The route (lines 914–920) applies `log rd(M) ≤ log rd(F) + log(n·[M:F])` "with `n = k`, to each step".
- *What that gives.* Each step of order `k` then costs `2 log k`, so `log rd(V) ≤ log rd_E + 2(ρ + 2)log h* + 2 log h_E`.
- *What (b) allows.* About half of that: `log rd_E + (ρ + 2)log h* + log h_E`.

The bound (b) is nonetheless true. Either of two routes gives it:
- *One application to `V/E`.* `V/E` is Galois and unramified outside `h*`, so `log rd(V) ≤ log rd_E + log h* + log[V:E]`. The extra `log h*` is absorbed by the `E(N)` term, because `log rd(E(N)) ≤ log rd_E + log N` exactly.
- *A sharper per-step bound.* For `F(y^{1/k})/F` with `ζ_k ∈ F` and `(y)` a `k`-th power, the relative different divides `k`.

Either would replace the sentence.

## C02 — FrobeniusRestrictedRieszSums §0.4 (iii) is cited for two equalities it does not state

The citations are in 2.1 (lines 302 and 312), the table of symbols (line 165) and the supplier contracts (line 2112). They credit §0.4 (iii) with `f_E = lcm(2^{n+2}, f_ψ)·q·d` and with `|A| = c(ψ)·2^n`, `c(ψ) | o`, for `n + 2 ≥ v₂(f_ψ)`.

At that roadmap's head, (iii) states something weaker:
- `f_E ≤ 2^{n+2}f_ψqd`;
- `1 ≤ c(ψ) ≤ o` for `n ≥ n₀(ψ)`.

Where the stronger facts come from:
- The equality for `f_E` (when `n ≥ 1`) is §0.4 API (c).
- The divisibility and the range follow from `|A| = 2^n·o/[ℚ_n ∩ ℚ(ψ) : ℚ]`.

Cite API (c), and add that one line.

## C03 — "Charts" are used but defined nowhere in this roadmap

The term appears in the Check of 2.9c (lines 1280–1285), in 3.2 (lines 1656–1658) and in 3.5 (lines 1826–1828 and 1851–1852). The Check also asserts a property of "chart levels" that nothing here proves. Charts are SeesawForThetaChains §6.7's objects. Either define them here, or say in these passages that they are that roadmap's (as commentary, not as a supplier).

## C04 — In 2.4 (a), `Φ` is not defined for a general CM extension

2.4 (a) is stated for any CM extension `E/F`, and headline 1 of the Summary repeats it. But it reads its types at "`τ ∈ Φ`", and the Conventions define `Φ` only for the host, as `Gal(E/K)`. Say "`Φ` a CM type of `E`". Replacing `τ` by `cτ` only changes the sign of `m_τ`, so any CM type works.

## C05 — The classical attributions carry no theorem or page

The KNOWN lines name classical sources, for example at lines 770, 1400, 1455, 1512 and 1792:
- Weil 1955;
- Gross 1999;
- Kashiwara–Vergne 1978;
- Howe 1989;
- Mumford, the theorem of the cube;
- Shimura.

The References (lines 2247–2249) list them without locators. The routes stand on supplier sections, so these are credits; they would still read better with a theorem or section number and a page.

## C06 — The description's generated `depends-on` and `merge-order` blocks omit ExplicitNumberFields

2.6 and the supplier contracts now consume ExplicitNumberFields §5.3 (`classNumber_le_bordelles`). That roadmap is still an open pull request, but neither block lists it. Regenerate the blocks so that it is listed among the suppliers that merge first.

## N01 — The subsections of 2.3 appear in the order 2.3b, 2.3c, 2.3a, and clause (f) of 2.3's lemma lives in 2.3b

Lines 568, 604 and 636, and line 534. A reader following the numbers looks in the wrong place; renumbering or reordering would fix it.

## Questions for the author

- Headline 1 (2.4 (a)): the docstring of `Suggested.lean` says that CM types are missing at the pins. But Mathlib's `NumberField.InfinitePlace.embedding` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean, line 102) fixes one embedding per complex place, so the types could be indexed by places. Is the identification of the unit groups at the two places above a split place the only real obstacle? I found no map of adic completions along an extension at the pin, but I did not search exhaustively.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 2.1 lemma, construction | `ε₀ = 1/52`; `x = 32` | margins `x^{1.31ε}` (SizeW), `x^{5ε}` (SizeK); `A_max = 28/13` | `m⁵|A|x^ε = x^{9/2+8.6875ε}`; `|A|²x^{1/2−ε} = x^{9/2+15ε}`; `2 + 8/52 = 28/13`; `32^{4/3} = 101.6` | holds | C02 |
| 2.2 spaces, (f) | `m = 4, j = 0`; `ℚ(√−3,√−7)`; `ℚ(√−7,√−11)` | signature of `Y_0` is `(k+m/2−1, m/2)`; no `𝔟` for `ℚ(√−3,√−7)` | `(k+1, 2)`; `𝔇_{E/K}` is the self-conjugate prime above 3; for `ℚ(√−7,√−11)`, `𝔟` is the prime above `𝔭 | 11` | holds | — |
| 2.3a existence | generic; `μ_E = {±1}` | `w_j = b₁ + (j−½)h₀`; exactly one `s₁` | `min |e′_i − e_j| = h₀/2 ≥ 2b/ℓ* + t/2 + 3`; `τ₁(ζ_E)^{s₁}` meets each element of `μ_E` once | holds | — |
| 2.4 (a), (b) Checks | `ℚ(√−3,√−7)`, `x = √−7`; `o_δ = 6, ℓ = 3`; `E = K` | (★) fails; `δ(y)² = 1`; `χ` ramified at `d` | `η(𝔭₇) = 1` (`−3 ≡ 2²` mod 7), phases `i·i = −1`; prime-to-3 part is 2; `χ_K` nontrivial on `ℤ₇^×` | holds | C04 |
| 2.6 sizes | `|GL₂(ℤ/12)|`; `E(N)`; Bordellès at `n = 2f`; per-step route | `≤ 20736`; `log rd_E + log N`; `f·log rd + (2f−1)log(4f log rd) − log(2f−1)!` | `4608`; `N(𝔡) ≤ N^{2fh*}`; ExplicitNumberFields §5.3 matches; the per-step lemma costs `2 log k` | statement holds | C01, R02 |
| 2.7 exceptional sets | `𝔅(3,11)`, `𝔅(3,19)` | `{2,5,7,11,19}`, `{2,3,5,19,127}`, meeting in `{2,5,19}` | `10`, `120`, `1330 = 2·5·7·19`; `18`, `360`, `6858 = 2·3³·127` | holds | — |
| 2.8 rank window | general `T` | `1/2 ≤ ď^{all}Γ₀²/D* ≤ e`; `3/8 ≤ ď_uΓ₀²/D* ≤ e` | `(T/T*)^{fk} ∈ (1, e]`; `(1−T^{−k})^f ≥ 1/2`; `((T−2)/(T−1))^f ≥ 3/4` | holds | — |
| 2.9c test vector | parahoric `(r, n−r)`, `g` block-upper mod `p` | `ω̄(g,1)Φ^Q = c(det lower block)·Φ^Q` | `Φ^Q(xg) = c(det g₁)^{−1}Φ^Q(x)`; `c(det g)c(det g₁)^{−1} = c(det g₄)` | holds | C03 |
| 3.1a Check (i) | `E = K`, `ω = (1+√−d)/2` | `Q_A = N(x)`; `Im H_A = ±1`; product `−1` | `H_A(1, ω) = ω̄·2/√d`, `Im = −1`; `((9+d) − 4 − (1+d))/4 = 1` | holds | — |
| 3.1c constants | `d = 7, 11, 19, 43, 67, 163`; quasi-periods at `d = 7, 23, 31` | `√−d·s₂ = 1/4, 2/3, 2, 12, 38, 724`; `θ₀″(0) = ±2√−7/7` | absolute values `0.2500, 0.6667, 2.000, 12.00, 38.00, 724.0`; `|θ₀″(0)| = 0.75593`; `α(α−ᾱ)s₂ = Σ℘(P)` (d = 7: `−3.27048+1.23613i` both sides) | holds | — |
| 3.2 Check (ii) | `N_{j−1} = 2`, `N_j = 4` | `(λ − 1, (1 − w)²)` | `(ν, 0, 0) − (w−1)·1` gives the same; agrees with 2.3 (b) | holds | — |
| 3.3 step as lift | rank one; scaling; constant | `a_v = b_v = ½ − w`; `π^{−1}∂_w = π^{−1/2}|s_Λ|∂_z`; "explicit" | `|s_Λ|² = |δ_K|²√d/(2π) = area/π`; `c₀(j)` only shown to exist | identity holds; Summary overclaims | R01, R02 |
| 3.4 weights | Check | `s_div − s♯ = (t+1)/2` | `(w − N_{j−1}/2) − (w − N_j/2) = (t+1)/2` | holds | — |
| 3.5 (d) twisting | unramified `ξ` | `col_ξ = (m^{(m)})^s∘col∘(m^{(0)})^{−s}` | `ρ^ξ/ρ¹ = ξ̃^{−s}`, `ρ′^ξ/ρ′¹ = ξ̃^{s}`; intermediate factors cancel | holds | — |
| 3.6 denominators | `Γ = {±1}`; prime bound | `K_j1 = 1/2`; `D_Γ | minkowskiBound(2fN_m)` | `1/2`; HermitianFormsAndLattices §5.2 (c) at rank `2fN_j`; primes of `M(n)` are `≤ n + 1 < T(u)` | holds | — |
| 3.9 branching | `N = 6`, `λ = (1⁵,0)`, `σ = (1⁵)`; `GL₂ ↓ GL₁` | `c_Br = −120`, which exceeds 64 but not `7⁵`; `(−1)^{D₀}D₀!` | `∏_{j=0}^{4}(j−5) = −120`; `2⁶ = 64`; `7⁵ = 16807`; `R₀ ∖ {σ₀} = [Λ₁, σ₀−1]` | holds | — |
| H1 (2.4 (a)) | `x ∈ F^×`, `x = −1` | criterion (★) | `E^× ∩ 𝔸_F^×U = P_{E/F}`; on `F^×`, (★) is the product formula; at `−1` it reads `(−1)^f = 1` | holds | C04 |
| H2 (3.3, 3.4) | weights, constant | weight map; "explicit" constant | ThetaLifts §2.5 (a): `a_v = (N_j − 2w_j)/2 = −s♯`; the constant is not explicit | overclaim | R01 |
| H3 (3.6, 3.10) | twisted `ξ` | "at every finite place" | 3.10 covers the base tuple only; `⟨xy, xy⟩ = 1/2` (Check) | overclaim | R01 |
| H4 (3.8) | `T = 3`, one orbit | rank `d*_u((T^k−1)(T−2)/(T−1))^f`; slope `−f·log(T−1)/(T−2)` | rank 1; squared covolume 2; `μ = −log 2`; `(T^k−1)/(T−1) ∈ ℤ` | holds | — |
| Summary host sentence | `E = ℚ(ζ₇)`, `K = ℚ(√−7)` | "so `E/F` is unramified" | only 7 ramifies, and `E/E⁺` is ramified above 7 | false | R03 |
| Conventions `log Ω_K` | `d = 7, 11, 19` | mean of `log(area/π) + (1/6)log|Δ|` equals `γ + log(2π/√d) − L′/L(1,χ)` | `1.426502` against `1.426502` at `d = 7`; differences `≤ 5·10⁻¹²` | holds | — |
| 2.2a Check (ii) | ranks 2, 3; `m_S = −20`, `m_T = −21` | `a = b = −9`; descent with parameter `(9/2, −7/2)` | `(3 − 21)/2 = −9`; `σ = (4,−3,−9) = (13,6,0) − 9`; `(5, −3) − ½` | holds | — |

- **Source locators checked.** None could be checked against a text. No target carries a locator into a readable text; [Announcement] was read in full, 180 lines.
- **Library declarations opened at the pins.**
  - Mathlib `NumberField.InfinitePlace.embedding` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:102) and the file Mathlib/NumberTheory/NumberField/CMField.lean.
  - Tau Ceti `HeckeCharacter` (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70) and `rayClassField` (TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean).
  - Neither library has a CM type or `minkowskiBound`.
- **Cross-roadmap citations resolved.** About 70 anchors, all present.
  - On main: ClassFieldTheory §13.1 and its 7 names; NumberFieldArithmetic 4.2, 5.9, 6.3, 6.4; GlobalNumberFields Layers 2 and 8–10; Chebotarev Layer 10; ShimuraVarieties §5.9; ImaginaryQuadraticClassNumber H3.1; GL2AutomorphicRepresentationsAndTransfer R16.1.8; FiniteGroupInvariants §10.2; AbelianSchemesAndArithmeticModuli A1.3a, A1.5, A4.7a, A5.3, A5.4; and others.
  - At the heads of 12 sibling roadmaps, and of ExplicitNumberFields, PotentialAutomorphyDworkMotivesPartII and GanGrossPrasadUnitaryGroups.
  - The downstream ids.
- **Ownership.** Searched for the 2.4 (a) criterion as an object. Of the near matches, BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a, GL2AutomorphicRepresentationsAndTransfer R16.1.8 and PotentialAutomorphyDworkMotivesPartII §9.14 all differ as the README states.
- **Automatic checks.** All passed. Dependency check: `depcheck: 171 roadmaps, 1997 edges, 0 problem(s)`. Changes outside the folder are only the family index.
- **Elaboration.** `lake env lean` of `Suggested.lean` exits 0 with no messages. There are no declarations, so no `#check` comparison or one-tactic probe applies.
- **Numerical work.** The 3.1c constants, the quasi-period identity, the Chowla–Selberg form of `log Ω_K` and the 2.7 exceptional sets were all recomputed in double precision.

Overlap check: read RowTowerAndRallisIdentities, GluedTargetAndDivisionInequality, ThetaChainsAndFrobeniusPrimeSums, CongruenceModulesOfThetaLifts, LocalGainOfThetaChains, SeesawForThetaChains (open) and HilbertModularVarietiesAndShimuraCurves (main). Each of the open ones names this roadmap as the owner of the chain data, the step operators, the chain lift, the source lattices and the top period. SeesawForThetaChains §6.10 consumes `P̃` and `res` of 3.9. Nothing is shared.

Source independence: 6 passages compared with 1 source ([Announcement], the only cited text legally readable here); no shared wording. Largest share: [FormalProof], 20 of 36 attributions (every NEW target, with no locator). The contents of [FormalProof] are not readable (kernel export only), so the arrangement was not compared.

Research link: the chain of theta lifts of 2.2–3.10 is the construction on which the announced formal proof of the Riemann hypothesis for Dirichlet L-functions rests (Alpöge, 2026; [Announcement] describes chaining theta lifts of length `√X`). Its inputs are the theta correspondence (Howe 1989; Kashiwara–Vergne 1978) and Gross's algebraic modular forms (1999). This rests on the README's References and on [Announcement].

## Not verifiable

- [FormalProof]: the operator holds it only as a Lean kernel export, with no source text or docstrings, and the README gives no locator into it. None of the 15 sampled sections could be checked against it, so each was checked by computation instead. I did not open the GitHub repository the README links.
- The classical works (Weil 1955, Gross 1999, Kashiwara–Vergne 1978, Howe 1989, Mumford, Shimura) carry no locators and were not opened.

## Source issues

- none

## For the human reviewers

- Scope: the 20 targets marked NEW rest only on [FormalProof] (README line 2245). It is a Lean formalisation by one author, announced 2026-11-20, unrefereed, with no accompanying paper; [Announcement] says that a write-up is to follow.
- Not tested: [FormalProof], the source with the largest share, is readable here only as a kernel export. Its wording and its arrangement were not compared with the README.
- Licence: the licence of [FormalProof] is not established. The README links a GitHub repository; [Announcement]'s footnote points to archives on the author's site.
