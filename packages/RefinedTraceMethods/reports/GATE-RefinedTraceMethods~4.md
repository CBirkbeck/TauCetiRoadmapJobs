# GATE-RefinedTraceMethods~4: answers to human review of head 0e4370b

Commit `f39dc403` on the pull-request branch: "RefinedTraceMethods: review repairs (right-B perfection for the mixed Morita comparison; triangle additivity)". Not pushed. Only `TauCetiRoadmap/RefinedTraceMethods/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/RefinedTraceMethods/README.md` §1.6, line 320: "a perfect A–B bimodule X defines C(X) … invariant under triangles" → "a DG A–B-bimodule X whose underlying right DG B-module `X_B` is perfect (compact in D(B)) and homotopically projective", i.e. an object of Keller's `rep(A,B)`. The line now says explicitly that perfection over `Aᵒᵖ⊗_k B` does not suffice. The same domain is kept for the identity, for composition with Y in `rep(B,A′)`, and for triangles, where "invariant under triangles" becomes the additivity C(X)=C(X′)+C(X″) of Keller Theorem 2.4(b) (ke line 329). Line 326 (the proof route, the second occurrence) is changed the same way. The evidence: Keller defines `hrep(A,B)` by smallness and closedness of the restriction to B (ke lines 239–241), and inverts `C(β_X)` from exactly that smallness via Lemma 1.2 (ke lines 311, 319–322). DGAInfinity on main uses "perfect bimodule" in the enveloping sense (its Layer 9, smoothness: "diagonal bimodule is perfect in `D(Cᵒᵖ⊗C)`"), so the old wording pointed at the wrong domain. The reviewer's counterexample is now a negative control at line 328 (A=B=k[t], X=A⊗_k B: `β_X(1)=p₀=VU−UV`, so `HH_0(β_X)` sends 1 to 0).

Also changed in the same statement:
- Line 322: the old hypothesis line ("A, B k-algebras, Morita equivalent over k") contradicted the "more generally" clause. It now reads: A, B, A′ are k-flat DG algebras. In the first clause X is homotopically projective over B and `−⊗^L_A X` is an equivalence, which makes `X_B` automatically perfect (Keller Theorem 2.6, ke lines 561–563). Flatness stays, because Keller Remark 2.6(b) (ke lines 569–571) shows that the theorem fails without it.
- Line 320: the identification of `rep(A,B)` with a full subcategory of `D(Aᵒᵖ⊗_k B)`, and of composition with `⊗^L_B`, is stated only under Keller Lemma 2.3's hypotheses (ke lines 254–257): A homotopically projective over k, and A′ k-flat.
- Line 324: the locators now include Lemma 1.2 (p. 3), Lemma 2.3 (p. 6), Theorem 2.4 (p. 7) and Theorem 2.6 (p. 11).
- Line 330: the *Needs:* line now also lists DGAInfinity Layer 6 (derived Morita theory and compact generators).

## H02 (CBirkbeck) — answered

The stale text is in the pull-request description, which this job may not edit. The roadmap itself already treats both suppliers as roadmaps on main. README line 11 links to `TopologicalKTheory` (T1–T5) and `CharacteristicClasses` (C3, C5, C6) at `blob/main`, and line 57 cites TopologicalKTheory T1.6, T2.1, T2.3, T2.5, T3, T4 and T5.1. Both folders are present on origin/main 546d9e4, with headings T1–T5 and C3, C5, C6, and every cross-roadmap citation in the README resolves. The description's list of outstanding prerequisites should drop TopologicalKTheory and CharacteristicClasses when the worker refreshes it.

## Adversarial pass on the changed statement (§1.6, Morita invariance)

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| `C(β_X)` invertible when `X_B` is perfect | A=B, X=B; `End_B(B⊕B)=M_2(B)`, β the upper-left corner | `HH_0`: b ↦ class of diag(b,0); trace gives b, so B → `M_2(B)/[,]≅B` is the identity | holds | none |
| Same, with only enveloping-algebra perfection | k a field, A=B=k[t], X=A⊗_k B (rank 1 over `Aᵒᵖ⊗B`, countable rank over B) | VU=1, UV=1−p₀, `β_X(1)=p₀=VU−UV∈[E,E]`; `HH_0(β_X)(1)=0` while 1≠0 in `HH_0(B)=k[t]` | old wording false | hypothesis is now `X_B` perfect; instance added as a negative control (line 328) |
| Identity | X = A as an A–A bimodule; α the lower-right and β the upper-left corner of `M_2(A)` | both corners send a to a class of trace a in `HH_0(M_2(A))≅A/[A,A]`, so C(A)=id on `HH_0` | holds | none |
| Zero bimodule | X=0 | `End_B(B)=B`, β=id, α=0, so C(0)=0; the triangle 0→X→X→0 gives C(X)=0+C(X) | holds | none |
| Additivity on a split triangle | A=B, X=B⊕B, so B⊕X=B³ | α(b)=diag(0,b,b) has trace 2b and β(b)=diag(b,0,0) has trace b, so C(X)=2·id=C(B)+C(B) on `HH_0` | holds | "invariant under triangles" → additivity |
| Composition needs right perfection of both factors | X=k[t] as a k–k[t] bimodule (the unit), Y=k as a k[t]–k bimodule with t↦0 | `Y_k=k` is perfect; `X⊗_B Y=k`; on `HH_0`, 1 ↦ 1 ↦ 1, so C(Y)∘C(X)=id=C(k) | holds | none |
| Same, with Y=k[t] as a k[t]–k bimodule | `Y_k=k[t]` has infinite k-dimension | Y is not in `rep(k[t],k)`, so it is excluded from the domain | hypothesis needed | stated domain `rep(B,A′)` |
| Morita clause | A=k, B=`M_2(k)`, X=k² (row vectors) | `−⊗X` is an equivalence; `X_B` is a summand of B, so perfect; `HH_0`: k → `M_2(k)/[,]≅k` sends 1 ↦ trace of a rank-1 idempotent = 1, an isomorphism | holds | none |
| Flatness in the Morita clause | a quasi-isomorphism of non-flat DG algebras (ke Remark 2.6(b)) | the equivalence `D(A)≃D(B)` exists, but the cyclic conclusion fails without flatness | hypothesis needed | kept, and stated on line 322 |
| `rep(A,B)` ⊂ `D(Aᵒᵖ⊗B)` identification | k=ℤ, A=ℚ (flat, not homotopically projective) | `0→Hom(ℚ,ℤ)=0→Hom(ℚ,ℚ)=ℚ→Hom(ℚ,ℚ/ℤ)→0` has cokernel `Ext¹(ℚ,ℤ)≠0`, so ℚ is not homotopically projective | Lemma 2.3's hypothesis is genuinely stronger than flat | identification stated only for A homotopically projective (e.g. k a field) |
| Generality | Keller Theorem 2.4 holds for arbitrary DG k-algebras with naive complexes (ke line 83) | the roadmap's C(A) is derived HH, computed from a k-flat resolution | matches the roadmap's object | resolution sentence on line 322 |

Context: `Suggested.lean` contains no declarations (namespace and docstring only), so there was nothing to `#check` and no elaborated type to compare. The headline theorems are not statable at the pins (the docstring lists the missing carriers). The change does not touch that boundary.

## Ownership, direction and citations

- **Ownership.** `roadmaps grep` for Keller's cyclic Morita functor (`rep(A,B)`, `β_X`, Keller's paper title, and Morita near cyclic homology or mixed complexes) finds it only in this roadmap, on main and at the 354 open heads. DGAInfinity Layers 6 and 8 supply the ordinary derived Morita theory and the Hochschild invariance; they are cited, not restated.
- **Sources.** No new source was cited: Keller is already the manifest key `ke`. No `needs-references.toml` was written.
- **Direction.** `gate --depcheck … --movable` printed `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

## Build and gate

- `lake build TauCetiRoadmap.RefinedTraceMethods.Suggested`: `Build completed successfully (8976 jobs).`
- Gate after the commit: `gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
