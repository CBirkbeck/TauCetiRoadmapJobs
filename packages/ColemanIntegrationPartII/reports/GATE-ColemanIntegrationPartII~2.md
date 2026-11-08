# GATE-ColemanIntegrationPartII~2: answers to human review

One unanswered comment, making one point (H01). No file was changed; no commit was made. The branch stays at `4acd07e`.

## H01 (roed-math) — answered

The locations are confirmed at `4acd07e`. In `TauCetiRoadmap/ColemanIntegrationPartII/README.md`, the annular double index B_e is defined in §2.2 (line 290), with its transport laws in §2.3. The graph correction before identification is §3.3 (line 512), and the corrected cohomological pairing B_h is §3.4 (line 532). §4.4 (line 828) proves that the point-sum Σ_{x∈Z} B_x(F,G) equals that B_h. §§5.1–5.5 (lines 858–944) are the labelled triple index T_e(F,G;H), and line 110 gives the same layer split. So PadicHodgeRegulators README line 106 (head `b4b7727`) should cite §§2.1–2.3 for annular double indices, §§3.3–3.4 for the corrected double pairing (not §§4.2–4.4, which give the identification, the valuation term and the point-sum identity against B_h), and §§5.1–5.5 for the triple index. That is a change to PadicHodgeRegulators, not to this roadmap.

Other places in this README that cite double/triple-index or pairing sections (lines 112, 735, 796, 886, 1016, 1040, 1226, 1236) were checked and agree with the section contents above, so no internal citation needed repair.

## Build

`lake build TauCetiRoadmap.ColemanIntegrationPartII.Suggested`: **Build completed successfully (8988 jobs)**. There are two warnings, both `declaration uses 'sorry'`, at `Suggested.lean:83:8` (`Graph.harmonic_exact_decomposition`) and `Suggested.lean:105:8` (`NaturalIntegration.properAlbanese_exists`).

## Gate

`gate ColemanIntegrationPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Direction check

`gate --depcheck … --name ColemanIntegrationPartII --movable` output, in full:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.

## Elaborated signatures

The job's pre-computed signature file was empty because the pinned Tau Ceti Albanese module had not been built. After the build above, the four `#check @…` lines were appended to `TauCetiRoadmap/ColemanIntegrationPartII/Suggested.lean`, elaborated once with the permitted build command, and the file was restored with `git checkout` (worktree clean afterwards). Each elaborated type carries its binders in its own signature; the file has no section `variable`s.

- `Graph.edgeDifferential`: `{V E k} [AddCommGroup k] (G : Graph V E) (tail head : ↑G.edgeSet → ↑G.vertexSet) (f : ↑G.vertexSet → k) : ↑G.edgeSet → k`. This matches README §1.1 (line 134), which allows any additive commutative coefficient group.
- `Graph.edgeDivergence`: `[Field k] [CharZero k] … [Fintype ↑G.edgeSet] … (length : ↑G.edgeSet → {q // 0 < q}) (c : ↑G.edgeSet → k) : ↑G.vertexSet → k`. This matches §1.1, which needs only a finite edge set and positive rational lengths.
- `Graph.harmonic_exact_decomposition`: `[Field k] [CharZero k] [Fintype ↑G.vertexSet] [Fintype ↑G.edgeSet]`, the incidence hypothesis `∀ e, G.IsLink ↑e ↑(tail e) ↑(head e)`, then `∃! hr` with zero divergence, an exact second part and `c = hr.1 + hr.2`. This matches §1.2 (lines 161, 171).
- `NaturalIntegration.properAlbanese_exists`: `[Field k] [CharZero k] (X : Over (Spec ↧k)) [Smooth X.hom] [LocallyOfFiniteType X.hom] [QuasiCompact X.hom] [IsSeparated X.hom] [GeometricallyConnected X.hom] (x₀ : 𝟙_ _ ⟶ X), ∃ A a, IsAlbanese x₀ a`. This matches §4.0b (line 637).

Nothing changed.

## Citation leads

`citations.md` listed five names. Four of them are this roadmap's own `Suggested.lean` declarations: `Graph.edgeDifferential`, `Graph.edgeDivergence`, `Graph.harmonic_exact_decomposition` and `NaturalIntegration.properAlbanese_exists`. All four are declared, and their elaborated types are shown above. The fifth, `AnnulusLogRing.changeParam` (README line 278), is ColemanIntegration's L0 API and is listed at ColemanIntegration README line 570, at the head of its open roadmap pull request. All five resolve.

## Ownership

No construction, target or citation was added or changed, so no new ownership question arose.

## Adversarial pass (statements located by H01)

No statement was added or changed. The pass below recomputes the statements whose locations H01 concerns. It confirms that §2.2 is a two-argument (double) index and §5.2 a three-argument (triple) operation, and that the stated laws hold on the instances tried. B_e(f+aL, g+bL) = Res(f dg) + b Res(f dz/z) − a Res(g dz/z), with dL = dz/z.

| Statement | Instance | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| §2.2 alternating, B(F,F)=0 | F = z⁻¹ + 2L | Res(z⁻¹·(−z⁻²)dz) + 2Res(z⁻² dz) − 2Res(z⁻² dz) = 0 | 0 | holds | none |
| §2.2 antisymmetry, Laurent-first | F = z⁻¹, G = z | B(F,G) = Res(z⁻¹ dz) = 1 | −B(G,F) = −Res(z·(−z⁻²)dz) = 1 | holds | none |
| §2.2 B(C,G) = C Res(dG) | C = 3, G = L | 0 + 1·Res(3 dz/z) − 0 = 3 | 3·Res(dz/z) = 3 | holds | none |
| §2.2 B(C,G) = C Res(dG), exact G | C = 3, G = z⁻¹ | Res(−3z⁻² dz) = 0 | 3·Res(−z⁻² dz) = 0 | holds | none |
| §2.2 B(F,(g,0)) = −Res(g dF) | F = L, g = 1+z | −Res((1+z)dz/z) = −1 | −Res((1+z)dz/z) = −1 | holds | none |
| §2.2 B(F,(g,0)) = −Res(g dF) | F = z⁻¹+L, g = z | Res(z⁻¹ dz) − Res(dz) = 1 | −Res(z(−z⁻²+z⁻¹)dz) = 1 | holds | none |
| §5.2 cyclic relation, degenerate | F=G=H=1, distinct labels, I(R dS) = c_RS, c_RS + c_SR = 1 | each T = B(1, c) = Res(1·d c) = 0; sum 0 | 0 | holds | none |
| §5.2 cyclic relation | F = z⁻¹, G = H = z (distinct labels), I(G dH) = z²/2 + C, I(H dF) = −L + C′ | B(z⁻¹, z²/2+C) = Res(dz) = 0; B(z⁻¹, z²/2−C) = 0; B(z, −L+C′) = −Res(dz) = 0 | sum 0 | holds; the choices C, C′ do not affect it | none |

## Sources

No source was fetched and no locator changed. `needs-references.toml` was not written.
