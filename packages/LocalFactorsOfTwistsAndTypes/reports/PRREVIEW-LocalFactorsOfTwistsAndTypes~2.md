# Review of LocalFactorsOfTwistsAndTypes (pull request #2889 at 3cac20e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** needs changes

**Summary.** Needs changes. The main problem is in the segment rule of 4.2 and of property 4 in 6.5. It pairs centred segments with the supplier's uncentred `Sp(b)`, and that contradicts the determinant and central-character properties listed beside it. As written, therefore, no family satisfies the definition of a local Langlands correspondence in ranks ≥ 2, and 4.2 lists a property that `rec` does not have. Two further findings: the GL_n case of the Satake bound can be stated at the pins but is missing from `Suggested.lean`, and 6.2 claims the multiplicativity of pair `γ`-factors that EndoscopicTransferAndUnitaryTraceComparison §10.29 on main already states for p-adic fields. There are also six small corrections and two format notes. Two questions are left for the human reviewers: where some targets come from, and the sources that could not be read.

## R01 (P1) — The segment rule of 4.2 and of property 4 in 6.5 contradicts the central-character and determinant properties, so no family satisfies the definition of 6.5 in ranks ≥ 2

As written, the class of local Langlands correspondences in ranks `≤ n₀` is empty for every `n₀ ≥ 2`. So the uniqueness statement is vacuous, the statement that the transported classical correspondence is one is false, and 4.2 lists a property that `rec` does not have. BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.29a consumes exactly this definition.

The README never redefines `Sp(b)`, so by the Conventions (line 13) it is the special pair of ArithmeticGaloisRepresentations §2.4. That roadmap takes it from SmoothRepresentationsOfLocalGroups §SR.5.2: `r(w)e_i = ω(w)^i e_i` with `ω(w) = q^{deg w}`, and SR states `det Sp(2) = ω`. Take `b = 2` and `ρ` the trivial character in property 4 (lines 543–544). The centred segment is `[ν^{−1/2}, ν^{1/2}]`, and its `L(Δ)` is the Steinberg representation (SR's own Check under *segment-representations*). So property 4 forces `r_2(St) = Sp(2)` and `det r_2(St) = ω`, while property 3 forces `det r_2(St) = r_1(ω_St) = 1`. The same computation applies to 4.2 (line 347): `rec_1(det Sp(2)) = |·|^{−1}`, as SR's Check under *classical-llc-normalization* confirms (rec makes a scalar act by `det r(w)`), whereas the centred rule sends `Sp(2)` to `St`, whose central character is trivial. The README credits the centring to EH, but EH has none. Its `Sp_{ρ,d}` (Definition 4.1.4) has `W_E` acting on the i-th piece by `|·|^i ρ`, and its segments (§4.3) start at `π`. EndoscopicTransferAndUnitaryTraceComparison §10.23 on main pairs a segment starting at `ρν^a` with `ω^a ⊗ Sp(ℓ)`, and calls `ω^{(1−ℓ)/2}Sp(ℓ)` the normalised Steinberg block.

There are two smallest repairs. One keeps the centred segments and makes `Sp(b)` in 4.2 and 6.5 the centred block `ω^{(1−b)/2} ⊗ Sp(b)`, stated once in the Conventions. The other keeps the supplier's `Sp(b)` and uses `[ρ_i, …, ρ_iν^{b_i−1}]` in 6.5 (geometric normalisation) and `[rec(ρ_i)ν^{1−n_i}, …, rec(ρ_i)]` in 4.2 (arithmetic). In either case, replace "centred as in [EH] §4.2" by the convention chosen. A Check would pin the convention: `r_2(St)` has trivial determinant, so it is `ω^{−1/2} ⊗ Sp(2)`, not `Sp(2)`.

## R02 (P2) — The GL_n case of the Satake bound (headline (4), 3.4 (i)) is statable at the pins, but `Suggested.lean` states nothing and says nothing is statable

The acceptance test leaves out a headline it could carry. The reason the docstring gives (lines 7–8 and 43–51: no spherical Hecke algebra, no Satake parameters) does not hold for `GL_n`.

At the pin, Mathlib has the Hecke coset ring `HeckeRing Δ H Z` and `IsHeckeTriple` (`Mathlib/NumberTheory/HeckeRing/Defs.lean`, lines 75 and 189). Tau Ceti makes `HeckeRing` a ring (`TauCeti/NumberTheory/HeckeRing/Associativity.lean`, line 484) and has `HeckeCoset.degree` (`TauCeti/NumberTheory/HeckeRing/Basic.lean`, line 902). I elaborated a statement of 3.4 (i) against the pinned libraries, with four short definitions:
- `GL_n(𝒪_K)` as the range of `Matrix.GeneralLinearGroup.map`;
- the operators `T_r` of `diag(ϖ, …, ϖ, 1, …, 1)`;
- the residue cardinality `Q`;
- boundedness of `g ↦ θ([K₀gK₀]) / deg(K₀gK₀)`.

The hypotheses are a ring homomorphism `θ` from `HeckeRing ⊤ GL_n(𝒪_K) ℤ` to `ℂ` with bounded spherical function, and `α` with `θ(T_r) = Q^{r(n−r)/2} e_r(α)` for all `r ≤ n` (the normalisation of SR *gln-generators*). The conclusion is `Q^{−(n−1)/2} ≤ ‖α_i‖ ≤ Q^{(n−1)/2}`. `IsHeckeTriple ⊤ K₀ K₀` enters as an instance hypothesis, which holds for every compact open `K₀`. The statement elaborates under `import Mathlib` and the Tau Ceti Hecke-ring module, with `sorry` as the only warning. The docstring also says that Mathlib has no Hecke algebra of a compact open subgroup, and it does not mention Tau Ceti's Hecke ring.

The fix is to state the GL_n case in `Suggested.lean` with those definitions, or with the eigencharacter of a unitary representation if preferred. The docstring would keep the unitary-group case and 7.2 (iii) as not statable, and its two sentences above would be corrected. The description's sentence "no headline is statable" changes with it.

## R03 (P2) — 6.2 claims the multiplicativity of pair `γ`-factors that EndoscopicTransferAndUnitaryTraceComparison §10.29 on main already owns for p-adic fields

Over p-adic `F`, two roadmaps now own one statement. The README neither cites nor mentions the owner on main: Scope and ownership (line 718) lists 6.2 as owned outright.

That roadmap's Layer 10 fixes `F/ℚ_p`, and its §10.29 states the following as targets of its own:
- for irreducible `π = L(δ₁, …, δ_t)` and `π′`, every pair `L`, `γ` and `ε` factor is the product over the pairs of blocks;
- `γ(s, St_a(ρ) × St_b(ρ′), ψ)` is the product of the factors `γ(s, ν^{i+j−2}ρ × ρ′, ψ)`.

For generic `τ` this is exactly the last sentence of 6.2. The first sentence follows too: the generic subquotient of `τ₁ × ⋯ × τ_r` has the union of their supercuspidal supports, so both sides expand to the same product over supercuspidal pairs. A roadmap on main comes before every open one in the merge order.

The fix is to cite EndoscopicTransferAndUnitaryTraceComparison §10.29 for `F/ℚ_p` in 6.2 and in Scope and ownership. 6.2 would stay as the statement for every nonarchimedean `F`, with one clause saying that what it adds is positive characteristic, which 6.4 needs.

## C01 — 6.5's route credits the classification of irreducible representations by multisegments to SmoothRepresentationsOfLocalGroups §SR.5.2, which does not state it; it is 4.1 (i) here

In the last sentence of the route (lines 575–576), each irreducible being "`L(Δ_1 + ⋯ + Δ_t)` for a unique multiset of segments" is credited to *segment-representations*. That target constructs `L(m)` for each `m`, but it proves neither that the `L(m)` exhaust the irreducible representations nor that they are distinct. Neither the *Needs:* line of 6.5 (line 578) nor the Dependencies of Layer 6 (line 609) mention 4.1. Cite 4.1 (i) and add it to both.

## C02 — Downstream consumers names ThetaChainsAndFrobeniusPrimeSums as the consumer of 7.2 in the Rallis steps; that roadmap does not cite this one, and the roadmap that does, RowTowerAndRallisIdentities, is not named

At its open head, ThetaChainsAndFrobeniusPrimeSums mentions this roadmap only in the shared family index. RowTowerAndRallisIdentities cites "LocalFactorsOfTwistsAndTypes §7.2" four times. The same list of consumers recurs in Scope and ownership (line 722).

## C03 — The route of 2.1 (c) cites ReductiveGroups Layer 7d for the two-dimensional endomorphism algebra; 7d states the Mackey formula, not that dimension

The route (line 94) and the supplier contract (line 744) both make this attribution. The dimension follows from 7d's Mackey formula together with 7c's adjunction and the cuspidality of `τ`. Saying so would point an implementer at the inputs that actually exist.

## C04 — Several cited results carry no theorem or section number, and two standard results carry no source

- 4.1 cites Zelevinsky "§§2–9". The exact locators are: (i) Theorem 6.1; (ii) Theorems 4.2 and 9.7 (a); (iii) Proposition 3.4; (iv) Corollary 7.5; (v) Theorem 9.3, which is Bernstein's, with the proof of the converse omitted there; (vi) Proposition 8.5.
- 6.4 and 6.5 cite Henniart 1993, Jacquet–Liu and Chai without numbers. Jacquet–Liu's is Theorem 1.3, with Conjecture 1.1. Henniart 2002 recalls Henniart 1993's theorem in the two forms used here: §1.4 (pp. 589–590) for the supercuspidal uniqueness, and the Corollaire of §1.9 (p. 592) for generic representations.
- 3.2 (the Macdonald formula) and 1.1 ("Jacquet's irreducibility") cite no source.
- 2.1 cites Morris and Bushnell–Kutzko without locators.
- 7.1 names Kudla–Rallis without a work.

## C05 — The half range of 6.4 is restricted to characteristic zero, though Jacquet–Liu prove it for every non-archimedean local field

Jacquet–Liu work over an arbitrary non-archimedean local field (the abstract and §1, Theorem 1.3); only Chai is p-adic. 6.4 (lines 514 and 521–522) could drop "If `F` has characteristic zero" and cite Jacquet–Liu Theorem 1.3. Its consumer, BaseChangeAndGaloisRepresentationsForUnitaryGroups, uses the p-adic case and is unaffected.

6.3 (line 469) is similar. It is stated for `F/ℚ_p` only because it takes the generic classification from SR's p-adic *modular-generic-segments*. Zelevinsky's Theorem 9.7 (b), the source of 4.1, gives that classification for every `F`, so 6.3 could be stated for every `F` as well.

## C06 — 7.1 allows an arbitrary Hecke character `χ` but places the poles only at norm twists `|·|_E^{it}`

Take `χ = |·|_E^{1/3}` and `μ = 1`. Then `L^S_E(z + (n+1)/2 − i, χ)` has a pole at `z = i − (n+1)/2 + 2/3`, although `|·|_E^{1/3}` is not `|·|_E^{it}` for any real `t`. Either write `|·|_E^{w}` with `w ∈ ℂ`, or assume `χ` unitary, as 7.2 does (line 632).

## N01 — Layer 1 uses Layer 4

The guide (line 9) and the Dependencies of Layer 1 (line 35) both say so, so the layers are not in build order. Placing 1.1 after 4.1 would let the layers be built in order.

## N02 — Three terms appear without saying whose they are

"Essentially AIG dual" and "`π_norm(ρ)`" in 4.2 (line 348) are SmoothRepresentationsOfLocalGroups §SR.5.2's (*essentially-aig*, *classical-llc-normalization*). "Henniart's range" in 6.4 (line 513) means `1 ≤ r ≤ n − 1`. A pointer for each would do.

## Questions for the author

- 2.1 (c)–(d) at an arbitrary point `x`: the README says the published comparison covers `x` in general position (Moy–Prasad 1996), and it sketches a route through Morris's Hecke algebras and Bushnell–Kutzko covers for the rest. Is there a text that states that `(G_{x,0+}(N ∩ G_{x,0}), 1)` is a `G`-cover of `(M_{x,0+}, 1)` for every `x`, or that proves (c) for every `x`? The computed Checks of 2.1 all came out right. I could not read Moy–Prasad 1996, Morris 1993 or Bushnell–Kutzko 1998, because no legal copy was reachable.
- 3.3 (the doubling series and its cell lemma) and the unitary case of 3.4 cite no source. Is there one, so that a locator can be given? I verified the closed forms for `n = 2, 3`, the trivial-parameter identity for `n ≤ 7` and the cell lemma for `n = 2` exactly, but not the general recursion.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 | `n = 1`; `n = 2`: `χ₁ × χ₂` unitary, `St` | `n = 1`: tempered ⇔ `|χ| = 1`; centred segments are never linked, so products are irreducible by 4.1 (ii) | holds | none |
| 2.1 (b), (d) | `GL₂`, `x` the vertex, `P = B`, unramified `π` | `π^{K₁} = Ind 1`, whose `U(k)`-invariants are 2-dim; `π_N` is 2-dim and unramified, so `(π_N)^{T(1+𝔭)}` is 2-dim | holds | none |
| 2.1 Check (a), `GL₄` | `σ × σ′`, `x` the edge barycentre, `M` on blocks {1,3}, {2,4} | `π_N ≠ 0`; `π^J = (cusp ⊗ cusp)^{U × U} = 0`; `(π_N)^{M_{x,0+}} = 0` | consistent with (d) | none |
| 2.1 (c), `GL₂` | `z = diag(ϖ, 1)` | `s·ω = diag(ϖ, 1)`; on the `τ = 1` part `T_zT_{z⁻¹} = T_s² = (q−1)T_s + q`, which is invertible | holds | none |
| 2.1 strong positivity | `GL₃`, `z = diag(ϖ, 1, 1)` | entry factors `(ϖ, ϖ, 1)` at (1,2), (1,3), (2,3): no exhaustion; on the block Levi it exhausts | holds | none |
| 3.1 | trivial rep; `G = ℤ`, `ρ(m) = z^m` | `θ(1_S) = #S`; `|θ(1_{1})| = |z| > 1 = ‖1_{1}‖₁`; (b) checked for noncommutative ℋ | holds | none |
| 3.2 | `n = 1`; `n = 2`, `λ = (1,0)`; `Q = q²` | `X^m`; `Q^{1/2}(X₁ + X₂)`; `Q^{⟨λ,ρ⟩} = q^{⟨λ,2ρ⟩}`, matching SR *macdonald-formula* | holds | C04 |
| 3.3 (b), (c) | `n = 2, 3`, `α ∈ {7/3, −5/2, 2q/7}`, `q = 2, 3, 5`; trivial `α`, `n ≤ 7` | series agree exactly through `X⁹`; `c(α) + c(α⁻¹) = 1`; (c) = (b) at the trivial parameter | holds | none |
| 3.3 Check counts | `n = 4`, `q = 2` | coefficients 1, 90, 6192 (then 403200) | holds | none |
| 3.3 (d) | `n = 2` cells, `a ∈ [−2, 2]`, `q = 2, 3` | `Σ_c X^{max(|a|, −a−v(c))} = q^{2a⁺}X^{|a|}(1−X)/(1−qX)`, which is the stated formula | holds | none |
| 3.4 | `G₄`, `α = (q^{5/2}, q^{5/2})`; `GL₄`, `α = (Q^{3/2}, Q^{3/2}, Q^{−3/2}, Q^{−3/2})` | `q⁹ > q⁸+q⁷+q⁵+q⁴`; `Q⁵+4Q²+Q⁻¹ > (Q²+1)(Q²+Q+1)`, `Q ≥ 2` | bound sharp, not sufficient | none |
| 4.1 | `n = 1`; `Z([−½, ½])` trivial; Zelevinsky 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7 | `r_B(1) = ν^{−½} ⊗ ν^{½}`, the order of Zelevinsky 3.4; (vi) `|j| ≤ 1` is stronger than 8.5's unlinked hypothesis | holds | C04 |
| 4.2 | `n = 2`, `ρ = 1`, SR's `Sp(2)` | `rec_1(det Sp(2)) = |·|^{−1}`; the centred rule gives `St`, with central character 1 | contradiction | R01 |
| 4.2 Check | swap twist orbits of `σ`, `σ′` on `GL₂` with equal `ω` and self-twists | twists, `π^∨ = π ⊗ ω_π⁻¹` and central characters preserved | holds | none |
| 5.1 | zero symmetry; twist by `|det|^{−1/4}` | `ρ ↦ 1 − ρ̄` (FE with conjugation); shifted zeros lie on `Re s = 3/4` | holds | none |
| 6.1 | `St` of `GL₂`; unitary unramified `α = β = 1` | `Σ q^{−m(σ+1)}` finite iff `σ > −1`; `Σ (m+1)² q^{−mσ}` diverges at `σ = 0` | holds | none |
| 6.2 | `n = 1`, `τ = χ₁ × χ₂`; `L` of `|·|^{½} × St` | product of Tate `γ`s; `L(s+1, 1)` against `L(s+1, 1)L(s, 1)` | holds; owned on main too | R03 |
| 6.3 | `St`; trivial rep of `GL₂`; `n = 1` | `St` has `α = 0`; the trivial rep is not generic; route (3): pole of `L(s − 2α_i, δ × δ^∨)` at `2α_i` | holds | C05 |
| 6.4 (headline) | `n = 2` unramified; Jacquet–Liu Thm 1.3; Henniart 2002 §1.9 | poles of `γ` locate `{a_i, b_i}`; full range for every `F` by Jacquet–Liu and Henniart 2002 | holds | C04, C05 |
| 6.5 (headline) | `n₀ = 1`; `St` under properties 3 and 4 with SR's `Sp` | `det Sp(2) = ω` against `r_1(ω_St) = 1` | empty for `n₀ ≥ 2` | R01 |
| 6.5 route | induction; supercuspidal `L = 1` for `m < n` | `γ = ε`; `ω` equal by property 3; `π″ ≅ π` by 6.4 | valid once rule 4 is consistent | C01 |
| 6.6 | `Λ(s, π × π^∨)` poles at 0 and 1 | order −1 is allowed by `ZeroFreeRightOf` (meromorphic order, RiemannHypothesisStatementsAndConsequences §9.2) | holds | none |
| 7.1 | `n = 1`; `n = 2` split; the shift | `{(n+1)/2 − i}` is symmetric, so the shift's sign is immaterial; `n = 1` gives `L^S_E(z, μ̃χ)` | holds | C06 |
| 7.2 / 3.4 (headline) | trivial rep of `GL_n`; trivial rep of `U(2)` inert | exponents up to `(n−1)/2` give abscissa `(n+1)/2` exactly; `(q_v, q_v⁻¹)` exceeds `q_v^{1/2}` | holds | none |
| Headline (4) in Lean | GL_n case | probe statement elaborates at the pins (ℤ and ℂ coefficients) | statable | R02 |

- Source locators checked against the text: 17 (Zelevinsky 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7; Emerton–Helm Def. 4.1.4, §§4.2–4.3; Henniart 2002 §§1.3, 1.4, 1.8, 1.9; Jacquet–Liu Conj. 1.1, Thm 1.3; Chai §1).
- Library declarations opened at the pins: Mathlib `HeckeRing/Defs.lean` 75, 189; `LocalField/Basic.lean` 46; `GeneralLinearGroup/Defs.lean` 148, 188; `RepresentationTheory/Basic.lean` 48; `GaussSum.lean` 72; `AddChar.lean` 72; `MulChar/Basic.lean` 73. Tau Ceti `HeckeRing/Associativity.lean` 484, `HeckeRing/Basic.lean` 902, 969; `ClassFieldTheory/Local/ArtinMap.lean` 114; `Newforms/Satake.lean` 91; `LFunctions/Data/Basic.lean` 82; `LFunctions/Hecke/Primitive.lean` 91.
- Cross-roadmap citations resolved: all 30 SmoothRepresentationsOfLocalGroups labels, in their cited sections; AutomorphicLFunctionsAndLocalFactors §§AL.2.4.1, 3.1.1–3.3.2, 3.3.8, 3.6.1–3.6.2, 4.1.1–4.1.2; Part II §§2.3, 3.4, 10.2; ReductiveGroupsPartII §RG2.3.6, RG2.4; ReductiveGroups 7c–7e; ClassicalArithmeticCompletion §7.12b; ArithmeticGaloisRepresentations §§2.4–2.5; ClassFieldTheory Layer 9; MetaplecticAutomorphicForms §6.10a; RiemannHypothesisStatementsAndConsequences §§9.2, 9.3, 9.5 and HermitianFormsAndLattices §§2.1, 4.2 at their heads; downstream sections of BaseChange…, ThetaKernels…, ThetaLifts… and FiniteReductiveGroups.
- Automatic checks: all passed on this head; dependency check rerun: `depcheck: 170 roadmaps, 1986 edges, 0 problem(s)`; no change outside the folder except the family index.
- Elaboration: `Suggested.lean` elaborates with no output; it declares nothing, so there were no `#check` signatures to compare.
- Exact rational arithmetic: the 3.3 closed forms (`n = 2, 3`), the trivial-parameter identity (`n ≤ 7`), the `n = 4` counts, the cell lemma (`n = 2`), and the 3.4 rank-two inequalities.
- Ownership against open pull requests: checked against the listed checkouts and the roadmap index.

Overlap check: read BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, ThetaLiftsForDefiniteUnitaryGroups and CongruenceModulesOfThetaLifts (open), and SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII, EndoscopicTransferAndUnitaryTraceComparison and GL2AutomorphicRepresentationsAndTransfer R16.0.1 (main). The open ones consume 2.1, 3.3–3.4, 4.1–4.2, 6.3–6.5 and 7.1–7.2 and own none of them. `rec` and segments belong to SmoothRepresentationsOfLocalGroups and are cited. Coarse local transfer is AutomorphicLFunctionsAndLocalFactorsPartII §10.2, also cited. The pair-factor products of 6.2 are also owned by EndoscopicTransferAndUnitaryTraceComparison §10.29 (R03). GL2AutomorphicRepresentationsAndTransfer R16.0.1 owns the rank-two characterisation by twisted factors, not the pair-ε characterisation of 6.5.

Source independence: 17 passages compared with 5 sources (Zelevinsky 1980, Emerton–Helm 2014, Henniart 2002, Jacquet–Liu 2018, Chai 2019); none shares wording beyond phrases the mathematics forces (the longest run is four words, "the same central character"). The largest shares are JPSS 1983 and Henniart 1993, 4 of 26 locators each; neither text was readable, so the contents were not compared with them. The layers follow the order of the home roadmaps' sections (line 9), not a source's.

Research link: 6.4 and 6.5 are Henniart's local converse theorem and the characterisation of the local Langlands correspondence by pair `ε`-factors, recalled in Henniart 2002 §§1.3–1.9 and sharpened to the half range by Jacquet–Liu 2018. 6.3 is the Jacquet–Shalika exponent bound. This rests on README 6.3–6.5 and Henniart 2002.

## Not verifiable

- JPSS 1983 (6.1, 6.2, 6.3, 6.5): available only on JSTOR; the sources service reached no legal copy.
- Henniart 1993 (6.4, 6.5): the Springer DOI resolves only to a paywalled page; its theorem was checked as Henniart 2002 §§1.4, 1.9 recalls it.
- Moy–Prasad 1996 (2.1): the Springer DOI resolves only to a paywalled page.
- Morris 1993 and Bushnell–Kutzko 1998 (2.1): no legal copy found (Springer, and Wiley refused the request).
- Harris–Kudla–Sweet 1996 (7.1): the AMS page is on a host the service does not classify.
- Harris–Taylor 2001 and Henniart 2000 (6.5): cited without a locator for the input theorem, which is not a target here; not fetched.

## Source issues

- none

## For the human reviewers

- The description and the family index (family `README.md`, lines 9–14) say the family follows a formal Lean proof of the Riemann hypothesis for Dirichlet L-functions announced on 20 November 2026. In this roadmap, 2.1 (c)–(d) at an arbitrary `x`, 3.3 and 3.4 (ii) cite no published source.
- Not tested: the sources with the largest share of locators (JPSS 1983 and Henniart 1993, 4 of 26 each) could not be read, so wording and arrangement were not compared with them. Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 and Harris–Kudla–Sweet 1996 could not be read either.
