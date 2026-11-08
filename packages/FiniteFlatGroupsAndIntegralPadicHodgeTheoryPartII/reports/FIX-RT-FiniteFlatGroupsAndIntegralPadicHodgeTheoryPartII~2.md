# FIX-RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2: red-team round 2 repaired

Six findings from two reviews (2a: F01–F03; 2b: F01–F03). All six verified against the cited sources at the cached texts, the suppliers at their current heads (PadicHodgeTheory #1062, VectorBundlesAndIsocrystals #1205 at c7a0b33, FiniteFlatGroupsAndIntegralPadicHodgeTheory #879) and the roadmap's own conventions. Six applied, one of them differently from the reviewer's exact text. Files changed: `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md`, `design/plan.json` (one new entry in the top-level `gaps` list only), `sources.toml` (two locator strings). `Suggested.lean` still declares nothing, and nothing in these findings makes a headline statable at the pins; its only change is the module-system header described under Repair below.

## RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2a/F01 (P1) — applied

Verified: PadicHodgeTheory §5.5 at #1062 states its period-torsor class theorem "For K/ℚ̆_p finite" (its period-torsor paragraph). Wintenberger97 lines 30–31 and 180–186 fix the setting as K finite over W(k)[1/p] with k an arbitrary algebraically closed field of characteristic p; Kisin17 line 242 allows perfect k and its Proposition 1.1.19 (lines 484–505) invokes [Wi, Cor. 4.5.3]. The witness is right: for k an algebraic closure of 𝔽_p(t), k̄=k, so K̆=K and its residue field contains t, while every finite extension of ℚ̆_p has residue field 𝔽̄_p; the round-1 sentence "a field finite over ℚ̆_p" was false there.

Old → new. Supplier contract (PadicHodgeTheory paragraph): the unramified base change is now stated only for k algebraic over 𝔽_p (then W(k̄)=W(𝔽̄_p)); the transcendental witness is recorded; a new paragraph "What PadicHodgeTheory must provide (gap:perfect-residue-period-torsor-comparison)" asks, for perfect k, K/W(k)[1/p] finite totally ramified, G/ℚ_p connected reductive and b∈G(K₀), that two admissible G-filtrations with K̄-conjugate cocharacters have tensor-isomorphic ℚ_p fibre functors, with the Wintenberger locators (§0, p.1293; Prop. 4.5.3 and corollary, pp.1331–1332). Scope bullet, §5.17 route and §5.17 *Needs* now split the two cases; §5.17 has the negative-control Check with k=algebraic closure of 𝔽₃(t); the §5.17 route's last sentence names gap:perfect-residue-bt-realization explicitly so that the two perfect-residue contracts are not confused. `design/plan.json` gains the same slug, supplier PadicHodgeTheory, section 5.5. Same places as the reviewer listed; no other passage asserted that K̆ is finite over ℚ̆_p (grep for ℚ̆ and K̆).

## RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2a/F02 (P3) — applied

Verified: Conventions fix μ₀ as the inverse Hodge cocharacter and §5.17 requires that μ⁻¹ induce the filtration. For G_m with b=3 the multiplicative line has Fil¹=D, induced by the weight-one cocharacter z, so μ⁻¹=z and μ=z⁻¹. With μ=z, μ⁻¹=z⁻¹ gives jump −1 and t_H=−1≠1=t_N. The supplier's class is κ(b)−μ^♮ for the cocharacter μ with κ(μ(p))=μ^♮ (its G_m Check: b=p^m, μ=z^h, equality m=h), which is our μ⁻¹.

Old → new: Check now reads μ(z)=z⁻¹, μ⁻¹(z)=z the weight-one Hodge cocharacter, t_H=t_N=1, κ(b)−(μ⁻¹)^♮=1−1=0, and adds the μ(z)=z instance as the excluded non-admissible case. Pattern search: §5.3 (μ_T=z⁻¹, μ_T⁻¹ induces jump 1) and §5.6 (μ₀=diag(z⁻¹,1)) already use the same convention; no other Check needed a sign change.

## RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2a/F03 (P2) — applied

Verified: Lau14 lines 23–26 (abstract) extend the display theory to p=2 "without restriction"; §5 (line 1699) and Theorem 5.3 (line 1730, Gabber) concern perfect rings at every prime; Lemma 2.4 (line 644) is stated for a perfect ring with no prime restriction. The supplier FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10 (perfect-field classification consumed by §0.2) has no prime restriction either. The global "p>2" therefore narrowed §§0.2 and 0.5 below their sources.

Old → new: Conventions: "Let p be a prime. Assume p>2 throughout, except in §§0.2 and 0.5 …"; §0.2 and §0.5 statements say "for every prime p, including p=2", §0.2 explains why the odd-prime hypothesis is unused with the Lau14 abstract locator; §0.5 gains the 𝔽₂ Check: (F,V)=(2,1) and (1,2), FV=VF=2, both meeting 2M⊂FM⊂M, with F=4 excluded. Pattern: every other "p>2" (§§0.1, 0.13, 1.4, 2.1, 3.13, 3.16, 6.1 and the two GeometricSatakeAndFusion gaps) is a genuine source hypothesis and stays.

## RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2b/F01 (P3) — applied

Verified at #1205 (c7a0b33): no label "VB" followed by a digit occurs; layers are "## Layer 0" … "## Layer 6"; "#### Finite isocrystals over the completed maximal unramified coefficient field" sits under "## Layer 1: Finite isocrystals and division algebras", and "#### Integral group torsors and Frobenius" under "## Layer 6: Families, pure models and local systems".

Old → new: "VB0" → "Layer 1" and "VB4" → "Layer 6" at all six places (Scope bullet, supplier contract, §2.0 *Needs*, §4.3 *Needs*, Layer 4 Dependencies, §5.1 *Needs*), keeping the quoted titles; the Layer 4 Dependencies line now also carries the title. No "VB" label remains.

## RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2b/F02 (P3) — applied

Verified: KZ25 lines 1011–1019 letter (A) acceptable and of local Hodge type, (B) good local integral Hodge embedding, (C) very good at y; KPZ26 lines 3177–3179 letter (A) K_p=𝒢(ℤ_p), (B) R-smooth and p∤|π₁(G_der)|, (C) very good Hodge embedding, for Theorem 7.1.3.

Old → new: §4.10 now defines (A)–(C) at first use as KZ25 §3.2.5's conditions and says the letters keep that meaning in §§4.10–4.12 and §6.6; §4.11, §4.12 and §6.6's route refer to "(A)–(C) of §4.10"; §4.12 adds, after the KPZ26 citation, that KPZ26's letters at that locator name the global level, R-smoothness and very-good-embedding hypotheses of its Theorem 7.1.3 and are not the three conditions here. §6.6 is the one extra occurrence found by the pattern search.

## RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2b/F03 (P3) — applied

Verified: the §0.7 bullet restated the PD hypothesis and the §2.8 bullet was an instruction; neither computed anything.

Old → new, §0.7: B=𝔽₃[x]/(x⁴)→𝔽₃, kernel (x): divided powers would force x³=3!γ₃(x)=0 but x³≠0, so none exist and no relative frame is formed; B=𝔽₃[x]/(x³): γ₂(x)=x²/2=2x², γ_n=0 for n≥3 is a nilpotent PD structure (γ₁γ₂=x³/2=0=3γ₃, γ₂²=0=6γ₄), so `D_{B/R}` exists. §2.8: 𝒢=GL₂, R=k[ε]: p·Ŵ(m_R)=0 since p=VF and F kills coordinates in kε, so Ŵ(R)[1/p]=W(k)[1/p]; Ψ₀ and Ψ₀(1+[ε]E₂₁) ([ε]²=0) differ over Ŵ(R) but rationalize to the same map. Both as the reviewer proposed, recomputed below.

## Checks

- Elaboration: `lake env lean …/Suggested.lean` from the content checkout, exit 0, no output, after the header repair below (the file declares nothing; `#check @name` audit vacuous, nothing changed).
- Dependency check (verbatim): `depcheck: 232 roadmaps, 2202 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Citation resolver on the edited README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.
- `design/plan.json` parses; its `gaps` list has 15 entries and the README has 15 `gap:` slugs under Exact supplier contracts, one to one.
- No gate failures were listed for this round.

## Repair

The worker's build logged, for `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean`, the warning that it imports `Mathlib` without the module system. The file's header is now the module-system form that the roadmaps on main use (`module`, then `public import Mathlib`, then the module docstring, then `@[expose] public section` before the namespace). The docstring, the namespace and the absence of declarations are unchanged; `lake env lean` exits 0 with no output, and the dependency check is unchanged.

## Adversarial pass on changed statements

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Supplier contract / §5.17 route: unramified base change reaches ℚ̆_p-finite range | k=𝔽₃; k=𝔽̄₃; k=algebraic closure of 𝔽₃(t) | W(k̄)=W(𝔽̄₃) in the first two, K̆=K⊗ℚ̆₃ finite over ℚ̆₃; third: k̄=k, K̆=K, residue field ∋ t, not 𝔽̄₃ | third case moved to the new gap; Check added |
| gap:perfect-residue-period-torsor-comparison | G=G_m, b=3, filtrations by z and by z (same cocharacter); G=GL₂ with two conjugate jump-(1,0) filtrations over K=ℚ₃ | each realization is a one-dimensional ℚ₃-space; both class values κ(b)−μ^♮ equal 0 for b=diag(3,1), μ=diag(z,1) | statement holds in the supplier's range; Wintenberger's setting (lines 180–186) covers the transcendental case |
| §5.17 Check, μ=z⁻¹ | G_m, b=3: μ=z⁻¹ and μ=z | μ⁻¹=z: Fil¹=D, t_H=1=t_N; μ⁻¹=z⁻¹: jump −1, t_H=−1≠1 | sign corrected; non-admissible instance recorded |
| Conventions / §§0.2, 0.5 at p=2 | R=𝔽₂, M=ℤ₂ with F=2, F=1, F=4; R=𝔽₂×𝔽₂ | (F,V)=(2,1),(1,2): FV=VF=2, 2M⊂FM⊂M; F=4: V=1/2∉ℤ₂, 2M⊄4M; product ring: ranks (0,1) allowed | all-prime statement holds; p>2 kept elsewhere |
| §0.7 Check | B=𝔽₃[x]/(x⁴); B=𝔽₃[x]/(x³) | x³=3!γ₃(x)=0 vs x³≠0; γ₂(x)=2x², γ₁γ₂=x³/2=0=3γ₃, γ₂²=x⁴/4=0=6γ₄, γ_n(f+g) and γ_n(af) for f,g∈(x) agree since f³=0 | PD structure exists only in the second case |
| §2.8 Check | 𝒢=GL₂, R=k[ε], p=3 | F(aε,…)=(a³ε³,…)=0, p[ε]=VF[ε]=0; (1+[ε]E₂₁)(1−[ε]E₂₁)=1; image in Ŵ(R)[1/p]=W(k)[1/p] is 1 | Ψ₀≠Ψ₀(1+[ε]E₂₁) integrally, equal rationally |
| §4.10 hypotheses (A)–(C) | GL₂ hyperspecial with empty tensors; torus datum with E₁₁ | acceptable and local Hodge type, identity embedding good, very good (all good are very good for empty tensors); torus: c=id fixes E₁₁ | labels now match KZ25 §3.2.5; KPZ26's letters recorded as different |

## Notes for the maintainer

- New supplier gap `perfect-residue-period-torsor-comparison` for PadicHodgeTheory §5.5 (open pull request #1062): its §5.5 period-torsor theorem is stated for K/ℚ̆_p finite; the contract asks the same fibre-functor comparison for every perfect residue field, which Wintenberger97 supports for every algebraically closed residue field.
- Ownership against open pull requests was checked only through the roadmap index and the sibling checkouts named in the brief; no new construction was added, so no ownership moved.
- No roadmap name, section number or Lean name that other roadmaps cite changed. The VectorBundlesAndIsocrystals citations now use its layer numbers with the subsection titles.
- No source needed fetching; `needs-references.toml` was not created.
