# GATE-ZigzagPreprojective~2: answers to the human review of `cb53249`

One review (CBirkbeck, 2026-11-05T16:14Z, of `cb53249`) with six findings F01–F06, numbered H01–H06
below. The branch head when this job started was `56a38d9`. That commit came after the review and
already repairs F02–F06. Those repairs were re-verified against the sources and extended here where
the adversarial pass found gaps. This job's commit is `5e2b634` (README only; `Suggested.lean`
unchanged).

## H01 (CBirkbeck) — disputed

`TauCeti.subsingleton_balancedTensorProduct_zigzagAlgebra_of_ne_of_not_adj` exists at the Tau Ceti
pin the roadmap is held to. The content repository's `lake-manifest.json` pins Tau Ceti `358314d4`,
and at that revision the theorem is declared at
`TauCeti/RepresentationTheory/Quiver/Zigzag/Braid/Nonadjacent.lean:41`. Its hypotheses are
`[CommRing k]`, `[Finite V]`, `i ≠ j` and `¬ G.Adj i j`. Revision `a91d3aa` comes from the branch's
own manifest: the branch forks main at `44f59670` and does not modify `lake-manifest.json`, so once
merged the roadmap builds against main's `358314d4`. Turning the theorem into a target would plan a
declaration the pin already has.

`TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/D4/SelfInjective.lean`, cited in §4.2, is in
the same situation: present at `358314d4`, absent at `a91d3aa`. These are the only two of the 130
backticked `TauCeti.*`/`SimpleGraph.*` names and cited file paths that differ between the two
revisions. Bringing the branch up to main makes the build pin match the citation pin. That change is
outside the roadmap folder.

A related precision was applied. The theorem needs `i ≠ j`: at `i = j` the factor is
`e_i Z ⊗_Z Z e_i ≅ e_i Z e_i ∋ e_i`, which is nonzero. So "nonadjacent vertices" now reads "distinct
nonadjacent vertices" at README lines 242, 1144, 1148 and 1208. The §8.1 *Needs:* line (1153) now
also lists the native middle-factor vanishing.

## H02 (CBirkbeck) — applied differently

At `56a38d9`, §4.2 (README lines 707–722) gained the locator "Grant, Theorem 3.1, p. 7, after
Brenner–Butler–King, Theorem 4.8". It also cites:
- Frobenius ⇒ self-injective, p. 4;
- the Baer–Geigle–Lenzing algebra, Grant Definition 2.6, p. 6;
- Ringel and Crawley-Boevey's identification with the presented algebra, p. 6.

Grant was added to `## References` (line 1297).

The difference from the suggested repair: Gabriel's theorem is consumed from Tau Ceti rather than
from QuiverRepresentations. It exists at the pin as
`TauCeti.isFiniteRepType_iff_card_hom_add_card_hom_le_one_and_exists_dynkinType_iso`
(`RepresentationTheory/Quiver/FiniteRepType/Gabriel.lean:112`, identical at `a91d3aa` and
`358314d4`). It appears in the supplier contract at lines 214–218. QuiverRepresentations Layer 1
("representations of a quiver as `kQ`-modules", its README line 229) supplies the module
translation.

Checked: Grant2019 line 139 (any field), lines 157–158 (p. 4), lines 244–254 (p. 6) and lines
277–279 (p. 7).

## H03 (CBirkbeck) — applied

At `56a38d9`, §7.1 (README line 968) cites "Etgü–Lekili, Corollary 25, p. 40, for the right module
`k^{Q₀} = Π₂(Q)/Π₂(Q)_{>0}`" for `RHom_{Π₂(Q)}(k^{Q₀},k^{Q₀}) ≃ Z(Γ)`. The converse keeps Theorem 23,
p. 37, "for right modules over the opposite zigzag algebra" (line 972). Checked against
EtguLekili2015 lines 1279–1282 (Theorem 23) and lines 1378–1382 (Corollary 25: right module; the
cohomological and internal gradings coincide and match path length).

## H04 (CBirkbeck) — applied differently

At `56a38d9`, §5.2 gained three API bullets (README lines 778–792) and three Checks (lines 793–815):
- the `A₂` path algebra is Koszul;
- `Z(A₂)` is not Koszul, its terms being generated in degrees `0, 1, 3, 4, …`;
- the triangle.

The Hilbert-series bullet differs from the suggested `h_{A^!}(t) h_A(−t) = 1`: for matrix series it
reads `h_A(t) · h_{A^!}(−t)ᵀ = I`. Without the transpose the identity fails. On the `A₂` path algebra
`1 → 2`, `h_A = I + tE₂₁` and `h_{A^!} = I + tE₁₂`, and `(I + tE₁₂)(I − tE₂₁)` has degree-one term
`E₁₂ − E₂₁ ≠ 0`.

This job extended the Checks:
- a transpose witness on the `A₂` path algebra (lines 798–802). The triangle's symmetric `A` cannot
  detect the transpose.
- `P_2⟨1⟩` → `P_2{1}` (line 797), matching the Conventions shift `[M{1}] = q[M]`.
- a computed value in the triangle Check (lines 811–815): `H₂ = A² − I = J`, total `9`, which equals
  `12 − 3` doubled length-two paths modulo vertex relations.
- the Mazorchuk Corollary 10.12 citation now records that it is stated over `ℂ` with `A₀ ≅ ℂⁿ`
  (lines 784–786; Mazorchuk2010 lines 2399–2403, 2568–2569).

The Ext form is checked against EtingofEu2005 lines 142–143 (Definition 2.3.3, p. 3). The Koszul
complex up to homological degree two is at lines 150–158.

## H05 (CBirkbeck) — applied

At `56a38d9`, §8.2 (README lines 1175–1178) reads: "and, for every object `F` and every `j ∈ ℤ`, the
composition `Hom^j(F,E) × Hom^{n−j}(E,F) → Hom^n(E,E) ≅ k` is a nondegenerate pairing (Definition
2.9, (K3) and (K4), p. 15)". This matches SeidelThomas2000 lines 609–613.

## H06 (CBirkbeck) — applied

At `56a38d9`, the eight lost spaces were restored:
- "value 1" (lines 289, 325);
- "coefficient 0" (316);
- "mark 1" (326);
- "corank 1" (334);
- "at least 3", "at least 4", "degree 3" (366–368).

A blank line now precedes the seven headings §3.2, §5.2, §5.3, §5.4, §7.2, §7.3 and §8.2 (lines 630,
765, 819, 870, 999, 1042, 1166). A rescan of the whole README finds no remaining glued pairs and no
glued headings. Outside code spans, the only letter–digit tokens left are the arXiv versions
`v1`–`v6` and the labels `K1`–`K4`.

## Adversarial pass (statements added or changed by `56a38d9` and `5e2b634`)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 `Π_k(Q)` self-injective, Dynkin, any field | `A₁`; `A₂` over `ℚ` and `𝔽₂`; triangle `Ã₂` | `A₁`: `Π = k`, dim 1. `A₂`: basis `e₁,e₂,a,a*`, dim `4`; `P₁`, `P₂` uniserial of length 2 with socles `S₂`, `S₁`, so the Nakayama permutation swaps them; the sign is irrelevant in char 2. `Ã₂`: `Π` infinite-dimensional, while Frobenius forces finite dimension (Grant2019 line 154) | holds; Dynkin hypothesis needed | none |
| Grant's hypotheses on `kQ` | Dynkin quiver; oriented 2-cycle | `kQ` basic (pairwise distinct tops `S_i`) and hereditary (acyclic). 2-cycle: `card(a⟶b)+card(b⟶a) = 2 > 1`, so not of finite type by the pinned Gabriel | consistent | none |
| Gabriel bullet (supplier contract) | one vertex; Kronecker `1 ⇉ 2` | one vertex: sum `0 ≤ 1`, graph `A₁`, finite type (one indecomposable). Kronecker: sum `2 > 1`, infinite type (ℙ¹-family) | matches pin lines 107–117 | none |
| Koszul ⇒ quadratic; Ext form | `A = A₀`; `k[x]/(x²)`, `deg x = 1`; `k[x]/(x³)`; `Z(A₁)`, `deg x = 2` | `A₀`: resolution of length 0, `V = 0`. `k[x]/(x²)`: terms in degrees `0,1,2,…`, Koszul, relation quadratic. `k[x]/(x³)`: degrees `0,1,3`, not Koszul, relation cubic. `Z(A₁)`: term 1 in degree `2 ≠ 1`, not Koszul, and §5.2 excludes it (≥ 3 vertices) | holds | none |
| Koszul dual = Yoneda algebra (Mazorchuk Cor 10.12) | `k[x]`; `A₂` path algebra; `𝔽₂[x]` | `k[x]^! = k[ξ]/(ξ²)` = `Ext^*(k,k)`, dims `1,1`. `A₂`: `dim A^! = 2 + 1 = 3` = `dim Ext^*(A₀,A₀)` (one `Ext¹(S₁,S₂)`). Same over `𝔽₂` | holds over any field; source is over `ℂ` | caveat added (784–786) |
| `h_A(t) h_{A^!}(−t)ᵀ = I` | `A₀`; `A₂` path algebra; `k[x]`; triangle | `I·I = I`. `(I+tE₂₁)(I−tE₂₁) = I`, and without the transpose the degree-one term is `E₂₁−E₁₂`. `(1−t)⁻¹(1−t) = 1`. `((1+t²)I+tA)(I+At+t²)⁻¹ = I` | holds; transpose needed | witness added (798–802) |
| Check: `A₂` path algebra Koszul | left modules = representations, `a : 1 → 2` | `P₁ = ⟨e₁,a⟩`, `P₂ = ⟨e₂⟩ = S₂` projective, `0 → P₂{1} → P₁ → S₁ → 0`, degrees `0,1` | holds | `⟨1⟩` → `{1}` |
| Check: `Z(A₂)` not Koszul | relations `aba = bab = 0` | dim `6 = 2+2+2`. Resolution `P₁ ← P₂{1} ← P₂{3} ← P₁{4} ← P₁{6}`, differential degrees `1,2,1,2`, term 2 in degree `3 ≠ 2`. Relations cubic, `ab, ba ≠ 0` | holds; agrees with Layer 3 Examples (lines 652–655) | none |
| Check: triangle `Z(Ã₂)` | `A = J − I` | `H₁ = A`. `H₂ = A²−I = J`, total `9`. Direct count: `6·2 = 12` paths minus 3 independent vertex relations (each in a different `e_i Π₂ e_i`) = `9`; diagonal `2−1 = 1`, off-diagonal 1. `H₃ = AJ − A = J + I`, total `12`, as in §5.3 line 853 | holds | count added (811–815) |
| §7.1 Cor 25 citation | `Γ = A₁` | `G_{A₁} = k[t]` with `t` in cohomological degree `−1`, so `RHom(k,k) = k[x]/(x²)` with `x` in cohomological and internal degree `2` = path degree 2 in `Z(A₁)` | matches EtguLekili2015 lines 1378–1382 | none |
| §8.2 `n`-spherical (K3)+(K4) | `E = O_X`, `X` a K3 surface, `n = 2` | `H^*(O) = k ⊕ k[−2]`; Serre duality with `K_X ≅ O` gives the pairing for every `F`, `j` | matches SeidelThomas2000 lines 609–613 | none |
| distinct nonadjacent middle factor | `i = j`; one edge `i ∼ j`; `A₃` ends | `i = j`: `e_i Z e_i = ⟨e_i, x_i⟩`, dim 2, nonzero. Adjacent: `e_i Z e_j = k·arrow`, dim 1. `A₃` ends: only length-2 paths with distinct endpoints, which vanish, so `0` | `i ≠ j` and nonadjacency both needed, as in the pinned theorem | "distinct" added (242, 1144, 1148, 1208) |

## Signatures

`#check @name` for all nine declarations of `Suggested.lean` was elaborated in one build (lines
appended temporarily, then removed). The printed types carry exactly the README's binders:
- `affine_graph_recognition`: `[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, `G.Connected`;
- `preprojectiveHilbertMatrix_recursion`: `[Field k] [Fintype V] [DecidableEq V] [DecidableRel G.Adj]`, `G.Connected`, the non-Dynkin hypothesis;
- `preprojective_cyclicQuotient_vanishes_iff`: `[Field k] [Fintype V]`, `G.Connected`;
- `isIntrinsicallyFormal_zigzagAlgebra_iff`: `[Field k] [Fintype V]`, `G.IsTree`;
- the definitions: `[Finite V]` and `[Field k]` as stated.

Nothing changed.

The imported Tau Ceti modules are byte-identical between `a91d3aa` and `358314d4`, except for
additions in `Preprojective/Grading.lean` and `RingTheory/Idempotents/Corner.lean`.

## Sources, ownership, direction

- Sources read through the sources service (legal arXiv copies):
  - Grant2019 (arXiv:1906.11817v2);
  - EtingofEu2005 (math/0512287v1);
  - Mazorchuk2010 (1011.0144v3);
  - EtguLekili2015 (1502.07922v6);
  - SeidelThomas2000 (math/0001043v2);
  - HuerfanoKhovanov2000 (math/0002060v2).

  A lookup of Beilinson–Ginzburg–Soergel found no legal copy. It is not cited and not requested. No
  `needs-references.toml` was written.
- The roadmap folder has no `sources.toml`, and this job may not create one, so Grant and Mazorchuk
  are recorded only in `## References`.
- Ownership: no new construction was added. Both new citations (Gabriel's theorem, the
  middle-factor vanishing) are Tau Ceti declarations at the pin. No notion moved down.
- Depcheck output:

```text
depcheck: 224 roadmaps, 2111 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Build and gate

`lake build TauCetiRoadmap.ZigzagPreprojective.Suggested`: exit 0, "Build completed successfully
(9062 jobs)". There are exactly four `declaration uses sorry` warnings (lines 70, 107, 141, 182) and
no errors. This build used the branch manifest's Tau Ceti `a91d3aa`.

Gate at `5e2b634`:

```text
gate ZigzagPreprojective: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

`roadmaps resolve` on the README: no unresolved citations and no Lean names found nowhere.
