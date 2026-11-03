# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at 4d9f8a5)

**Verdict:** needs changes

Incremental re-review of the 15 lines changed since e47aa4f: the new supplier contract `### From FilteredLocalGaloisGroups` and the rewrite of the §3.5 target "Local Galois centre-freeness" that imports `Z(G_K)=1` for finite `K/ℚ_p` from it. The import names a roadmap that exists nowhere, so the local base case of the centre-freeness induction is now unowned (R01). The remaining findings are P3: a proof sketch the repair left inconsistent with the import, and the three unrepaired notes of the previous report.

## R01 (P1) — The local centre-freeness is imported from a roadmap that does not exist

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:63–65` (“What FilteredLocalGaloisGroups must provide (gap:local-galois-centre-free): for every finite extension `K/ℚ_p` … `Z(G_K)=1`”) and `README.md:5892` (“For `K/ℚ_p` finite, `Z(G_K)=1` is supplied by FilteredLocalGaloisGroups Layer 1, which owns the stronger statement …”).

**Claim:** §3.5 consumes `Z(G_K)=1` for every finite extension `K/ℚ_p` as the base of its Artin-neighbourhood induction, and the Hom-reconstruction targets of Layer 3 (`README.md:6337–6355`, the centre-freeness needed for geometric conjugacy, which cites “Local Galois centre-freeness”) rest on it. The text now says this base is “supplied by FilteredLocalGaloisGroups Layer 1” and records a supplier contract with the slug `gap:local-galois-centre-free`.

**Witness:** No roadmap named FilteredLocalGaloisGroups exists anywhere a supplier may live: not under `TauCetiRoadmap/` or `Completed/` on main (929496d), not in any of the 440 open roadmap pull requests (`roadmaps grep -i FilteredLocalGaloisGroups` returns only this README's lines 63, 65 and 5892), not in the merge order, not among the board's packages, and no `design/plan.json` of this roadmap declares a `gaps` entry with that slug (the brief records none). Main's completed `LocalGaloisGroups` roadmap states nothing about the centre of `G_K` (its README has no occurrence of centre, center or derived series). So the citation “FilteredLocalGaloisGroups Layer 1” points at a section that exists nowhere, the gap is declared where the intake cannot read it, and the local case of Mochizuki 1999 Lemma 15.6 (source `m99`, author-copy p. 79, `6e7ffd16 lines 3163–3175`) has no owner. The previous head e47aa4f owned this case itself, by exactly that lemma's route (tame quotient centre-free; `H²(Γ_{K^tm},𝔽_p)=0` from `H²(K,𝔽_p(1))=𝔽_p` and its vanishing under a degree-p unramified extension; free pro-p groups are centre-free), with LocalFieldsRamification Layer 4, ClassFieldTheory Layer 5 and ProfiniteProPGroups Layer 4 as suppliers.

**Repair:** Restore ownership of the finite p-adic case to this roadmap: in §3.5 reinstate the e47aa4f statement and proof sketch for finite `K/ℚ_p` (“The tame quotient has trivial centre by its Frobenius/cyclotomic semidirect description. Use local duality and degree-p unramified restriction to kill `H²` of wild inertia. Its nonabelian free pro-p structure then kills a central element in the wild kernel.”), keep the finitely generated induction as now written, delete the `### From FilteredLocalGaloisGroups` contract and the Check “The local case is not reproved here”, and drop the clause about derived-series quotients `G_K^m`, which nothing here uses. If the author intends a separate roadmap to own the local case, that roadmap must first exist (on main, in an open pull request or as a design on the board whose `plan.json` declares `gap:local-galois-centre-free` with this slug); until then the statement is owned here.

**Repair test:** With the local case owned here, every input of the §3.5 induction is a target of this roadmap or a named supplier section that exists: the tame quotient structure (LocalFieldsRamification Layer 4, on main), local duality and `H²(K,𝔽_p(1))=𝔽_p` (ClassFieldTheory Layer 5, on main), freeness of a pro-p group with vanishing `H²` and centre-freeness of nonabelian free pro-p groups (ProfiniteProPGroups Layer 4, on main), centre-free hyperbolic geometric kernels (§3.5 itself) and the Artin-neighbourhood towers (Layer 1). `roadmaps resolve` then lists no unresolved supplier for line 5892.

## R02 (P3) — The geometric-conjugacy target still describes proving the local case here

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:6345`: “For p-adic K use the tame quotient and cohomological freeness/nonabelianity of wild inertia. For finitely generated extensions induct …”.

**Claim:** The target “Centre-freeness needed for geometric conjugacy” (line 6337) asserts `Z(G_K)=1` for p-adic local fields, finitely generated extensions and sub-p-adic fields, and its sketch proves the local case by the tame-quotient and wild-inertia route, while §3.5's new Check at line 5901 says “The local case is not reproved here: the tame-quotient and wild-inertia argument belongs to the supplier.” The two passages contradict each other on who proves the local case.

**Witness:** Lines 5901 and 6345 at this head, quoted above; line 6355 cites “Local Galois centre-freeness” as the input of line 6345's sketch.

**Repair:** Whichever way R01 is resolved, make line 6345 agree with §3.5: either “For p-adic K this is the local case of §3.5” (if the case is owned here) or “For p-adic K import the local case through §3.5” (if an existing supplier owns it). Under the repair of R01 the first wording applies.

## R03 (P3) — Supply the source manifest

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/` contains README.md, Suggested.lean and metadata.toml only; `sources.toml` is absent.

**Claim:** The bibliography (49 entries, including `m99`, which this review read from the author's RIMS copy) records no source-service provenance or verification status.

**Witness:** Folder listing at this head: three files, no `sources.toml`. The previous report's R01, unchanged.

**Repair:** Add `sources.toml` with one key per work, both locators for works read in preprint and published form, `cited_for`, and the service's `url`, `fetched_from`, `sha256`, `licence_class` and `status`; paywalled items stay `uncertified`. The `m99` entry's `fetched_from` is the author's RIMS page, licence class author-page.

## R04 (P3) — Remove the dangling dilogarithm identifier

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:7021`: “Thus `colemanDilogarithm=−I_(01)`; using the forward coefficient without the minus sign fails both the derivative and normalization.”

**Claim:** §5.0 defines the tensor-path dilogarithm as `Li₂⁰` with `Li₂⁰=−I_(01)`; the Check names `colemanDilogarithm`, defined nowhere and declared nowhere.

**Witness:** `grep colemanDilogarithm README.md` returns line 7021 only; `Suggested.lean` declares one theorem, `anabelian_isom`. The previous report's R02, unchanged.

**Repair:** Write “Thus `Li₂⁰=−I_(01)`”.

## R05 (P3) — Record the curve inputs in the supplier contracts

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:13` (“AlgebraicCurves Layers 4, 7, 9 and 12 supply …”) against the uses at lines 4183, 4191 and 4443 (“AlgebraicCurves Layer 0 … SchemeAndStackFoundations §4.9”).

**Claim:** The any-field curve branch of §1.9 consumes AlgebraicCurves Layer 0 (the relative algebraic constant field) and SchemeAndStackFoundations §4.9 (Stein factorisation), but the scope sentence and the SchemeAndStackFoundations contract paragraphs do not list them.

**Witness:** `4.9` occurs at lines 4183, 4191 and 4443 only, never in the contracts; line 13 lists Layers 4, 7, 9 and 12. The previous report's R03, unchanged.

**Repair:** Add Layer 0 to the AlgebraicCurves clause at line 13 and a clause for §4.9 to the SchemeAndStackFoundations contract.

## Previous findings

- R01 — not repaired: no `sources.toml` at this head; this report's R03.
- R02 — not repaired: README:7021 still reads “Thus `colemanDilogarithm=−I_(01)`”; this report's R04.
- R03 — not repaired: README:13 still lists “AlgebraicCurves Layers 4, 7, 9 and 12” and the contracts name no §4.9; this report's R05.

## Verified sound

### Gate, dependency order, folder and elaboration

- The worker's gate at 4d9f8a5 reports every counter zero with `build=0`; my own gate run on this head: every counter zero, `dirty=0`, `outside-folder=0`, `stray-files=0`, OK. `git diff --stat e47aa4f HEAD` touches README.md only (10 insertions, 5 deletions); nothing outside the folder changed.
- Independent dependency check: `depcheck: 205 roadmaps, 1681 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The check does not report the non-existent supplier of R01 because a “What X must provide (gap:…)” contract names no section of X; the absence is established by the searches recorded under R01, not by the tool.
- `Suggested.lean` (76 lines, one theorem) is byte-identical to the head the previous report read. `lake env lean` on a scratch copy with `#check @anabelian_isom` appended elaborated in 22 s with `sorry` as the only warning. The printed type keeps every binder: `Fact p.Prime`, both fields, `Algebra ℚ_[p] L`, the embedding, the finite-generation witness, both `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` instances, both `FiniteDimensional K (Cohomology (InvertibleSheaf.trivial _).obj 1)` instances, both genus bounds `2 ≤ Scheme.genus K _`, the `∀ e : P.Over ⊤ X ≌ P.Over ⊤ Y`, the constant-cover compatibility hypothesis and the `∃! f` conclusion. Nothing silently disappeared. The one-tactic probe of the previous report (`simp`, `infer_instance`, `rfl` all fail) stands, the file being unchanged.
- No data definition, no `set_option`; imports `Mathlib` and `TauCeti.AlgebraicGeometry.Cohomology.Genus`, whose object file is present in this worktree's pinned packages.

### Changed passages: sources opened

| Passage | Text and locator | Result |
|---|---|---|
| §3.5 Local Galois centre-freeness, finite p-adic case (README:5892) | Mochizuki 1999 (`m99`, author copy from the RIMS page), Lemma 15.6, author-copy p. 79, `6e7ffd16 lines 3163–3175`: for `K/ℚ_p` finite, `Γ_K` is centre-free; proof via the centre-free tame quotient, `H²(Γ_{K^tm},𝔽_p)=0` from `H²(K,𝔽_p(1))=𝔽_p` and its vanishing under a degree-p unramified extension, hence `Γ_{K^tm}` free pro-p and centre-free. | The statement imported is the lemma as stated. Its owner is the subject of R01. |
| §3.5, finitely generated induction (README:5892–5896) | Lemma 15.7, pp. 79–80, `lines 3177–3192`: if every open subgroup of `Γ_{K₀}` is centre-free, so is every open subgroup of `Γ_K` for `K/K₀` finitely generated; route: an extension of centre-free groups is centre-free, a surjective projective limit of centre-free groups is centre-free, `Spec L` is a limit of hyperbolic Artin neighbourhoods, hyperbolic curve groups are centre-free (Tamagawa Prop. 1.11). | Supports the roadmap's sketch (central element maps to the identity in the centre-free base, then lies in the centre-free geometric kernel). The hypothesis “every open subgroup” is met by importing the lemma for every finite `K/ℚ_p`, as the contract is worded. The locator “Lemmas 15.6–15.7, author-copy pp. 79–80” is exact. |
| Contract clause on derived-series quotients `G_K^m`, `m≥2` (README:65) | No source is cited for it in the README, and the named supplier does not exist. | Not verified; this roadmap states it uses nothing of it. Under the repair of R01 the clause is dropped. |

### Supplier citations and ownership for the changed passages

| Citation | Where it resolves | Result |
|---|---|---|
| FilteredLocalGaloisGroups Layer 1 (README:65, 5892) | nowhere: main (929496d) `TauCetiRoadmap/` and `Completed/`, 440 open pull requests, merge order, board packages | R01 |
| LocalFieldsRamification Layer 4 (the tame quotient), ClassFieldTheory Layer 5 (local duality, Brauer group), ProfiniteProPGroups Layer 4 (free pro-p groups), ProfiniteCohomology Layer 10 (README:5905) | main, the section anchors named in the links exist | Resolve; they are the inputs of the local case the repair restores |
| Completed/LocalGaloisGroups on main | its README: Layers 0–8 (carrier, cohomology, pro-p quotient, generator ranks, Demushkin dichotomy, orientation, marked presentations, exact rank) | States nothing about `Z(G_K)`; not an owner of the local case |

Ownership: `roadmaps grep` over main and the 440 open pull requests for centre-free, center-free and trivial centre finds no statement that the absolute Galois group of a p-adic local field is centre-free outside this roadmap; this roadmap is therefore the owner of the local case, as it was at e47aa4f. Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial pass

New rows carry computed values; rows for statements the diff leaves untouched are carried from the previous report (its table, which in turn carries the 108-row table with the exhaustive `S₃` test from the report before it).

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| Imported statement `Z(G_K)=1`, `K/ℚ_p` finite | `K=ℚ_p`, `p` odd; tame quotient `Gal(K^tm/K) ≅ Ẑ ⋉ ∏_{ℓ≠p} ℤ_ℓ(1)` | Frobenius acts on `ℤ_ℓ(1)` by `q=p`; a central `(a,b)` needs `b` fixed by `p` (so `(p−1)b=0`, `b=0`) and `a` acting trivially on `∏ℤ_ℓ(1)`, i.e. `p^a=1` in every `ℤ_ℓ^×`, so `a=0` | Tame quotient centre-free; a central element lies in wild inertia. Consistent with Lemma 15.6. |
| Same, wild kernel | `H²(K,𝔽_p(1))=𝔽_p` (Brauer group `p`-torsion); `K'/K` unramified of degree `p` | restriction `Br(K)[p]→Br(K')[p]` is multiplication by `[K':K]=p` on `ℚ/ℤ`, so zero | `H²(Γ_{K^tm},𝔽_p)=0` as a direct limit over unramified layers; free pro-p; centre trivial unless rank ≤1. Rank: `H¹(Γ_{K^tm},𝔽_p)` is infinite (wild inertia is not procyclic since `K^tm` has infinitely many degree-p extensions), so nonabelian free. Retain. |
| Same, `p=2` | `K=ℚ_2`, tame quotient `Ẑ ⋉ ∏_{ℓ≠2} ℤ_ℓ(1)` | Frobenius acts by `2`; `2≠1` in every `ℤ_ℓ^×` for `ℓ` odd (`2` is a unit of infinite order) | Centre-free for `p=2` as well; no special case. Retain. |
| Finitely generated induction, one step | `1→Δ→Π→G→1` with `Z(Δ)=Z(G)=1` | `z∈Z(Π)`: image central in `G`, so `=1`, so `z∈Δ`; `z` commutes with `Δ`, so `z∈Z(Δ)=1` | The sketch's two sentences are exactly this computation. Retain. |
| Same, wrong model: a non-hyperbolic fibre | fibre `𝔾_m` (`g=0,r=2`, `2g−2+r=0`), `Δ=Ẑ(1)` abelian | `Z(Δ)=Δ≠1`; the step fails | Hyperbolicity of the Artin-neighbourhood fibres is used, as §3.5 and Mochizuki's proof state. Retain. |
| Same, open-subgroup hypothesis of Lemma 15.7 | open `U≤G_K`, `K/ℚ_p` finite | `U=G_{K'}` with `[K':K]<∞`, so `K'/ℚ_p` finite | The contract's “for every finite extension `K/ℚ_p`” covers every open subgroup. Retain. |
| Corollary logic `Z(G_K^m)=1 ∀m≥2 ⇒ Z(G_K)=1` (README:5892 parenthesis) | `G_K` prosolvable, `∩_m G_K^{[m]}` | every finite quotient `G_K/N` solvable of derived length `d`, so `G_K^{[d]}≤N`; `∩_m G_K^{[m]}≤∩N=1` | A central element trivial in every `G_K^m` is trivial. The parenthesis is correct; `m=1` is rightly excluded (`G_K^1` is abelian, centre everything). |
| Contract clause `Z(G_K^m)=1` for `m≥2` | `m=2`, the metabelian quotient | no source cited; not computed here | Not verified; unused by this roadmap. Dropped under R01's repair. |
| Consumer README:6345 sketch | the same local case | sketch says “use the tame quotient …”; §3.5 Check says it is not proved here | Inconsistent: R02. |
| Hoshi pro-p non-example, SectionConjecture Checks for `Spec k`, `P¹`, `G_m`, abelian varieties, Reichardt–Lind | as in the previous report | carried | Carried from the previous report. |
| §0.11 twisted kernel and its H¹, §0.13 twisted quotients, §0.18 finite-quotient colimit, §0.30 abstract embedded kernels, §0.31 invariant orbit transport | seeded sample, untouched by the diff | carried | Carried from the previous report. |
| §1.2 tangential specialization, §2.3 two finite towers, §2.4 universal objects and Hodge filtration, §3.7 geometric sections and line bundles | seeded sample, untouched | carried | Carried from the previous report. |
| §4.8 local conditions and Selmer varieties, §4.9 tangential Selmer | seeded sample, untouched | carried | Carried from the previous report. |
| §6.3 height representation, §6.6 local terms and the height pair, §6.8 potentially good reduction, §7.4 conditional routes | seeded sample, untouched | carried | Carried from the previous report. |
| Headline `anabelian_isom` | genus-2 curve, identity versus hyperelliptic involution | `+I` and `−I` on `H⁰(Ω¹)`, distinct outer classes; `∃!` is uniqueness within one class | Carried from the previous report; the Lean is unchanged and re-elaborated here. |

### Shape of the changed passages

The rewritten target keeps its statement, hypotheses line, sketch, Checks, locator and “Use” list in the README's order; no process words, pull-request numbers, LaTeX or `lemma` were introduced; the gate's scanners agree. The new contract subsection follows the `## Exact supplier contracts` shape. The `## Scope and ownership` section does not list the new deferral (it has no occurrence of FilteredLocalGaloisGroups); under the repair of R01 none is needed.

## Not verifiable

- The passages the diff does not touch were not re-examined; the previous report's unverifiable items stand: Hadian's thesis, Labute 1967, the published Achinger, Serre Chapter V and Stix 2013 locators, and Kim 2008's published pagination.
- The clause on derived-series quotients `G_K^m` in the new contract cites no source and its named supplier does not exist, so it was not checked against a text.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- none
