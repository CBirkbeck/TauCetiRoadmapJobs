# FIX-RT-NonabelianLevelStructures~1: repair of red-team round 1 (passes a and b)

Twelve findings in two reviews, settled in eight sections (four pairs overlap). Every finding is
applied or applied differently; none is disputed outright. Two parts of proposed repairs are
disputed inside their sections (1a/F03's second gap, and 1b/F02's replacement Check).

## RT-NonabelianLevelStructures~1a/F01 (P1) — applied

Verified at the ArithmeticDynamicsPartII head (7dd79a5, README §6.0, lines 767–795): it states
`m ∣ 24`/`m ∣ 12` and, for semisimple c, `d ∣ |C_H(c)/⟨c⟩|`. It does not state Z(SL₂(𝔽_q)) ≤ H or
|D(q, H)| ≤ 2. Both are now owned here. §5.6: "ADP2 §6.0 proves |D(q,G)| ≤ 2" → "Prove … |D(q, G)| ≤ 2"
(Chen Prop 6.4.1(b), corrected to N/(G·C)), with an API bullet, a Dickson-based route and two Checks,
and *Needs* → AGR §§4.3, 4.4, §5.7. §6.6: centre containment stated and proved here (parity plus
Dickson). The same pattern is repaired in Scope lines 7 and 11, the §6.0 contract line 53 (the
supplier's hypotheses restored: noncentral c of trace ≠ 2, semisimple c), and the Layer 5
dependencies (ADP2 §6.0 dropped).

## RT-NonabelianLevelStructures~1a/F02, RT-NonabelianLevelStructures~1b/F03 (P3) — applied

Verified: ClassicalArithmeticCompletion §4.58 on main (README lines 8670–8700) names M(x), `V_k(R)`,
X(R) = V_0(R), and only `markoffLevelSet` as a declaration. Contract line: "`markoffPoly`,
`markoffLevelSet` and `markoffTraceSurface`" → "the Markoff cubic M(x) …, its level sets V_k(R) (the
declaration `markoffLevelSet`), and the trace-coordinate surface X(R) := V_0(R)". `markoffHurwitzMove`
and `markoffHurwitzGroup` occur in that roadmap and are kept.

## RT-NonabelianLevelStructures~1a/F03, RT-NonabelianLevelStructures~1b/F02 (P2) — applied differently

The gap was compound and equal to §0.7. It is narrowed to Asada's group statement: stabilizers of
exterior epimorphisms are cofinal (Chen 2018 Cor 3.4.2). §0.7 now proves domination and the Galois
curve statement itself: §0.3, V = cover of Γ(2)′ ≅ P¹∖{0,1,∞}, Belyi, and the intersection of the
Aut⁺(F₂)-images of ker e (Chen 2018, proof of Cor 3.4.2). N is a component of the stack and has
trivial automorphism groups. Three new Checks.

What is different from each proposed repair, and why:

- **1a's second gap (origami Veech stabilizers) is not added.** The Galois property needs no input
  beyond Asada. Let K be the intersection of the finitely many Aut⁺(F₂)-images of ker e. Then
  Out⁺(F₂) acts on F₂/K, and the stabilizer of e′ : F₂ → F₂/K is the kernel of
  Out⁺(F₂) → Out(F₂/K): it is normal and lies in Stab(e). This is CHEN2018 lines 1015–1022, the
  proof of Corollary 3.4.2, read at the source. Requesting Ellenberg–McReynolds plus Schmithüsen
  would add a supplier input that is not needed and whose texts the manifest does not hold.
- **1b's split into two gaps is not applied.** Its second slug (`gap:level-galois-cover-of-curves`)
  would still be exactly the second sentence of §0.7, which is the defect the finding names.
- **1b's sub-claims 2 and 3 are applied.** §0.7 now says "connected component N of the stack
  M(G)_ℚ̄". It cites BBCL22 only for the proof of Theorem 2.2.3 (V ≅ P¹∖{0,1,∞}), because that
  theorem itself states a quotient presentation (BBCL22 lines 612–623).
- **1b's replacement Check is disputed.** Its witness (the coarse S₃ component has degree 3 and
  cusp widths 2, 1 over the j-line) concerns ramification over the j-line, not over U. Over any U
  avoiding j = 0, 1728, ∞ the coarse map is étale. In the construction now written, N has trivial
  automorphism groups (Γ_U ≤ Γ(2)′ is torsion-free), so N is its own coarse curve.

## RT-NonabelianLevelStructures~1a/F04, RT-NonabelianLevelStructures~1b/F01 (P2) — applied differently

Added `sl2_cusp_automorphism_central` under a new `/-! ## Layer 6 … -/` section. It is stated at the
README's generality: subgroups G ≤ SL₂(K), |K| ≥ 3, absolutely irreducible (K-span = ⊤) and with
projective image isomorphic to no `DihedralGroup n`. 1b proposed G = SL₂(K) only. The conclusion is
Z(SL₂) ≤ G, and every a ∈ A(G, u, h) is central. README §6.6 is restated to match. The docstring
lists the theorem among those stated here, and names the geometric form (vertical groups,
representability) as not statable, which is 1a's bullet. "How to read the build" and the Mathlib
contract are updated.

## RT-NonabelianLevelStructures~1a/F05 (P3) — applied

Verified by enumeration for q = 4 and 8, every a ≠ 0 and every t ≠ 0: the split and irreducible
counts hold verbatim. §6.5 gains "The split and irreducible counts hold verbatim for even q and
a ≠ 0, where X² − aX + 1 is separable". The even-q a = 0 sentence is marked as the repeated-root
case. The proof route notes that neither argument divides by 2. New Check: over 𝔽₄ with
a² + a + 1 = 0 and t = 1, the conic has 5 points.

## RT-NonabelianLevelStructures~1a/F06, RT-NonabelianLevelStructures~1b/F04 (P3) — applied

Verified at the pinned Tau Ceti: `TauCeti/Topology/Covering/Monodromy/Basic.lean:63`, with
codomain `FundamentalGroupoid X ⥤ Type u`. Appended to "From Tau Ceti": the monodromy functor from
covering spaces of X to functors from the fundamental groupoid to sets. It is topological, is the
§0.3 input, and proves no Riemann existence for stacks.

## RT-NonabelianLevelStructures~1a/F07 (P3) — applied

Verified: CHEN2018 line 1010 numbers the statement Corollary 3.4.2 (line 175 of the introduction
calls it a theorem). References: CHEN2018 now lists "Theorem 4.2.2 (structure of M(D₂k));
Corollary 3.4.2 and its proof", and §0.7 now cites it. BBCL22 now lists "Proof of Theorem 2.2.3",
dropping the unused Proposition 2.1.2 and Corollary 2.1.3. `sources.toml` locators, `cited_for`
and version notes are updated, as is the gap's `detail` ("Theorem 3.4.2" → "Corollary 3.4.2").

## RT-NonabelianLevelStructures~1b/F05 (P3) — applied differently

Verified: ADP2 §6.0's proof-route paragraph argues the case j = 0 of Chen's Lemma 4.12.2 with no
stated target. A proof-route step is not ownership, so §4.1 remains the only stated owner. One
clause is added to Scope (the only place for such remarks) saying so: §4.1 is the only stated
owner, in terms of m′_c and d′_c, and §4.2 uses §4.1 and §3.3, not Corollary 4.12.5(a). 1b's
wording "§§3.3 and 4.1 are their stated owners" for what a supplier uses would suggest an upward
supply, so it is not used, and §4.1 is unchanged.

## Checks run

**Elaboration.** `lake env lean packages/NonabelianLevelStructures/Suggested.lean`, run from the
content checkout: no errors, and exactly four warnings, `declaration uses 'sorry'`, at lines 119
(`combinatorial_congruence`), 133 (`simple_group_congruence`), 257
(`integral_trace_coordinates`) and 275 (`sl2_cusp_automorphism_central`). No `TauCeti.*` module
needed building.

**Signatures.** I put `#check @name` for all 18 declarations in one scratch copy of the file and
elaborated it once. The 17 unchanged declarations have the same types as in the worker's
signatures file. The new theorem's elaborated type carries `[Field K] [Finite K]`, `hK : 3 ≤ Nat.card K`, `G`,
`habs`, `hdih` and the per-pair hypotheses explicitly, and matches README §6.6. No section binder
is involved and none was lost.

**Dependency check.**

    depcheck: 207 roadmaps, 1905 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line.

**Citation resolve.** `roadmaps resolve` lists only "190: MappingClassGroupsAndCanonicalRepresentations
§2.3: no roadmap … on main or in an open pull request". This is a false lead: that roadmap is a
board package, earlier in the merge order (line 291, directly above this roadmap at 292), and its
§2.3 "Teichmüller uniformization of the pointed moduli stack" exists in `packages/` on the board.
No Lean name is unresolved; the earlier `vertical_kernel` lead no longer appears.

**Gaps.** There are still eight slugs, identical in the README and the plan's `gaps`. Only the
`asada-cofinality` entry changed (title, detail, needs); supplier and section are unchanged.

## Gate failure: statement-hygiene

The hygiene check flagged `[Fintype K]` beside `[Field K]` in `sl2_cusp_automorphism_central`.
Changed `{K : Type*} [Field K] [Fintype K] (hK : 3 ≤ Fintype.card K)` →
`{K : Type*} [Field K] [Finite K] (hK : 3 ≤ Nat.card K)`. The two hypotheses say the same thing
mathematically: K is a finite field with q = |K| ≥ 3. Nothing else changed. The README states q ≥ 3
and mentions no Lean instance, so it still agrees. After the change the file elaborates with the
same four `sorry` warnings and no errors. `#check @sl2_cusp_automorphism_central` gives
`∀ {K : Type u_1} [inst : Field K] [Finite K], 3 ≤ Nat.card K → ∀ (G : …), …`, which matches
README §6.6. The dependency check still reports `depcheck: 207 roadmaps, 1905 edges, 0 problem(s)`.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `hK` after the change | K = 𝔽₂, 𝔽₃, 𝔽₄ | `Nat.card` = 2, 3, 4 = `Fintype.card` under any `Fintype` instance | 𝔽₂ excluded, 𝔽₃ and 𝔽₄ admitted, as before; the hypothesis is unchanged |

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `sl2_cusp_automorphism_central`, cusp part | SL₂(𝔽_q), q = 3, 4, 5 (all pairs), 7, 9 (sampled); 2T ≤ SL₂(𝔽₅), SL₂(𝔽₉); 2O ≤ SL₂(𝔽₇); order-48 and 2I ≤ SL₂(𝔽₉) | noncentral-A pairs: 0/384, 0/2280, 0/9120, 0/259, 0/219; 0/384, 0/384; 0/864; 0/864, 0/384 | holds |
| same, negative controls (dihedral projective image) | Q₈ ≤ SL₂(𝔽₃), SL₂(𝔽₅); SL₂(𝔽₂) ≤ SL₂(𝔽₄); D₁₀ ≤ SL₂(𝔽₄); dicyclic of order 12 ≤ SL₂(𝔽₅), SL₂(𝔽₇); order 16 ≤ SL₂(𝔽₇), SL₂(𝔽₉); order 20 ≤ SL₂(𝔽₉) | pairs with noncentral A: 24/24 each; 6/18; 20/60; 24/72 each; 32/96 each; 80/240 | hypothesis `hdih` necessary; Q₈ added as Check (Klein four = `DihedralGroup 2` must be excluded) |
| same, centre part Z(SL₂) ≤ G | every absolutely irreducible subgroup above, dihedral ones included | Z ≤ G true in all 20 cases | holds; route: odd order ⇒ fixes a point (Dickson) ⇒ reducible |
| same, degenerate | q = 2; G = 1; nonsplit torus C_(q+1) | SL₂(𝔽₂) ≅ D₃ excluded, proper subgroups abelian; span dim 1; span dim 2 (a field) | `habs` excludes non-absolutely-irreducible; q = 2 vacuous (Check) |
| §5.6 bound \|D(q, G)\| ≤ 2 | SL₂(𝔽_q), q = 3, 4, 5, 7, 9; 2T ≤ SL₂(𝔽₅), SL₂(𝔽₉); 2O ≤ SL₂(𝔽₇); order 48, 2I ≤ SL₂(𝔽₉) | 2, 1, 2, 2, 2; 2, 2; 1; 1, 1 | holds; gcd(2, q − 1) confirmed |
| same, negative control | Q₈ ≤ SL₂(𝔽₃) | 48/8 = 6 | non-dihedral hypothesis needed (Check) |
| §5.6 route, central automorphisms | 2O: χ = sign; ⟨SL₂(𝔽₃), δ⟩ ≤ SL₂(𝔽₉) | order-8 elements have trace ±√2 ≠ 0; δ·`[[1,1],[1,2]]` has trace −a ≠ 0 | χ trivial in each case |
| §0.7 Galois step | G = C₃, e = (1, 0) | Stab(e) index 8 (first row (1, 0) mod 3), not normal; K = ker(F₂ → (ℤ/3)²); Stab(e′) = Γ(3), index 24, normal, ⊆ Stab(e) | Check added |
| §0.7 V ≅ P¹∖{0,1,∞} | Γ(2)′ = ⟨`[[1,2],[0,1]]`, `[[1,0],[2,1]]`⟩ | index 12 in SL₂(ℤ), 6 in PSL₂(ℤ); 2 − 2g = 12 − 4 − 3 − 3 = 2, g = 0; 3 cusps; with Γ(2) = ±Γ(2)′ stabilizers ±1 | Check added |
| §0.7 non-properness | N finite over the non-proper 𝓜(1) | a finite map to a projective curve forces proper source | U essential |
| §6.5 even q, a ≠ 0 | q = 4, 8, all a ≠ 0, t ≠ 0 | 0 mismatches against q − 1 / 2q − 1 (split), q + 1 / 1 (irreducible); 𝔽₄, a² + a + 1 = 0, t = 1: 5 points, no root | holds; Check added |
| §6.5 norm form | λ a root of X² − aX + 1 irreducible | N(y − λz) = y² − (λ + λ^q)yz + λ^(q+1)z² = y² − ayz + z² | exact, any characteristic |
| ADP2 §6.0 contract (line 53) | compared with ADP2 head §6.0 text | noncentral c, tr c ≠ 2; m ∣ 24 / 12; semisimple c for the d-bound | now matches the supplier |
| ClassicalArithmeticCompletion §4.58 contract | main README 8670–8700 | M(x), V_k, X = V_0, `markoffLevelSet` | matches |

## Ownership

Centre containment for absolutely irreducible subgroups (Chen Prop 6.4.1(a)), the bound
|D(q, G)| ≤ 2 (Prop 6.4.1(b)) and the finite-group form of Theorem 5.3.2 were searched by object in
the roadmaps on main and at the open heads (`roadmaps grep` for Macbeath, Proposition 6.4.1, Theorem
5.3.2, the diagonal outer or normalizer group, and the new name). No other roadmap states them.
ArithmeticDynamicsPartII mentions a "diagonal normalizer factor" but states no bound, so this
roadmap owns them. No `Suggested.lean` name coincides with a declaration of a readable roadmap.
Asada's theorem and origami Veech groups occur in no roadmap; the request stays with
MappingClassGroupsAndCanonicalRepresentations as a gap.

## For the maintainer

- **MappingClassGroupsAndCanonicalRepresentations.** `gap:asada-cofinality` now asks for less:
  only the group statement (Chen 2018 Cor 3.4.2), not the cover-theoretic and curve statements.
- **ArithmeticDynamicsPartII.** This roadmap no longer cites its §6.0 for centre containment or for
  the bound on D(q, H). Separately, ADP2 §6.3's route asks for "a trivial diagonal normalizer
  quotient" in even characteristic, to be proved in its §6.0, which §6.0 does not state. That is a
  defect of ADP2, outside this package.
- **New name.** `sl2_cusp_automorphism_central` is new; no other roadmap cites it. No name was
  renamed or deleted.
- **Source issue.** CHEN2024 line 5209 (Proposition 6.4.1, case (E4), and its proof at line 5230)
  prints S₅ where Dickson's list gives S₄; S₅ is not a subgroup of PGL₂(k̄). The bound is unaffected,
  since Out(S₄) is trivial.
- **Ownership against open pull requests** was checked through `roadmaps grep` over all open heads,
  plus the ArithmeticDynamicsPartII head and the board packages read directly.
