# Review of QuiverRepresentations (pull request #2479 at 061509b)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** accepted

Incremental re-review of the 42 lines changed since `5a4ca69`, and of the pull request's title and description against this head. No finding. README line numbers are at `061509b`; `TauCeti/` paths are at the pinned Tau Ceti.

## Previous findings

- R01 — repaired: `README.md:51–52` now reads "uniqueness extending any specified isomorphism of the right endpoints, in any preadditive balanced category,".
- R02 — repaired: `README.md:953–956` "Any almost-split sequence of A-modules ending at a finitely generated module M has left end isomorphic to D Tr …, which needs no locality hypothesis"; `README.md:974` drops "finite-length locality".
- R03 — repaired: `README.md:122`, `517–519` and `1030` cite ARS II.3, p.37 (existence, uniqueness), with II.4.1(c), p.40, and II.4.6, p.42 (finite generation).
- R04 — repaired: `README.md:805–806` cites BGP Lemma 2.1(1), p.26, Lemma 2.2(1), p.27, with §3 Note 1, p.30, and Etingof v5 Definitions 5.11 and 5.13, p.87; Definition 5.20 and Remark 5.21 moved to the reflection sentence (`README.md:812`).

## Verified sound

Conventions as in the README: A₂ is 1 → 2 with arrow a, left modules; S₁ = (k,0), S₂ = (0,k), P₁ = (k → k); q(x) = ∑xᵢ² − ∑ₐ xᵢxⱼ, B(x,y) = q(x+y) − q(x) − q(y).

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Scope 51–52 and contract 341–345: `exists_iso_τ₃_eq` | pinned signature; rescaled dual-number sequence | binders `[Preadditive C] [Balanced C]`, `hS`, `hS'`, `e` only (`Uniqueness.lean:92,129`); (a⁻¹,1,1): (af)a⁻¹ = f, g·1 = 1·g | pass | none |
| §6.3 953–956: left end ≅ D Tr | A₂; dual numbers; pin | 0→S₂→P₁→S₁→0, τS₁ = S₂, End(S₂) = k; 0→k→A→k→0, D Tr k ≅ k; `nonempty_iso_X₁` (`Uniqueness.lean:145`) and `exists_isAlmostSplit_arTranslate` (`Sequence.lean:70`) both in `ModuleCat A`, so comparable | pass | none |
| §6.3 M finitely generated is needed | pin | `ModuleCat.nonempty_iso_arTranslate` (`Translate.lean:80`) and `Sequence.lean:70` carry `[Module.Finite A M]`; the sentence states it | pass | none |
| §3.1 517–519: finitely generated injective envelope (ARS II.3, II.4.1(c), II.4.6) | dual numbers; A₂ | soc A = kε simple, envelope of k is A, dim 2 = dim D(A*); envelope of S₂ is P₁, dim 2 = dim D(e₂A), e₂A = ⟨e₂, a⟩ | pass | none |
| §5.2 `exists_rootPairing_titsForm`, roots = integral vectors of q-value 1 (BGP 2.1(1), 2.2(1), §3 Note 1; Etingof 5.11, 5.13) | A₂; Kronecker (control) | A₂: q = 1 on ±(1,0), ±(0,1), ±(1,1), 6 roots; q(1,−1) = 3; Cartan off-diagonal 0 − (1+0) = −1 = 2(α,β); Kronecker q(1,1) = 0, excluded by `PosDef` | pass | none |
| §5.2 812: reflection preserves q and ℤ^Q (Etingof 5.20, 5.21) | general α with q(α) = 1, c = B(v,α); A₂ | q(v − cα) = q(v) − c² + c²q(α) = q(v); s_{e₁}(e₂) = e₂ + e₁, q = 1 | pass | none |

The rows for the untouched statements stand as in the previous review, of `5a4ca69`.

- Source locators checked against the cached texts: 10 of 10 as stated. `ars line 1701–1707` (II.3, p.37), `ars line 1805–1810` (II.4.1(c), p.40), `ars line 1893–1895` (II.4.6, p.42); `bgp line 357–358` (Lemma 2.1(1), p.26), `bgp line 407` (Lemma 2.2(1), p.27), `bgp line 527–529` (§3 Note 1, p.30); `etingof line 3863–3866` (5.11), `etingof line 3886–3889` (5.13, p.87), `etingof line 3977–3982` (5.20, 5.21, p.89). The README flags none as unverified.
- Library declarations opened at the pin: `TauCeti/CategoryTheory/AlmostSplit/Uniqueness.lean:92,129,145`, `TauCeti/CategoryTheory/AlmostSplit/Basic.lean:593` (`TauCeti.IsLeftAlmostSplit.isLocalRing_end`, named in the description), `TauCeti/Algebra/Category/ModuleCat/AuslanderReiten/Sequence.lean:70,97`, `TauCeti/Algebra/Category/ModuleCat/AuslanderReiten/Translate.lean:80`.
- Cross-roadmap citations: the diff adds, removes or changes none; the worker's citation resolver lists none unresolved.
- Gate rerun at `061509b`: every counter 0, `OK`. Dependency check: `depcheck: 236 roadmaps, 2517 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing outside the folder is changed.
- Elaboration: `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` lines: four `declaration uses sorry` warnings, no error; the file is identical to the one read at `5a4ca69` and the elaborated types equal the README statements.
- Pull-request text against `origin/main...HEAD` (49 lines, `README.md` only, 0 headings, 0 Lean declarations): title and each sentence of the description agree with the head — the four places that drop locality, the three ARS and one BGP/Etingof locator changes, "seven layers" (Layers 0–6), no section, supplier or declaration change. The summary's fourth item, "the quiver-level reading of almost-split existence and endpoint uniqueness", matches the README Summary's "reads the pinned … almost-split sequences", which is consumed, not a `Suggested.lean` statement.
- Residual search: no remaining "local-endomorphism", "finite-length locality", "ARS II.4.1" alone or "BGP §2" in the README.
- Remark: `README.md:814` is left 155 characters long by the reflow.

Overlap check: read ArtinAlgebras, GrothendieckEulerForms, ZigzagPreprojective (main); the overlap list at this head names no shared id, no dropped id and no other pull request changing this roadmap; nothing shared: ArtinAlgebras owns the Artin-algebra AR theory, GrothendieckEulerForms the K₀ and Cartan comparison, both as consumers here.

Source independence: changed passages only; 6 passages compared with 3 sources (ars, bgp, etingof), none shared; largest share ass, 25 of 47 locators as counted at `5a4ca69` (the change adds ARS, BGP and Etingof locators only); no layer added, removed or reordered, so the contents comparison with ass stands: independent.

Research link: The headlines are Gabriel's theorem in the reflection-functor form of Bernstein–Gelfand–Ponomarev (1973), the bound-quiver presentation and Auslander–Reiten theory as in Assem–Simson–Skowroński (2006) and Auslander–Reiten–Smalø (1995), and the standard resolution of Crawley-Boevey (1992); rests on the README's references and the texts read.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Licence.** `ass` and `ars` were read from the teaching copies linked at README.md:1027 and 1032 (a course page, manifest class `institutional`); whether the publisher authorises those copies was not settled.
- **Licence.** `cbquiv` (README.md:1036–1039) is unpublished lecture notes on the author's page; it is cited for the standard resolution and consequences (1) and (3) only.
