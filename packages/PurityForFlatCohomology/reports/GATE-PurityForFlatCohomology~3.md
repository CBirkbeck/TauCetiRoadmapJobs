# GATE-PurityForFlatCohomology~3: answers to the comment of 2026-11-15T07:50:37Z

One comment (mycaule) on head `160e354`. It makes nine points:

- H01: the overlap with GroupSchemesOverABase;
- H02: the dropped-names premise and the request for a decision;
- H03–H07: proposed edits 1–5;
- H08: the question of what GroupSchemesOverABase lacks;
- H09: the alternative route.

This job adds one commit, `057858f`, which touches only `TauCetiRoadmap/PurityForFlatCohomology/README.md` (54 insertions, 36 deletions). `Suggested.lean` is unchanged.

Facts checked for every point:

- **GroupSchemesOverABase** (#1522, head `4a23b23`):
  - its `README.md` lines 41–48 own `D_S(M)` (1.1–1.5), groups of multiplicative type and tori (2.1–2.3) and 2.7, over an arbitrary base;
  - its lines 77–80 say its Layers 1–3 extend ReductiveGroups Layer 9D to an arbitrary base;
  - its Downstream consumers (lines 1438–1441) name §§7.12a–7.12e here.
- **The dropped-names list** now has 13 names, and GroupSchemesOverABase is not among them. The list was last changed on 2026-11-09 at 17:26, after `ebfcd46` (16:35), the commit that restored §§7.12a–7.12e here. PRREVIEW~10 had counted 15 names, GroupSchemesOverABase among them.
- **The merge order:** `ORDER.txt` does not list GroupSchemesOverABase, nor any of mycaule's 27 open roadmaps. GroupSchemesOverABase's suppliers are all on main or at `ORDER.txt` lines ≤ 68:
  - NeronModelsAndSemistableAbelianVarieties 68, FiniteFlatGroupsAndIntegralPadicHodgeTheory 67, InverseGaloisAndArithmeticFundamentalGroups 54, AbelianSchemesAndArithmeticModuli 43, AlgebraicModuliForArithmeticGeometry 36;
  - ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations, ModularCurves, SchubertGeometry and EquivariantIntersectionTheory are on main.

  It names this roadmap only as a consumer. This roadmap is at line 224.
- **ReductiveGroups on main** (`8ad4192`) has changed since this branch forked (merge base `eaf17b1`, 2026-11-07). Commit `b06dcdf` (#1676, 2026-11-10) added to Layer 9D, bullet *Relative reductive groups over an arbitrary affine base*, `TauCetiRoadmap/ReductiveGroups/README.md` line 5036: "The multiplicative-type theory over `S` is owned here", for `S = Spec R`. Its targets there are:
  - the fppf-local definition and its agreement over `Spec k` with `TauCeti.multiplicativeTypeAffineGroupSchemeProperty` (line 5047);
  - closed immersions from monomorphisms (line 5053);
  - fppf closed subgroups of multiplicative type;
  - the anti-equivalence with étale locally constant sheaves on the small étale site, and étale-local splitting (line 5063);
  - isotriviality over normal bases (line 5066).

  Its Scope (lines 94–95) says the same. So the old README lines 211–217 and the Downstream bullet were false against main, and they ran the supply direction backwards.

## H01 (mycaule) — answered

The overlap is confirmed: GroupSchemesOverABase 0.1, 1.1–1.5, 2.1–2.3 and 2.7 (its `README.md` lines 285–607 at `4a23b23`) state the core of §§7.12a–7.12e at the same generality: arbitrary `S`, `D_S(M)` by base change of `TauCeti.DiagonalizableGroup.groupScheme`, fppf covers with varying `M_i`, and torsion-free `M_i` for tori. The overlap has a third party: ReductiveGroups Layer 9D on main owns this theory over affine bases (lines 5036–5073). Under the rule that an open roadmap cites main, both open roadmaps owe it a citation for the affine case. This README now gives it (H03–H06).

## H02 (mycaule) — answered

The premise has changed. GroupSchemesOverABase is no longer on the dropped-names list, which has had 13 names since 2026-11-09 17:26, so the gate's `dropped` check no longer refuses a mention. It is still absent from `ORDER.txt`, and placing it there is the human decision this comment asks for. Placed after its last supplier (line 68), it would come before this roadmap (line 224) with no cycle, since it names this roadmap only as a consumer.

## H03 (mycaule) — applied differently

Old lines 211–217 are deleted:

- What they said about ownership here is already in the Scope's owned list (now `README.md:91–94`). That list now says the arbitrary-base theory extends ReductiveGroups Layer 9D's theory over affine bases.
- A new "Owned elsewhere" bullet (`README.md:135–144`) assigns ownership correctly:
  - diagonalizable groups, groups of multiplicative type and tori over a field go to ReductiveGroups Layer 4;
  - groups of multiplicative type over an affine base go to ReductiveGroups Layer 9D, with its targets listed;
  - §§7.12a–7.12e keep the arbitrary-base form, the same definition of multiplicative type and the character sheaf on the big étale site, and cite Layer 9D for its affine-base statements.

This roadmap does not cite GroupSchemesOverABase yet, because its placement in `ORDER.txt` is still pending (H02). The proposed replacement text repeats "ReductiveGroups owns these groups over a field (its Layer 4)", which is stale against main: it would need to name Layer 9D over affine bases.

## H04 (mycaule) — applied differently

Summary, `README.md:68–70`: "a base … (§§7.12a–7.12e) is supporting theory, specified here" now reads "an arbitrary base scheme … (§§7.12a–7.12e, extending ReductiveGroups Layer 9D's theory over affine bases) is supporting theory, specified here". It does not name GroupSchemesOverABase, pending H02. The supplier diagram, line 42, now lists ReductiveGroups beside AlgebraicModuliForArithmeticGeometry, with the arrow column unchanged.

## H05 (mycaule) — applied differently

Layer 7 introduction, `README.md:2214–2217`: "§§7.12a–7.12e develop … (SGA 3 VIII–X);" now continues "…, extending ReductiveGroups Layer 9D's theory over affine bases;". The wording "recall from GroupSchemesOverABase" is not adopted, pending H02.

## H06 (mycaule) — applied differently

A new `### From TauCetiRoadmap.ReductiveGroups` contract (`README.md:615–626`) consumes Layer 9D's affine-base theory and Layer 4. The citation is placed where each statement restates Layer 9D:

- §7.12c, `README.md:2756–2758` and *Needs* `:2767–2768`: "over an affine base, the passage from fppf-local to étale-local diagonalizability is Layer 9D's étale-local splitting; the theorem here is its form over an arbitrary base, with fpqc covers admitted";
- §7.12c, API bullet `:2800–2805`: "being of multiplicative type, resp. a torus, agrees with …" becomes:
  - the torus comparison, a target here;
  - the multiplicative-type comparison, used as Layer 9D states it;
- §7.12d(b), `:2857–2858`: Layer 9D states the anti-equivalence on the small étale site over an affine base, and (b) is its big-site form over an arbitrary base;
- §7.12e(b), `:2899–2902` and *Needs* `:2918`: over an affine base it is Layer 9D's monomorphism criterion with a target of multiplicative type, and being a closed immersion is local on `S`;
- Layer 7 Dependencies, `:3056`.

There is no GroupSchemesOverABase contract yet, pending H02.

## H07 (mycaule) — applied

The ReductiveGroups bullet of **Downstream consumers** (old lines 3474–3479) is deleted. The reason differs from the comment's: ReductiveGroups is on main, and its Layer 9D already owns the multiplicative-type theory over affine bases (line 5036). A roadmap on main never imports from an open one. `grep` finds no other text asking ReductiveGroups to import from this roadmap.

## H08 (mycaule) — answered

These are what §§6.3, 7.13–7.15 and Layer 8 use from §§7.12a–7.12e that GroupSchemesOverABase 0.1, 1.1–1.5, 2.1–2.3 and 2.7 do not state:

1. The points of `D_S(M)` (`TauCeti.DiagonalizableGroup.schemePointsMulEquiv`), and the identification of `D_S(ℤ)`, `D_S(ℤ/n)` and `D_S(n)` with Tau Ceti's `AlgebraicGeometry.Scheme.Gm`, `Scheme.mu` and `Scheme.powHom`. Its 1.4 compares with SchemeAndStackFoundations §2.9 instead.
2. The Kummer sequence as SchemeAndStackFoundations §2.11 `fppf_kummer_sequence` and `Scheme.isLimitMuKernelFork`.
3. The `m`-torsion `G[m] = D_S(X^*(G)/m)`, finite locally free and étale where `m` is invertible (§7.13(b)).
4. The kernel and image of a homomorphism of groups of multiplicative type, which are of multiplicative type, and the abelian-category statement (§7.13(a)).
5. The local constancy of the type of `X^*(G)` (§7.13(a)).
6. The criterion that a finite locally free group is of multiplicative type iff its Cartier dual is étale (§7.13, Checks). Its 2.1 compares with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 instead.
7. Monomorphisms of groups of multiplicative type over an arbitrary base are closed immersions; its 4.5 is over a field only.
8. The `IsTorus` form on an étale family of affines with `TauCeti.SplitTorus.groupScheme`, which `Suggested.lean` declares as `TauCetiRoadmap.PurityForFlatCohomology.IsTorus`. Its own `TauCetiRoadmap.GroupSchemesOverABase.IsTorus` has a different fully qualified name.

Items 1, 2 and 8 are kept in the comment's proposal. Items 3–7 would have to be kept here as well, or added there.

## H09 (mycaule) — answered

One owner is needed. Of the two routes, GroupSchemesOverABase owning the arbitrary-base theory, cited here, matches the single direction of supply: its suppliers stop at `ORDER.txt` line 68. The reverse would put the whole of its Layers 1–3 after this roadmap at line 224. Either route still owes ReductiveGroups Layer 9D the citation for affine bases. Choosing a route is the `ORDER.txt` decision of H02, and §§7.13–7.15 and Layer 8 would not change under either.

## Build

`lake build TauCetiRoadmap.PurityForFlatCohomology.Suggested`: `Build completed successfully (18658 jobs).` There are 15 `declaration uses 'sorry'` warnings (lines 161, 172, 185, 241, 258, 268, 275, 288, 320, 336, 378, 394, 421, 436, 450) and no error.

`Suggested.lean` is unchanged, so no new `#check` pass was run. The elaborated signatures of its 25 declarations (`signatures.md`, at this head) were compared with the README statements they cite: none loses a binder, and no README statement the commit touches has a Lean counterpart.

## Gate

```text
gate PurityForFlatCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`--movable`, `--pr 1840`):

```text
depcheck: 246 roadmaps, 2235 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. ReductiveGroups, the one supplier the commit adds, is on main.

`roadmaps resolve` on the new README finds no cross-roadmap citation and no Lean name that resolves nowhere.

## Ownership against open work

- ReductiveGroups is cited at main `8ad4192`, Layer 9D lines 4976–5125 and Layer 4 line 2112.
- GroupSchemesOverABase was read at its head `4a23b23`.
- `overlaps.md` lists no open pull request that changes this roadmap and no dropped or revision-only id. This commit renames no heading and drops no id. §§7.12a–7.12e, which GroupSchemesOverABase line 1438 cites, keep their numbers.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope bullet: Layer 9D's definition is "the same definition of multiplicative type" | `S = ∅`; `S = Spec ℝ` with the circle torus; `S = Spec(k × k)` with `𝔾_m ⊔ μ_2` | `∅`: the empty cover makes every group of multiplicative type under both definitions. Circle torus: the cover `Spec ℂ → Spec ℝ` gives `D_ℂ(ℤ)` under both. `k × k`: two-point cover with `M_1 = ℤ`, `M_2 = ℤ/2` under both. | agree | none |
| §7.12c: affine fppf→étale splitting (Layer 9D) gives arbitrary `S` | `S` = `ℙ¹_ℤ` covered by two `𝔸¹_ℤ`; `G = μ_n` | Each `U_j` has its own étale cover splitting `G\|_{U_j}`. Their union is an étale cover of `S`; for `μ_n` it is the identity cover. fpqc → fppf is not in Layer 9D, hence "with fpqc covers admitted". | holds | added |
| §7.12c: torus over `k` ⟺ `torusAffineGroupSchemeProperty` | circle torus / `ℝ`; `μ_p` / `𝔽_p`; `𝔾_a` / `k`; trivial group | Circle torus: split over `ℂ`, separable, `r = 1` on both sides. `μ_p`: over `k̄` it is `D(ℤ/p)`, of dimension 0, and nontrivial, so it is no `𝔾_m^r`; not a torus on either side. `𝔾_a`: no character over `k̄`, neither side. Trivial group: `r = 0`, both sides. | agree | mult-type half now cited to Layer 9D |
| §7.12d(b) clause: 9D on small étale site, (b) on big | `S = Spec ℝ`, circle torus | Small site: `ℤ` with conjugation acting by `−1`, sections `0` over `ℝ` and `ℤ` over `ℂ`. Big site: the same sections on `ℝ`- and `ℂ`-schemes. | consistent with §7.12d Checks | clause added; no new claim |
| §7.12e(b): mono ⇒ closed immersion via 9D + locality on `S` | `μ_2 → 𝔾_m` over `ℤ`; squaring on `𝔾_m` over `ℤ[1/2]`; `S = ∅` | `μ_2 → 𝔾_m` is a mono and a closed immersion, with target affine of finite presentation (`ℤ[t,t⁻¹]`). Squaring has kernel `μ_2 ≠ 1`, so it is not a mono and the hypothesis fails. `∅`: vacuous. Over an open `U ⊂ S`, the preimage of `G′_U` under `u` is `G_U`, so being a closed immersion is checked on `{G′_{U_j}}`. | holds | added |
| Summary / Layer 7 intro "extending Layer 9D's theory over affine bases" | compared with Layer 9D lines 5036–5073 | Layer 9D does not state the smoothness criterion, kernels, cocharacters, `G^tor` or Cartier duality. An earlier draft read "over affine bases it is Layer 9D's", which overclaims. | corrected before commit | wording "extending" |
| Contract: Layer 9D's `D_S(M)` is the pinned group scheme | Tau Ceti pin | `TauCeti.DiagonalizableGroup.groupScheme` is at `…/DiagonalizableGroup/Scheme/Basic.lean:86`; `multiplicativeTypeAffineGroupSchemeProperty` at `…/AffineGroupScheme/MultiplicativeType.lean:54`; `torusAffineGroupSchemeProperty` at `…/Torus.lean:59` | present at pin | none |
| Downstream bullet removal | `grep ReductiveGroups` on the new README | 14 lines, all supplier citations or kept-variant clauses; none asks ReductiveGroups to import | consistent | deleted |

## Sources

No source citation was added or changed. Layer 9D's own locators (Conrad, *Reductive Group Schemes*) are that roadmap's and are not restated here. `needs-references.toml` is not needed.

## Untrusted text

The comment contains no instruction to run commands, contact services or change tooling. Its claim that GroupSchemesOverABase is on the dropped-names list was checked against the list itself (H02).
