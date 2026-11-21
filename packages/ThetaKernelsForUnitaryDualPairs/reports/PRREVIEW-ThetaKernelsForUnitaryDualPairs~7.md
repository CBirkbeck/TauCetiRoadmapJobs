# Review of ThetaKernelsForUnitaryDualPairs (pull request #2907 at ac490de)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaKernelsForUnitaryDualPairs/`
**Verdict:** accepted

**Summary.** Accepted: the recomputation of every formula, Check and worked example I could instantiate (the Siegel-parabolic and split-place laws, the Fock and Casimir values, the cone laws and Tate factors, the unramified and tame doubling sums, the constants of the Siegel–Weil and inner product formulas) found no false statement, the readable source locators hold, and every supplier citation resolves with no upward edge and no second owner. There are three small corrections, all about what a cited source or declaration states (the formal-proof declaration cited for the unipotent formula of 3.3b, the sources credited for the inert case of 3.21a, one locator into GQT), and seven format notes; none blocks. Five points are left to the human reviewers: the unpublished formal proof as the family's organising source, its licence, the targets that cite no publication, the naming of an extension of MetaplecticAutomorphicForms, and the wording not being tested against the formal proof.

## C01 — The declaration cited in 3.3b for "the Levi and unipotent formulas" states a Levi law only

A reader who opens the formal proof to see the unipotent formula `ω(n(B))φ(x) = ψ(tr(B T_x))φ(x)` finds nothing of that shape at the cited place (route of 3.3b, lines 69–71: "The formal proof states the Levi and unipotent formulas in … (`GlobalTheory.WeilM.SiegelRule`)"). I read that declaration at the commit the References give: `SiegelRule` is a proposition about linear functionals `l` that are invariant under the Heisenberg operators `d.rho ψ (z * Cyᵀ)`; for `p` in the unitary group and `t ∈ GL_ν(E)` with `p·Cy = Cy·t` it asserts `l(om p φ) = χ(det t)·|N(det t)|^{card α/2}·l(φ)`. That is the Levi law in the form "the evaluation along the Lagrangian transforms by `χ_V(det(h|_Y))` times a power of the modulus" (the form 5.7c (L) uses); it contains no operator formula for `m(A)` and no statement about `n(B)`.

The smallest change: say that the formal proof states the Levi law, as a law for functionals invariant under the Heisenberg translations along the isotropic subspace, at that declaration, and either give the declaration that carries the unipotent formula or say that the unipotent formula rests on the route (MetaplecticAutomorphicForms §2.5 and §1.3), as the same paragraph already says for the real places.

## C02 — In 3.21a the inert case of (ii)–(iv) is said to "rest on the sources cited below", and those sources are not said to treat unitary pairs

The inert case of (iii) is half of the roadmap's first headline theorem, so a reader wants to know where it is proved. The paragraph on the form of the formal proof (lines 189–190) says that the formal proof has no Hecke map and no Satake parameter there and that "(ii)–(iv) there rest on the sources cited below". The citation (lines 221–223) is Rallis 1982 and Howe 1979 without theorem or page, and Mínguez08 "for the split case"; two lines above the README itself describes Rallis's parameters as those "for orthogonal–symplectic pairs" (line 187, and MetaplecticAutomorphicForms §3.21 on main states them for those pairs, from another source). So nothing cited is said to state the unitary inert formula, while 3.9a, 5.6a and 6.13a each mark the same situation with "there for symplectic–orthogonal Witt towers" or "there for orthogonal–symplectic pairs".

The statement itself I could not fault: for `n = 0` it gives the parameter of `χ̃_V ∘ det`, in equal rank it gives `φ_π ⊗ χ_Vχ_W⁻¹` as MetaplecticAutomorphicForms §3.18 does with the roles exchanged, and on the two sides of a complementary datum it gives the same multiset (3.47a). The smallest change is to the attribution: add "there for orthogonal–symplectic pairs" to the citation of Rallis 1982 and say that for unitary pairs at an inert place (ii)–(iii) are proved by the route (the same computation), or cite a statement for unitary groups with its theorem number.

## C03 — GQT §1.7 is cited for the credit of the Siegel–Weil formula in the convergent range, and that passage credits the inner product formula

In the route of 6.4a (lines 1776–1777), and again in the References (lines 2197 and 2220), "GQT credits Ichino 2007 with the Siegel–Weil formula in the convergent range (GQT §1.7, p. 3, and the proof of Proposition 11.1 (ii), p. 53)". At GQT lines 137–142 (§1.7, p. 3) the list of cases with its references, Ichino 2007 among four, is a list of cases of the Rallis inner product formula; the Siegel–Weil formula in the convergent case is credited at GQT line 2605 (proof of Proposition 11.1 (ii), p. 53) and, for anisotropic `H`, at GQT lines 1628–1630 (after Theorem 7.1, p. 33). Keep the second locator for 6.4a and move §1.7 to 6.13a, where it is the credit for the inner product formula in Weil's convergent range.

## N01 — Headline (3) of the Summary integrates over `[U(V)]` first in `g` and then in `h`

Line 5: `∫_{[U(V)]} θ(g, h; φ) dg` "locally uniformly in `h`", then `τ(U(V))⁻¹ ∫_{[U(V)]} θ(g, h; φ) dh` with `E(g, s₀, Φ_φ)`. One letter for the variable of `U(V)` in both halves would do.

## N02 — `p`, `q` are used before they are introduced, and `a` is used for two things

In the first Check of 3.47b (lines 905–908) "`p = q = 0`" precedes the introduction of `p`, `q` (signatures `(a − p, p)`, `(q, a′ − q)`, line 922), and "`a = (N + κ)/2 ≤ 0`" is the constant of 3.46 (iii) while `a` is `dim V`; 5.7d (d) (lines 1650–1652) uses "`p = 0`", "`q = 0`" with no definition in that target.

## N03 — "Propositions 4.1, 4.3–4.5" of Kudla96 includes a lemma

Lines 139 and 2199: Kudla96 line 1934 is Lemma 4.4. "Propositions 4.1, 4.3 and 4.5, with Lemma 4.4" is exact.

## N04 — The Conventions say that the family "follows" the formal proof

Line 21, "the formal proof that the family follows". The layers are not arranged after that source, so nothing is wrong with the plan; "the formal proof whose statements the family records" would say what the paragraphs do without the word.

## N05 — 3.9a (iii) pairs `⟨π(g)v, v⟩` for an admissible `π` with no Hermitian form named

Lines 115–116: `π` is irreducible admissible, not assumed unitary. The identity holds for any positive definite Hermitian form on the space of `π` (on the support `g` fixes `v`); say so, or state it with a vector of the contragredient.

## N06 — The Summary and the docstring state local matching at split places without "characteristic zero"

A local complementary datum is defined over a local field of characteristic zero (3.47, line 548); headline (2) of the Summary and the second bullet of the docstring of `Suggested.lean` say "`F` nonarchimedean" only. Either add the hypothesis there or drop it in 3.47 if the route does not use it.

## N07 — The Corollary of 6.4a says "with trivial splitting character" without saying which

Line 1797: by the route (the term of `X` is `φ(h⁻¹X)` with no character of `det h`) it is the character governing `U(V)`; the one governing `U(W_n)` restricts to `η^m` and is not trivial for odd `m`.

## Questions for the author

- Is there a published statement of the unramified correspondence for unitary pairs at an inert place with the Satake relation of 3.21a (iii), for general `n ≤ d` and splitting characters? I could not open Rallis 1982 or Howe 1979 (neither is among the texts recorded for this roadmap), so C02 rests on the README's own description of them.
- Do the remaining formal-proof locators name declarations that say what the paragraphs *The form of the formal proof* report? I read three of the 78 at the commit (`GlobalTheory.WeilM.SiegelRule`, `GlobalTheory.ThK.WeilConv`, `GlobalTheory.TwistedZeta.local_zeta_twisted`); the second and third agree with 5.7a and 6.13c, the first gave C01. The others were not opened.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.3b Levi and unipotent formulas, dictionary | `m(A)`, `n(B)` on the basis; `k = 1`; `A` unitary at a real place; odd `n` | `⟨n y_i, n y_j⟩ = −B_ji + conj B_ij`; `det m(A) = det Ā/det A`; `ψ(−½·(−2b⟨x,x⟩)) = ψ(b⟨x,x⟩)`; `χ_V(−1) = −1` | consistent; `χ_V(x̄) = χ_V(x)⁻¹` gives the column form | C01 (attribution only) |
| 3.9a persistence, stable range, bump vectors | `n = 0`; `W` anisotropic of dimension 2, `n = 1`; split case `d ≥ n` | full-rank `x₀` has trivial stabiliser in `GL_n`; `r = 0` fails, `r = 1` holds; Kudla96 lines 1755, 1923, 1970 | holds; source is for O–Sp, as said | N03, N05 |
| 3.21a unramified correspondence (headline 1) | `n = 0`; `n = d = 1` split; equal rank; both sides of a complementary datum | `BC(χ̃_V∘det) = χ_V∘det`, segment `χ_V(ϖ)q^{(d−1)/2−i}`; `(t, t⁻¹)` acts by `(χ_W/χ_V)(t)` so `π′ = πχ_V/χ_W`; both sides `(α q^{(a−1)/2−i}) ∪ (β q^{(a′−1)/2−j})` | consistent with §3.18 of MetaplecticAutomorphicForms | C02 (attribution) |
| 3.45 Fock model | `N = 1`; `T = δ_0`, `P = z²`; composition `U_wU_{w′}` | `dω(J)` on Gaussian: `−(1/4π)(4π²u² − 2π) + πu² = ½`, eigenvalue `−i/2`; `2π⁻²·2^{1/4}(−π/2) = −2^{1/4}/π`; cocycle `e^{−πi Im H}` | all agree | none |
| 3.46 compact pairs | `n = 0`; `n = d = 1`, both signs; arithmetic form | `det^{εb} = det^{m_V/2}`; `t^{−k−(1−m_W)/2}`; `2λ′_k = 2λ_k − d − m_W + n + m_V`; `B(x, ix) = −2 Im δ·h(x,x)` | agree | none |
| 3.46a discrete series | `U(1) × U(1,1)`, `t = 1`, `k ≷ 0`; `λ = (1 \| −1)` case (+); Casimir relation for `(n,t) = (1,1), (1,2)` | weights `i − j`, `(i+½ \| −j−½)`; `Λ((k\|0)) = (k+½ \| −½)`; `λ′ = (1,0,−1)`, vacuum `(3/2 \| −3/2)`; `k² − ½` both sides; `½ − 2 = −3/2` | agree; Ichino20 lines 346–347, 1283, 1319 support Remark and (d) | none |
| 3.47 split matching (headline 2) | laws of `P`, `P′` on `p = [[A,B],[0,D]]`; exponents; `ν = 1`; wrong character `β` in `ω′` | both `α(det A)\|det A\|^{a′/2}β(det D)\|det D\|^{−a/2}`; `a − 1 − N/2 = ε₀ − 1`; nested or different cosets; central characters differ by `ν^{−N}` | agree; Zelevinsky80 line 775 | none |
| 3.47a inert matching | `N` even; evaluation at `0`; parameters via 3.21a | `c = α(ϖ)`, segment `β(ϖ)q^{(a′−1)/2−j}` for `Θ`; `c = β(ϖ)`, segment `α(ϖ)q^{(a−1)/2−i}` for `Θ′` | same multiset | none |
| 3.47b real matching | two readings of `La`; `λ + 2ρ(𝔲∩𝔭)`; `a = 3, a′ = 1, κ = −6` and `κ = −4`; `β₁` shift | `L₊ = (−κ − (P_W − Q_W))/2` from both; `(−3,−3) ⊗ (1,−2)`; `Ω = 26, 38`; `12, 22`; shift `N + 2(f_1 − e_{P_W}) = N + (−κ + P + P′ − Q − Q′)` | agree; VZ84 lines 274, 805 | N02 |
| 3.47c three lemmas | Lemma 1 with `n = N`; `r ↦ r⁻¹` in Lemma 3 | `∫φ(zh)ξ⁻¹(det z)d^×z = ξ(det h)∫…`; sequences differ by `r^c` | consistent | none |
| 4.4a global Weil representation | `V = 0`; role of (4), (5); `H ⊂ 𝔸_E^1` | `χ̃_V(det)` trivial on rational points by Hilbert 90; an element of `E_v^1`, `v` inert, is not in `H` | holds (a second non-split place exists) | none |
| 5.6a theta integrals of cusp forms | `V` anisotropic; `U(1) × U(1,1)` | step (3) empty; `𝒫(1,0;0,0)` has weight `0 ≠ k`; Rallis84a line 435 | consistent | none |
| 5.7a Weil's criterion (headline 3) | rank one of `U(V)`; split `W`; formal form | modulus `\|l\|^{m−1}` against growth `\|l\|^{(dim W)/2}`; `m − r > n = d(n)`; formal: `d + 2min(r,s) < 2n ∨ min(r,s) = 0` | agree | none |
| 5.7b (ii), (iii) | unitary `χ_W ≠ 1` on `diag(1_k, g₂)`; signs for `m_W ≷ 0` | `χ\|·\|^s` trivial forces `s = 0`, `χ = 1`; vacuum weights `(s′ − r′ + m_W)/2`, `(r′ − s′ + m_W)/2`; both exclusions follow from `min(r′,s′) < min(r,s)` | holds | none |
| 5.7c cones | laws by substitution; unfolding exponent; complementary datum; Tate | `(χ_X(μ^c)⁻¹)(t)\|t\|^{n/2−z}`, `(χ_Xμ^c)(t)\|t\|^{n/2−1+z}`; unfolded exponent `(d−2)/2 + (z₀ − z) + (1 − n) = −z`; `z₀ = ε₀`, `1 − z₀ = ε₀ + 1`; `γ(1 − z, μ⁻¹, ψ)` | agree | none |
| 5.7d multiplicity bounds | `U(1)`-weights; `ν = 1`, `ε₀ = 2`; end of segment | `s + s′ = m_β`, `s + s′ − L₊ − L₋ = m_α`; `L(3, 1) = (1 − q^{−3})^{−2}`; `a/2 − (N−1)/2 = −(a′−1)/2` | agree | N02 |
| 5.7e cone lemma | condition of (B) | `L(s, μ^{±1}) = Γ_ℂ(s + \|m\|/2)`; `2(z−1) < \|m\|` gives `1 − z + \|m\|/2 > 0`; `2ε₀ < \|κ\|` | holds | none |
| 6.4a Siegel–Weil (headline 3) | `r = 0`; `m = 2, r = 1, n = 1`; Corollary range | constant `c = 1` for `s₀ > 0`, `2` for `s₀ ≤ 0` (GQT line 1619); `m − r = 1 = d(1)`; `n ≤ m − 1` for the mean value | agree | C03, N07 |
| 6.11 unramified doubling | `n = 1` inert and split; `n = 2` trivial; comparison of conventions | split: `1/(1−αX₁) + α⁻¹X₂/(1−α⁻¹X₂) = (1−X₁X₂)/((1−αX₁)(1−α⁻¹X₂))`; `y = q^{n−1}X = χ(ϖ)Q^{−(s+½)}`; `1 − (−q)^jX`; `Re s > 0` | agrees with the two suppliers | none |
| 6.13a Rallis formula (headline 4) | `n = 1`; `α_w = χ_w(ϖ) = i`; constant | `s₀ + ½ = m/2`; denominators `(1 − X)²`, `(1 − X)²`, `(1 + X)²`; `C = τ/c = [E:F]/c` | agree; GQT lines 2588–2617, Rallis84b line 345 | none |
| 6.13b integrability | (iv) at `s = −n/2`; (v); `d^S` | `H^{s−s₀}·H^{(n+t)/2} = H^{s+n/2} ≤ 1`; `(hK₁)⁻¹hK₁ = K₁`; `η^{n+t+i}` matches 6.11 (b) with `χ\|_F = η^{n+t}` | holds | none |
| 6.13c tame twist | `N = 0`; `r = 0`; `N = 1`; `r = N = 1` volume | exponent `r − (r+b)/2 − (s − t/2) = −(N/2 + s)`; sum `(1 − q^{−(2s+1)})/((1−αq^{−(s+½)})(1−α⁻¹q^{−(s+½)}))`; index `q^{\|e\|}`; `c(ϖ^e)` exponent `−(b/2)\|e\|` | agree; formal statement has `N = l·t` | none |

- Source locators checked against the text: 21 passages in 11 texts (GanIchino lines 473–491, 1523; Kudla96 lines 1735–1970; Mínguez08 lines 88, 211; Zelevinsky80 line 775; Ichino20 lines 26–27, 52–53, 287–312, 346–347, 1283, 1319; LiLiu21 line 1411; VZ84 lines 274, 805; Rallis84a line 435; Rallis84b line 345; GQT lines 137–142, 338, 391, 581, 1619–1630, 2588–2621; Announcement line 53).
- Formal-proof declarations opened at the commit of the References: 3 of 78 (`SiegelRule`, `WeilConv`, `local_zeta_twisted`).
- Library declarations opened at the pin: `MeasureTheory.Measure.ext_of_charFun` (Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257), `Matrix.unitaryGroup` (Mathlib/LinearAlgebra/UnitaryGroup.lean:105), `Representation.Coinvariants` (Mathlib/RepresentationTheory/Coinvariants.lean:57), `TauCeti.HeisenbergGroup` (TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58), `TauCeti.hermiteFunction` (TauCeti/Analysis/SpecialFunctions/Hermite/Function/Basic.lean:36); neither library has a metaplectic cover, a Weil representation or a bosonic Fock model.
- Cross-roadmap citations resolved: every cited section of the 19 roadmaps named (45 sections of MetaplecticAutomorphicForms on main among them; LocalFactorsOfTwistsAndTypes §§3.3, 3.4, 4.1, TensorInductionAndFiniteGroupInputs §7.1 and HermitianFormsAndLattices §§2.1, 4.2, 6.5 at their open heads); the statements used agree with what the suppliers state.
- Dependency check: `depcheck: 170 roadmaps, 1996 edges, 0 problem(s)`; no upward or cyclic edge.
- Automatic checks: all passed at this head. `Suggested.lean` elaborates with no message; it declares nothing, so there is no signature to compare and no one-tactic probe to run. Its docstring names the four headline theorems and the carriers each lacks.
- Pull request text: the description agrees with the head (a new roadmap; the three points on 3.46a, 6.13c and 6.11; `Suggested.lean` declares nothing; the three open suppliers).
- Overlap check: read ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SeesawForThetaChains, LocalFactorsOfTwistsAndTypes, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory; the unramified unitary doubling value is owned by MetaplecticAutomorphicForms §6.11 and AutomorphicLFunctionsAndLocalFactorsPartII §2.3, the doubling series by LocalFactorsOfTwistsAndTypes §3.3, and 6.11 here cites all three and adds (a), the two-variable identity and the regions; the global theta integrals of complementary triples are owned by ThetaLiftsForDefiniteUnitaryGroups Layer 6, which cites 5.7b–5.7d here; nothing else shared.

Source independence: 21 passages compared with 11 sources, none shared beyond formulas and statements of a dozen words; largest share FormalProof, 78 of about 127 locators; contents compared with FormalProof through the directory names of its locators and with GQT (§§2, 3, 7, 11 against Layers 3–6): independent. The text of FormalProof was read at three declarations only.

Research link: The targets are the local and global theta correspondence for unitary dual pairs: Kudla's persistence (1996), J.-S. Li's and Ichino's lifts of discrete series (1990, 2020), the Siegel–Weil formula of Weil (1965) and Ichino (2007), and the Rallis inner product formula as in Gan–Qiu–Takeda; README References, GQT §1.7 and Ichino20 §1.

## Not verifiable

- Weil65 §§V–VI (5.7a, 6.4a): recorded as uncertified; cited by locator only.
- Ichino 2007 and 2004, Yamana 2014, Piatetski-Shapiro–Rallis 1987, Rallis 1987, Godement–Jacquet 1972, Kashiwara–Vergne 1978, Paul 1998, Li 1989, Kudla 1994: recorded as uncertified; cited by name.
- Rallis 1982, Howe 1979 and 1989, Harris–Kudla–Sweet 1996 §1, Li 1990 and 1992, Kudla–Rallis 1994, Bargmann 1961, Tate's thesis: cited by name, not among the texts recorded for this roadmap.
- 75 of the 78 formal-proof locators: not opened.

## Source issues

- none

## For the human reviewers

- Scope: the family records an unpublished formal proof announced on 20 November 2026 (Announcement, FormalProof); 78 of about 127 locators of this README point into it.
- Scope: 3.47c, 5.7b, 6.13c and the Fock-module clauses of 3.46a state that no publication is cited and that the route is the proof (lines 961, 1301, 2085, 523).
- Licence: the licence of the FormalProof repository was not read; the README reproduces its file paths and declaration names, no text. Announcement line 53 gives the source as an archive on the author's page, the References a GitHub repository.
- Scope: the roadmap extends MetaplecticAutomorphicForms and continues its section numbers (3.45–3.47c after §3.44; 3.3b and 6.11 extend the sections of those numbers) under another title; MetaplecticAutomorphicFormsPartII is a different open roadmap.
- Not tested: FormalProof has the largest share of the locators and its text was read at three declarations only; wording and arrangement were not compared with it beyond those.
