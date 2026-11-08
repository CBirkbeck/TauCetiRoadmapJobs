# GATE-FaltingsFinitenessAndIsogenyTheoremsPartII~1: answers to human review

One comment (roed-math, 2026-11-06T06:22:25Z). It makes two points: who owns the period-theorem
lemmas of §§2.1–2.3, which EllipticCurveModularityPartII §6.0f also lists (H01), and the suggestion
to record that roadmap under Downstream consumers (H02). The comment's procedural line (moving the
pull request to `awaiting-author`) is not a mathematical point and gets no section.

## H01 (roed-math) — applied differently

The overlap is real at the level of method, but the statements differ, and the suggested direction (this roadmap owns, EllipticCurveModularityPartII §6.0f consumes) would make the two roadmaps supply each other. That roadmap is position 187 in the merge order, this one is 351, and Layer 6 here consumes its target quantitative-elliptic-isogeny (README line 134; EllipticCurveModularityPartII README line 144 at head d2cbd93). The repair settles ownership by statement in Scope and ownership: README line 11's closing sentence ("EllipticCurveModularityPartII §6.0f owns the quadratic elliptic isogeny estimate … sharp surface period estimate of Gaudron–Rémond; Layer 6 here consumes it …") becomes a separate paragraph, README line 13. It says what each roadmap owns:
- §6.0f owns the explicit Gaudron–Rémond estimates: the gr14 §§3, 6 auxiliary-section, jet-norm and slope bounds; Nakamaye's multiplicity estimate at the origin (gr14 Proposition 6.1, gr14 lines 1074–1082); the g=2 surface estimate (Proposition 6.9, gr14 lines 1606–1620); and the E²×E′² period graph (Théorème 7.5, gr14 lines 1813–1817).
- Layer 2 here owns Bost's route in every dimension: G_ω for every polarized G and period ω (§2.1), Bost Thm 4.1 for an arbitrary finite subscheme (§2.2), Bost Lemma 5.4 at the N translates iP (§2.3), and the period theorem with constants depending only on g and the polarization degree (§2.4).

The paragraph also says why neither set implies the other, and that §6.0f consumes nothing from Layer 2. A new §2.2 Check computes the distinction (README line 401). On a surface, the first-order neighbourhood S has length 3 and S^[2] has length 6. For L the square of the principal product line on E₁×E₂, θ² gives 3≤8. The origin-only count T^c=4 differs from binomial(3,2)=3.

Evidence that this is the correct split, and why the duplication cannot be removed from this side:

- The two multiplicity estimates are different theorems. Bost Thm 4.1 (bost95 lines 381–389) takes an arbitrary 0-dimensional S and vanishing on S^[g]. At the origin, with S the neighbourhood of order T−1, it gives binomial(T−1+c,c)·d_L(B)≤d_L(A). Gaudron–Rémond's form (gr14 lines 1076–1078) takes vanishing to order gT along the whole tangent space at 0 and gives T^c·deg B≤deg A·n^c. For g=2, T=2, c=2 the first needs vanishing to order 3 and gives 3≤d. The second needs order 4 and gives 4≤d. So neither implies the other at the origin, and only Bost's covers the translates iP that §2.3 needs.
- Gaudron–Rémond's §6 auxiliary sections vanish along the full tangent space at 0 (gr14 Proposition 6.1, lines 1074–1075). §2.3 (bost95 Lemma 5.4, lines 598–603) restricts jets along a hyperplane W at 0 and at N translates. Different statements again.
- §§2.3–2.4 carry unspecified C_g, κ_g, C_(g,d), so they cannot give the 10⁷d² rate (README already says so at lines 421 and 981). Proposition 6.9 is stated for g=2 only (gr14 line 1609), so it cannot replace §2.4 for general g.
- The only shared object is the notion G_ω. §6.0f uses it for one instance, the E²×E′² period graph, inside its proof route, and states no general definition that §2.1 could cite. At ECMPII's head no earlier roadmap defines it in general. I searched by object across main and the open heads ("smallest abelian subvariety", "minimal period subvariety", "period theorem", "multiplicity estimate", "zero estimate", "matrix lemma", "Masser–Wüstholz"). The general notion and the general-dimension period theorem therefore stay here. ArakelovGeometryAndAbelianHeights (head of its open pull request) cites gr14 only as a reference and does not state any period theorem.
- The cycle-free way to remove the remaining duplication runs the other way, and it needs a change outside this pull request. EllipticCurveModularityPartII, the earlier roadmap, would have to state G_ω and a multiplicity estimate in general form, and this roadmap would then cite them.
- Related: EllipticModularityEffectiveComparisons (open, order 270) requests the Gaudron–Rémond period inequalities in every dimension from ArakelovGeometryAndAbelianHeights (`gap:quantitative-abelian-periods`, its README line 118). If that request were fulfilled, §2.4 would also follow from gr14 Théorème 1.3 (gr14 lines 148–155). No such section exists yet, so there is nothing to cite now.

## H02 (roed-math) — disputed

EllipticCurveModularityPartII is not recorded under Downstream consumers. It supplies Layer 6 (README lines 13 and 134). Listing it as a consumer of §§2.1–2.3 would make the two roadmaps supply each other, which the single direction of supply forbids. The new Scope paragraph (README line 13) says this explicitly. Downstream consumers (README line 1219) is unchanged.

## Build and gate

- `lake build TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII.Suggested`: `Build completed successfully (8979 jobs).` The only warnings are `declaration uses 'sorry'` at `Suggested.lean:47:8` (`class_index_bound`) and `Suggested.lean:68:8` (`elliptic_isogeny_j_height_bound`).
- Gate, after commit fca94973: `gate FaltingsFinitenessAndIsogenyTheoremsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Commit: `FaltingsFinitenessAndIsogenyTheoremsPartII: review repairs (period-estimate ownership against EllipticCurveModularityPartII §6.0f; multiplicity Check)`. Not pushed.

## Signatures

`Suggested.lean` is unchanged. Only the Lean commands named in the brief were run, so the three elaborated types were taken from the worker's elaborated-signature listing rather than a fresh `#check @name` file. They were compared with the README statements:
- `regularOrderDiscriminant` against §3.1 (README line 575): any `Ring` with a finite ℤ-basis of a `Subring`.
- `class_index_bound` against §3.3 (README line 693): `DivisionRing`, `Algebra ℚ`, `FiniteDimensional ℚ`, full rational span of O and of M, `Module.Finite ℤ M`, e>0, an injective O-linear map with nonzero index at most |disc|^(e/2).
- `elliptic_isogeny_j_height_bound` against §6.1 (README line 957).

No binder is lost and nothing changed.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Bost Thm 4.1 at the origin counts binomial(T−1+c,c) (Scope, line 13) | S = Spec O/m^T. g=1, c=1, T=2; g=2, c=2, T=2; g=2, c=1, T=2 | length p(S): binomial(2,1)=2; binomial(3,2)=3; binomial(2,1)=2 | Matches the monomial counts 1,x / 1,x,y / 1,x | none |
| Gaudron–Rémond form counts T^c (Scope, line 13) | same three cases, gr14 lines 1077–1078 | 2; 4; 2 | Agrees with Bost when c=1; strictly larger when c=2 | none |
| "Neither multiplicity estimate implies the other" | g=2, T=2, c=2 | Bost: hypothesis order g(T−1)+1=3, conclusion 3≤d. GR: hypothesis order gT=4, conclusion 4≤d. Bost's covers the translates iP; GR's covers 0 only | Neither hypothesis/conclusion pair dominates; claim holds | none |
| Proposition 6.9 is g=2 with c₁(L)²[A]≥10¹⁰ | gr14 line 1609 | g=2, threshold 10¹⁰ | holds | none |
| Théorème 7.5: degree ≤2 field, A_ω≅E₁×E₂, intersection of cardinality Δ | gr14 lines 1813–1817; non-CM E=E′ with equal bases | k′ degree 1 or 2; Δ=1 for the identity graph | holds | none |
| §§2.3–2.4 carry unspecified constants | README §2.3 (C_g), §2.4 (κ_g, C_(g,d)) | no explicit value appears; Layer 6 rate 10⁷·989²=9,781,210,000,000 comes from §6.0f | holds, consistent with README lines 421, 981 | none |
| ECMPII supplies Layer 6, so no reverse supply | merge order 187 vs 351; README line 134 | ECMPII → Layer 6 edge exists; a Layer 2 → ECMPII edge would close a cycle | holds | Downstream consumers left unchanged |
| New §2.2 Check: length S=3, S^[2]=6 on a surface | first-order neighbourhood; addition of two first-order points | monomials of degree ≤1: 3; of degree ≤2: 6; (x+y)^α with abs α=2 keeps the x_iy_j terms; abs α=3 dies | holds | added |
| New Check: B elliptic gives length p(S)=2 | A/B a curve; image of a first-order neighbourhood | first-order neighbourhood in a curve: 1,t → 2 | holds | added |
| New Check: d_L(A)=8 for the square of the principal product line | c₁(L₀)²=2 on E₁×E₂; L=L₀² | c₁(L)²=4·2=8; θ=s₁⊠s₂ ~ xy has order 2, θ² ~ x²y² order 4 ≥ 3, so it vanishes on m³; B=0 gives 3≤8 | holds (nonzero s, as required) | added |
| Degenerate: principal L₀ itself | h⁰(L₀)=1, θ of order 2 | does not vanish on m³, so the hypothesis fails; with B=E₁×0: 2·1≤2 | no contradiction | none |

## Citations and overlap leads

- `AutomorphicBundles B4.2` (lead at README line 13): a false positive. AutomorphicBundles (head of its open pull request) defines the letter labels in its own Conventions: B4 = Layer 11 and B5 = Layer 12, with B5.1a = 12.2 and B5.n = 12.(n+1). So B4.2 = §11.2 (cuspidal automorphic forms), B4.9 = §11.9, B5.1a = §12.2 and B5.13 = §12.14. All exist.
- `ScalarFourierJacobi.torsorDescription` (README line 124): the backticked target name of AutomorphicBundles §12.2 ("Prove `ScalarFourierJacobi.torsorDescription`"), cited as a supplier target and not declared here. The gate's readme-ids check passes.
- Overlaps lead "IntegralLattices Layer 0 only at the head of its open revision": a false positive. Main's `TauCetiRoadmap/IntegralLattices/README.md` has `### Layer 0: lattices, the dictionary, and the first invariants` (line 507) and `### Layer 1: dual lattices, …` (line 590). Main uses a deeper heading level than the revision. No open revision is a dependency.
- Ownership against open pull requests was checked for the objects of §§2.1–2.4 against main and the open heads through the roadmap index. No second owner exists. EllipticModularityEffectiveComparisons §5.3a restates the quantitative elliptic isogeny estimate of EllipticCurveModularityPartII §6.0f; that duplication is between those two roadmaps. This roadmap cites the earlier one (order 187 against 270).
- No source was fetched; `needs-references.toml` was not written. Every locator added is to gr14 and bost95, which are already in the cache.
- No suspicious instructions were found in the review text.
