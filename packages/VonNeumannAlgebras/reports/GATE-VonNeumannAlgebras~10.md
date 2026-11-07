# GATE-VonNeumannAlgebras~10: answers to the review of 6c9ac6d

One comment (CBirkbeck, 2026-11-07T04:40:30Z) is answered here. Its single finding F01 makes four
points (H01–H04). Its "Previous findings" and "Verified sound" sections add two more (H05–H06).
The repair is commit `a324aaf7` on the pull-request branch. It is not pushed.

## H01 (CBirkbeck) — applied differently

The finding is correct: main's `TauCetiRoadmap/VonNeumannAlgebras` is still the folder from
f8dfe0ad (merged 2026-11-05), and at 6c9ac6d `git merge-tree --write-tree origin/main HEAD` reported
add/add conflicts on `README.md` and `Suggested.lean`. The folder is now main's README (4337 lines)
and main's `Suggested.lean`, with every heading, section id and declaration name of main kept, plus
the corrections listed under H04. Against main the folder's diff is 2 files, +159/−33. Applied on
main it is a pure revision confined to the folder: I checked this by writing main's tree with the two
files replaced, and the diff is exactly those +159/−33 lines.

What a commit cannot fix: `git merge-tree` still prints `CONFLICT (add/add)` on both files. The
branch's merge base is 350e970c, which predates f8dfe0ad, and git treats two different additions of
a file as a conflict whatever their contents. The conflict now resolves by taking this head's files,
because they contain main's text plus the corrections. Replaying the folder's state on main (one
squashed commit), or opening it as a fresh pull request from main, is a git/GitHub step outside this
job. Whether to do that or to close #1041 is a human decision.

Two counts in the claim are off; neither changes the verdict:

- Main's `Suggested.lean` has 19 declarations, not 17.
- Three of this branch's eleven declarations had no counterpart on main:
  - `exists_predual` and `exists_vonNeumannAlgebra_starAlgEquiv` (Sakai) were not stated there at all.
  - `exists_faithful_representation` (every unital C*-algebra, a Hilbert space of any size) is a
    different theorem from `exists_injective_nondegenerate_representation_lp` (separable, nontrivial,
    possibly nonunital, on `ℓ²(ℕ)`).

  All three are now in main's file under these names (see H04).

## H02 (CBirkbeck) — applied

Merging 6c9ac6d would have deleted every id of Layers 5–13 cited on main. At a324aaf7 the counts
equal main's:

| id | main | this head |
| --- | --- | --- |
| `V5` | 33 | 33 |
| `V13` | 29 | 29 |
| `V4.0.Decomposition` | 16 | 16 |
| `V4.0.Multiplication` | 30 | 30 |
| `V13b.SpatialNorm` | 8 | 8 |
| `V2.BorelCalculus` | 28 | 28 |
| `V12.J` | 36 | 36 |
| `V4.0.Fields` | 15 | 15 |

The list of `#` headings and the set of bold `**V…**` target ids are identical to main's (`diff` is
empty). `roadmaps resolve` on the README reports no unresolved cross-roadmap citation and no
unresolved Lean name.

Correction to the counts in the comment: the string `V13` occurs 29 times in main's README and
`V4.0.Multiplication` 30 times, not 25 and 29.

The citing roadmaps on main are:

- FactorRigidity (35 lines citing Layers 5–13 or `V13b`)
- Subfactors (28)
- OperatorTheory/SelfAdjointSpectralTheory (2, including `README.md:1406`, "V4.0.Decomposition")
- TypeAHeckeAlgebras (1)
- BanachAlgebras (1)

CStarAlgebras, at its open head, cites `V13b.SpatialNorm` at `README.md:50`, `:52` and `:119`. All of
these resolve again.

## H03 (CBirkbeck) — answered

Agreed. The earlier reply, that nothing in this folder can change "the other pull request", no
longer applies: the second owner is main itself (f8dfe0ad, "Von Neumann algebras, factors and
modular theory"). The folder now builds on main's roadmap instead of replacing it (H01).

## H04 (CBirkbeck) — applied differently

The revision the comment asks for, written against main's headings, ids and names, is now this
folder's content, carried in this pull request rather than in a new one.

The control has two halves:

- Citations resolving: passes now (H02).
- `git merge-tree` clean: passes only once the folder's state is replayed on main (H01).

Each correction the comment lists was checked against main's text before porting. Line numbers are
`TauCetiRoadmap/VonNeumannAlgebras/README.md` at a324aaf7.

- **Kaplansky positive clause.** Main stated the positive part with no locator and no derivation.
  - Now the unit-ball and self-adjoint clauses carry Houdayer Thm 3.16 p. 17, Jones Thm 5.2.1
    pp. 32–33, and Peterson Thm 2.6.4 with its proof, p. 31 (`:506–514`).
  - The positive clause is derived from them by `y_α²−x=y_α(y_α−√x)+(y_α−√x)√x`.
  - The `q` Check is added (`:534–540`).
- **Single-generator weights.** Main already had "a convergent ternary-weight projection series", so
  that part was not a delta. Added:
  - the reason the weights work (`Σ_(k>n)3⁻ᵏ=3⁻ⁿ/2`);
  - the locators Jones EP10 p. 23 and Peterson Lemma 2.8.8 p. 38 (`4⁻ᵏ`);
  - the `2⁻ⁿ` failure;
  - a two-point Check: values `4/9` and `7/18` with `3⁻ⁿ`, versus `3/4` and `3/4` with `2⁻ⁿ`
    (`:806–828`).
- **Unit-ball criterion negative control.** Main had none; it is added as a Layer 1 Check on
  `ker φ` (`:541–547`).
- **Inclusion matrices: zero-corner clause and Jones 4.4.2 attribution.**
  - The definition now carries the zero-corner clause, with Jones Theorem 4.4.2 and the definition
    of the matrix after its proof (pp. 28–29), Thm 4.4.1, Ex. 4.4.3–4.4.5 and §4.5 (`:1005–1017`).
  - The identity-inclusion Check is added (`:999–1003`).
  - Main's rank formula already gives 0 on a zero corner, so the clause makes explicit what main
    left implicit; nothing in main was wrong there.
- **Bicommutant locator ("Lemma 2.5.5 and the proof of Theorem 2.5.6").** Added (`:488–497`), with
  Houdayer Thm 3.1 p. 12 and Jones Thm 3.2.1–3.2.2 and Cor. 3.2.3 p. 12.
  - Main's target "prove … the simultaneous-vector amplification argument" is replaced by consuming
    Tau Ceti's von Neumann density theorem, which proves exactly that argument at the pin (H06).
    The amplification to `ℓ²(ℕ,H)` handles the ultrastrong and ultraweak closures.
- **Not in the comment's list, also ported.** Main's `Suggested.lean` lacked three headlines that are
  statable at the pins: `exists_faithful_representation`, `exists_predual` and
  `exists_vonNeumannAlgebra_starAlgEquiv`.
  - Main's README already plans them: Gelfand–Naimark in Layer 0, and "the equivalence with
    Mathlib's WStarAlgebra definition (Sakai's theorem)" in V4.Core.
  - Main's Lean docstring wrongly said there was "no … comparison with concrete algebras". It now
    says the predual and Sakai statements are stated (`Suggested.lean:28–32`).
  - The README names the three theorems at `:317–319` and `:1067–1073`.
  - `variable {H : Type*}` became `{H : Type u}` so that the predual lives in `H`'s universe; no
    other signature changed.

## H05 (CBirkbeck) — answered

R02 (the Kaplansky positive clause without a locator) stays repaired in the rebuilt folder. Its
repaired form, with locators on the two stated clauses and the positive clause derived, is carried
into main's Layer 1 paragraph (`README.md:506–514`) together with the `q` Check (`:534–540`).

## H06 (CBirkbeck) — disputed

The "Verified sound" section says Tau Ceti at the pin has "no declaration mentioning
`VonNeumannAlgebra` or `WStarAlgebra` (0 files)". At the pin of `lake-manifest.json` (TauCeti
2fd255d) this is false. The following exist:

- `TauCeti/Analysis/VonNeumannAlgebra/Adjoin.lean`: `VonNeumannAlgebra.adjoin`, `coe_adjoin`,
  `coe_commutant_adjoin`, `subset_adjoin`, `adjoin_le_iff`, `adjoin_mono`.
- `TauCeti/Analysis/VonNeumannAlgebra/Density.lean`:
  `StarSubalgebra.exists_forall_norm_sub_apply_lt_of_mem_centralizer_centralizer`, the von Neumann
  density theorem, proved by diagonal amplification.
- `TauCeti/Analysis/CStarAlgebra/GNS.lean`: `PositiveLinearMap.gnsVector` with
  `inner_gnsVector_coe`, `inner_gnsStarAlgHom_gnsVector`, `denseRange_gnsStarAlgHom_gnsVector`.

Main's Layer 0 and Layer 1 planned these as targets. In the two paragraphs this repair edits they are
now consumed and cited in `## Exact supplier contracts` under "From Tau Ceti", in the *Needs:* lines
and in the Dependencies. What remains owned here is unchanged:

- unitary uniqueness;
- intersections, closure, commutant reversal and lattice operations of generated algebras;
- the four closure identifications.

## Build, gate and checks

**Build.** `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested` at a324aaf7: `Build completed
successfully (8976 jobs)`, with 14 `declaration uses sorry` warnings (main's 11 plus the 3 added)
and no other warning.

**Build repair (worktree, not content).** The later check build failed with `error: already exists
(error code: 17, file already exists)` on `.lake/packages`. That path was a link to the machine's
shared Lake packages for this branch's pin (`356835296538146e`: TauCeti `a91d3aa`, Mathlib
`6b7abb3c`, `leanprover/lean4:v4.35.0-rc3`). The target directory was deleted from the host after
the successful build, so the link was left pointing at nothing.

- Re-running the build reproduced the error, `TauCeti: materializing new dependency` and then exit 1:
  Lake cannot create its packages directory where a dangling link stands.
- The dangling link is removed. The worker's Lake setup relinks `.lake/packages` for the pin and
  fetches the packages again.
- The build was not re-run after that. No cache on this host has this pin's Mathlib or Tau Ceti, so
  a bare `lake build` would clone both and compile them from source inside the worktree.
- No tracked file changed in this repair. HEAD is still a324aaf7 with a clean tree, the same content
  as the successful build above, so there is no new commit.

**Gate** (re-run after the repair, same result). `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 OK` (exit 0).

**Dependency check** (verbatim):

```text
depcheck: 239 roadmaps, 2367 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Signatures.** I wrote `#check @name` for all 22 declarations in one scratch file and elaborated
it once with `lake env lean`; it exits 0.

- Every declaration about `H` carries `{H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [CompleteSpace H]`, so no section binder is lost.
- The three added theorems take `(A : Type u) [CStarAlgebra A]`, `(N : VonNeumannAlgebra H)` with
  `X : Type u`, and `(M : Type u) [CStarAlgebra M] [WStarAlgebra M]`. Each matches its README
  sentence (`README.md:317–319`, `:1067–1073`).
- Main's 19 declarations elaborate to their types on main, up to the name of the universe variable.

**Ownership.**

- `roadmaps grep --lean-only` finds the three added headline statements in no other roadmap, on main
  or in an open pull request.
- CategoricalOperatorAlgebras (open) consumes "VonNeumannAlgebras V4 for preduals, normality and
  Sakai's theorem" (its `README.md:161–163`).
- CStarAlgebras (open) assigns positive functionals, GNS, state separation and faithful
  representations to VonNeumannAlgebras V0 (its `README.md:40–41`).
- So this roadmap owns all three. `overlaps` lists no other pull request changing this roadmap and no
  dropped id.

**Sources.** Fetched through the sources service as author-page copies: `houdayer`, `peterson-notes`
and `jones-vna` (the same texts the reviewer cached). Every locator added was read there:

| locator | source line |
| --- | --- |
| Houdayer Thm 3.1, Thm 3.16 | `houdayer` line 517, 784 |
| Peterson Lemma 2.5.5, Thm 2.5.6, Thm 2.6.4 | `peterson-notes` line 1035, 1045, 1128 |
| Peterson Lemma 2.8.8 | `peterson-notes` line 1517 |
| Peterson Cor 4.1.7 | `peterson-notes` line 2248 |
| Peterson Thm 4.4.6 | `peterson-notes` line 2579 |
| Jones Thm 3.2.1, 3.2.2, Cor 3.2.3 | `jones-vna` line 237, 252, 262 |
| Jones Thm 4.4.1, 4.4.2 and the definition of the matrix | `jones-vna` line 840, 856, 868–874 |
| Jones Ex 4.4.3, Ex 4.4.4, Ex 4.4.5, §4.5 | `jones-vna` line 875, 878, 893, 896 |
| Jones Thm 5.2.1, Cor 5.2.2 | `jones-vna` line 957, 1008 |
| Jones EP10 | `jones-vna` line 713 |
| Jones Thm 8.1.15 | `jones-vna` line 1672 |

Page numbers were checked at the page markers. Neither main's folder nor this one has a
`sources.toml`, and this job may not create one, so the three works are recorded here and in the
README's References. Houdayer is a new entry; the Jones and Peterson entries were extended. Nothing
is missing, and there is no `needs-references.toml`.

**Adversarial pass** (statements added or changed by this repair):

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_representation` | zero algebra; `ℂ²`; `M₂(ℂ)` | zero: `K` = GNS space of `f = 0`, which is `0` and lies in `Type u`; `π(1) = 1 = 0`, injective on one point. `ℂ²`: the state `(z,w)↦z` has `f(a*a) = 1 ≠ 0` for `a = (1,0)`. `M₂`: the GNS space of `tr/2` is `M₂` with the Hilbert–Schmidt product, of dimension 4, and is faithful | retained |
| `exists_predual` | `H = 0`; `N = ℂ·1` on `ℂ`; `N = M₂` | `0`: `StrongDual ℂ 0 = 0 ≃ N = 0`. `ℂ`: `X = ℂ`, `L ↦ conj(L(1))·1` is conjugate-linear isometric. `M₂`: `X` = `M₂` with the trace norm, paired by `tr(xh)` and composed with `x ↦ x*`. Same binder form as `WStarAlgebra.exists_predual` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:48–50`) | retained |
| `exists_vonNeumannAlgebra_starAlgEquiv` | zero algebra; `ℂ`; `C[0,1]` without the hypothesis | zero: `K = 0`, `N = ⊤`. `ℂ`: `N = ℂ·1` on `ℂ`. `C[0,1]` has only the projections `0, 1` and is not `ℂ`, so it is not star-isomorphic to a von Neumann algebra: the `WStarAlgebra` hypothesis is needed | retained |
| Kaplansky positive clause | finite rank `+ ℂ·1` on `ℓ²`, `q` = even projection | `y²−x = y(y−√x)+(y−√x)√x` expands to `y²−x`. `q − c·1` has the eigenvalues `1−c` and `−c`, each of infinite multiplicity. `‖q−a‖ ≥ max(|1−c|,|c|) ≥ 1/2`, while `qP_n → q` strongly | added |
| `ker φ` control | `φ = Σ_(n≥1) n⁻²⟨e_n,·e_n⟩` | `φ(1) = π²/6 ≠ 0`; the ball is WOT compact and WOT equals ultraweak on it, so `V ∩ ball` is closed; `V` is a dense hyperplane | added |
| Bicommutant route | `ℂ·1` on `ℂ²`; finite rank `+ ℂ·1` | `A'' = A`, all closures equal `A`. For finite rank, `P_nTP_n → T` strongly, so the SOT closure is `B(ℓ²) = A''`. `(A⊗1)'' = A''⊗1` on `ℓ²(ℕ,H)`: matrix entries of `(A⊗1)'` lie in `A'` | added |
| Ternary weights | `ℓ∞({x,y})` with `0, 1, δ_x, δ_y, …`; `ℓ∞({0,1,2})` | `Σ_(k>n)3⁻ᵏ = 3⁻ⁿ/2`. With `3⁻ⁿ`: `4/9 ≠ 7/18`. With `2⁻ⁿ`: `3/4 = 3/4`, so `a = (3/4)·1`. Eigenvalues `1, 1/3, 1/9`. Spectrum of `a−Σ_(k<n)3⁻ᵏe_k` lies in `[0,3⁻ⁿ/2] ∪ [3⁻ⁿ,3⁻ⁿ·3/2]` | added |
| Zero-corner clause | `ℂ⊕ℂ ⊆ ℂ⊕ℂ`; `M₂⊕ℂ ⊆ M₅⊕M₃` | identity: `p₁q₂ = 0`, so the entry is 0, the matrix is `I`, and `1 = 1·1+0·1`. `M₅⊕M₃`: all four corners are nonzero; the ranks of `p₁e₁`, `p₂e₁` are `2`, `1`, as in main's Check | added |

**Notes for the revision, not edited.**

- Tau Ceti at the pin also has `TauCeti/Analysis/OperatorIdeal/Family/TraceClass.lean`. Main's V4.Core
  consumes trace class from OperatorIdeals OI-B29–B30, so whether that supplier's targets are now in
  the library is a question for OperatorIdeals.
- Main's other `Suggested.lean` docstring bullets were not re-audited against the Tau Ceti pin.
