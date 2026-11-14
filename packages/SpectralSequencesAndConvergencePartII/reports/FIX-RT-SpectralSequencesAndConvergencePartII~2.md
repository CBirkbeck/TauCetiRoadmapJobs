# FIX-RT-SpectralSequencesAndConvergencePartII~2: repair of red-team round 2

Two reviews were settled. Pass a (`RT-SpectralSequencesAndConvergencePartII~2a`) returned *accepted*
and lists no finding, so it has no section below. Its source-issue and not-verifiable notes call
for no edit. Pass b (`RT-SpectralSequencesAndConvergencePartII~2b`) lists four findings. All four
hold, and all are repaired. Its "For the human reviewers" section was not acted on. No passage in
either review was an instruction, and nothing in them was suspicious.

Files changed: `packages/SpectralSequencesAndConvergencePartII/README.md` and
`packages/SpectralSequencesAndConvergencePartII/Suggested.lean` (module docstring only).
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no supplier gap was added
and no source was fetched.

## RT-SpectralSequencesAndConvergencePartII~2b/F01 (P2) — applied

2.4/2.5: `F` left exact → additive; left exactness is kept for 2.4's third Check and 2.5's
F-acyclic and Remarque 3 items. 3.2: `F`, `G` left exact → `F` additive, `G` left exact; the
F-acyclic and §D7.1 items keep left exact `F`. 3.3: the existing items keep left exact `F`; a new
item covers additive `F` with `R⁰F(A)`.

*Evidence.* grothendieck1957 line 1236 states (2.4.2) for any covariant functor. Théorème 2.4.1
(line 1330–1337) asks left exactness of the second functor only. stacks-05QI line 3655 (Lemma 21.3)
and line 3698, 3705–3706, 3718 (§22, Lemmas 22.1–22.2) assume `F` left exact, so those locators now
say "for left exact `F`".

The first three items of 2.4 and 2.5 and the first three of 3.2 use `F` only through 2.2(ii), the
split rows of 2.3 (additive functors preserve split sequences) and `Tot F(I) = F(Tot I)`. The
abutment of 3.2 for additive `F` uses Mathlib's instance that the unit of `rightDerivedFunctorPlus`
is invertible on bounded-below complexes of injectives. That instance is
`Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean` line 109, under
`[F.Additive] [EnoughInjectives C]` only.

ArithmeticGaloisDuality §D7.1 (*Derived composite spectral sequence*, its README line 4871 at the
open head) takes both functors "additive left-exact". This is why 3.2's comparison item and 3.3's
identification with §D7.1's canonical maps keep left exact `F`.

*Same pattern elsewhere, repaired.*
- **Summary:** "of a left exact functor, with their duals for right exact and contravariant
  functors" → "of an additive functor, with their hyperhomology and contravariant duals".
- **Scope, §D7.1 bullet:** Layer 3's sequence is now for "an additive first functor", and §D7.1's is
  the case of an object and a left exact first functor.
- **Conventions, right acyclicity:** "it is used only for left exact functors" was already false of
  2.2's Checks. It now says it is a hypothesis only of statements about left exact functors.
- **2.6 (the dual of 2.4/2.5):** `F` is now additive. `L₀F(A) ≅ F(A)` is now stated for right exact
  `F`, because Mathlib's `Functor.leftDerivedZeroIsoSelf` needs it. The contravariant `G` is now
  additive.
- **3.4 (the dual of 3.2/3.3):** `F` is now additive in both forms. The displayed exact sequence is
  stated for right exact `F`, and with `L₀F(A)` for additive `F`.

*Negative controls added.*
- **2.4, third Check:** with `F = − ⊗ ℤ/2` and `K = ℤ[0]`, `ℤ` is `F`-acyclic and `′E_1 = 0`, while
  `H⁰(F(K)) = ℤ/2`. 2.5's Remarque 3 item cites the same example.
- **3.2, new Check:** with the same `F`, `G = 𝟙` and `X = ℤ[0]`:
  - the additive statements hold: `E(F, G; ℤ[0]) = 0`, `R^pG(R^qF(ℤ)) = 0` and `Rⁿ(G ∘ F)(ℤ) = 0`;
  - the F-acyclic computation fails: `″E(G, ℤ/2[0])` has `E₂^{0,0} = ℤ/2`.
- **3.3, additive item:** at `j = 0` it reads `R⁰G(R⁰F(ℤ)) = 0 = R⁰(G ∘ F)(ℤ)`, while `G(F(ℤ)) = ℤ/2`.

The review's suggested parenthetical "(left exactness of `F` is used only where an item says so)"
became a clause in 2.4's locator sentence. The content is the same.

## RT-SpectralSequencesAndConvergencePartII~2b/F02 (P3) — applied

*From Tau Ceti*: new bullet stating both pinned theorems with their exact hypotheses. Scope's Tau
Ceti paragraph names them. 1.4's route and *Needs* now say that the first case with finitely many
nonzero columns is `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`, and over
modules follows degreewise from `…_of_exhaustive`. 1.4's identity Check is replaced (see F03).

*Evidence.* The two theorems are at
`TauCeti/Algebra/Homology/SpectralSequence/Filtered/Comparison.lean` line 70 (any abelian
category; `F_a = G_a = ⊥`, `F_b = G_b = ⊤`, `a ≤ b`; isomorphism on a native page `r ≥ 2`) and
`Filtered/Exhaustive.lean` line 200 (`ModuleCat R`, `[Ring R]`, one degree `n`). Both were read at
the pin.

The review's Check used `K^{p,p} = ℤ`. It shows the hypothesis gap, but for that complex only the
identity morphism is available, so it computes nothing. The new Check instead uses the projection
`L ⊕ C → L` (`L^{p,p} = ℤ`; the columns of `C` are `ℤ →(id) ℤ` in rows `p`, `p+1`). It computes
`H^{2p} = ℤ` and `H^{odd} = 0` on both sides, notes that the finite-filtration theorem does not
apply, and notes that the exhaustive one does.

Over modules, the degree-`n` hypotheses of `…_of_exhaustive` follow from finite antidiagonals
`n − 1`, `n`, `n + 1`:
- the stages vanish in degrees `n`, `n + 1`;
- the filtration is exhaustive in degrees `n − 1`, `n`;
- the graded pieces vanish in degrees `n − 1`, `n`.

Neither theorem discharges `quasiIso_total_map_of_finite_antidiagonals`. The first needs finitely
many columns. The second is for modules only, and still needs 1.2's page-1 identification for the
`ℤ × ℤ` column filtration.

## RT-SpectralSequencesAndConvergencePartII~2b/F03 (P3) — applied differently

Deleted: 1.3 "zero double complex converges to zero" and 2.3 "zero double complex is a
Cartan–Eilenberg resolution". 1.4 "identity gives identity" → the F02 Check. 3.3 "identity
transformations induce identities" is replaced by a discriminating Check rather than deleted, so
3.3 keeps three Checks.

The replacement is the coextension along `ℤ → ℤ/4` with `G = Hom_{ℤ/4}(ℤ/2, −)` at `A = ℤ/2`,
which is 4.4(b) with `M = N = ℤ/2`. There `E₂^{p,q} = ℤ/2` for `p ≥ 0`, `q ∈ {0,1}`, and the
abutment vanishes from degree 2. So exactness forces the five-term sequence to be
`0 → ℤ/2 →(≅) ℤ/2 →(0) ℤ/2 →(d₂, ≅) ℤ/2 → 0`. A construction whose third map is `0` would not be
exact.

*Same pattern elsewhere, repaired.*
- **1.1:** "The zero double complex has zero totals; …" → "*Column `0` carries no sign*". The totals
  of a column-`0` complex equal the column with the same differential, and the sign `(−1)^{p+1}`
  would negate it.
- **5.1:** "The zero pairing satisfies `μ`" deleted, because it holds for every sign variant of `μ_n`.

Check counts after the repair: 1.1 four, 1.3 six, 1.4 three, 2.3 three, 3.3 three, 5.1 four. No
section has fewer than three Checks (counted mechanically).

## RT-SpectralSequencesAndConvergencePartII~2b/F04 (P3) — applied

The module docstring of `Suggested.lean` is rewrapped as the review proposed:
- old lines 37/39, beginning "theorem 1.3(c), …" and "lemma for it …";
- new: "its convergence (1.3(c)), and the comparison of totals and acyclic assembly for it (1.4,
  1.5). … the comparison and acyclic assembly for it also need …".

The content is unchanged. A scan of the docstring finds no line that begins with a declaration
keyword.

## Checks run

**Elaboration.** `lake env lean packages/SpectralSequencesAndConvergencePartII/Suggested.lean`,
run from the content repository, gives 11 warnings "declaration uses `sorry`" (lines 76, 90, 105,
121, 141, 159, 183, 221, 239, 269, 283) and no error. No `TauCeti.*` import, so no build was
needed.

**Signatures.** All 13 declarations (11 theorems, `IsRightAcyclic`, `compositionTrans`) were
`#check @`-ed in one scratch copy of the file, elaborated once, without error. Every binder sits
in the declaration's own signature: there are no section `variable`s. Each elaborated type matches
its README statement.

No declaration changed in this round. The README statements whose hypotheses changed (2.4–2.6,
3.2–3.4) have no Lean counterpart: the module docstring names them as not statable. The
`compositionTrans`/`isIso_compositionTrans_iff` binders (`F` additive, `G` additive with
`PreservesFiniteLimits`) agree with 3.1 and with the new 3.2 hypotheses.

**Dependency check.**

```text
depcheck: 243 roadmaps, 2197 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation or own Lean name
that is missing anywhere. It did not check library names, so the two newly cited Tau Ceti
declarations were confirmed by hand at the pin (above).

**Gate failures.** None were listed for this job.

## Adversarial pass on every changed or added statement

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 2.4 items for additive `F` | `F = − ⊗ ℤ/2`, `K = ℤ[0]`, `I = (ℚ → ℚ/ℤ)`; `F = Hom(ℤ/2, −)`, `K = (ℤ →(×2) ℤ)` in degrees 0, 1 | First: `F(I) = 0 → 0`, `′E_1^{0,q} = R^qF(ℤ) = 0`, abutment `RⁿF(ℤ[0]) = 0`. Second: `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, abutment `ℤ/2` in degrees 1, 2 | consistent; hypothesis widened |
| 2.4 third Check (left exact) | positive: `Hom(ℤ/2, −)` on `ℚ → ℚ/ℤ`; negative: `− ⊗ ℤ/2` on `ℤ[0]` | Positive: row 0 is `0 → ℤ/2`, giving `H¹ = ℤ/2 = R¹F(ℤ)`. Negative: `′E_1 = 0` but `H⁰(F(K)) = ℤ/2` | left exactness added |
| 2.5 first three items, additive `F` | `− ⊗ ℤ/2`, `K = (ℤ →(×2) ℤ)` in degrees 0, 1 | `H¹K = ℤ/2`; `″E_2^{p,1} = R^pF(ℤ/2) = 0` (resolution `ℚ/ℤ →(×2) ℚ/ℤ`, killed by `F`); abutment `R^{n−1}F(ℤ/2) = 0` | consistent |
| 2.5 F-acyclic CE item | `− ⊗ ℤ/2` on `0 → ℤ →(×2) ℤ → ℤ/2 → 0`: all three terms are `F`-acyclic | Image `ℤ/2 →(0) ℤ/2 → ℤ/2 → 0` is not exact on the left, so `F` does not commute with kernels | left exactness kept |
| 2.5 Remarque 3 item | `− ⊗ ℤ/2`, `K = ℤ[0]` | `″E_2^{p,0} = R^pF(ℤ) = 0` against `H⁰(F(K)) = ℤ/2` | left exactness kept |
| 2.6 additive `F`; `L₀F = F` for right exact `F` | `F = Hom(ℤ/2, −)`, `A = ℤ/2`, resolution `ℤ →(×2) ℤ` | `L₀F(ℤ/2) = coker(0 → 0) = 0 ≠ F(ℤ/2) = ℤ/2` | right exactness kept for `L₀F = F` only |
| 3.2 for additive `F` | `− ⊗ ℤ/2`, `G = 𝟙`, `X = ℤ[0]` | `E = 0`, `E₂ = R^pG(R^qF(ℤ)) = 0`, `Rⁿ(GF)(ℤ) = 0` | consistent |
| 3.2 F-acyclic computation | same pair, `L = ℤ[0]` | `″E(G, ℤ/2[0])`: `E₂^{0,0} = ℤ/2 ≠ 0` | left exactness kept; Check added |
| 3.2 §D7.1 item | §D7.1's hypotheses at its head | "additive left-exact" for both functors | left exactness kept |
| 3.3 additive item | `− ⊗ ℤ/2`, `G = 𝟙`, `A = ℤ`, `m = 1`, `j = 0` | `R⁰G(R⁰F(ℤ)) = 0 = R⁰(GF)(ℤ)`; with `F(ℤ)`: `ℤ/2 ≠ 0` | added with `R⁰F(A)` |
| 3.3 new Check (third map) | `ℤ → ℤ/4`, `F = Hom_ℤ(ℤ/4, −)`, `G = Hom_{ℤ/4}(ℤ/2, −)`, `A = ℤ/2` | `Ext^q_ℤ(ℤ/4, ℤ/2) = ℤ/2` (`q = 0, 1`); `Ext^p_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for all `p`; `Ext^n_ℤ(ℤ/2, ℤ/2) = ℤ/2, ℤ/2, 0, …`. The sequence `0 → ℤ/2 → ℤ/2 → ℤ/2 → ℤ/2 → 0` forces the maps iso, 0, iso | `d₂ ≠ 0`, as stated |
| 3.4 additive `F` | `G = 𝟙` (exact), any additive `F` | `E²` lies in column 0 and equals `L_qF(A)` = abutment | consistent; the exact sequence uses `L₀F(A)` unless `F` is right exact (dual of 3.3's row) |
| Conventions sentence on right acyclicity | uses in 2.2, 2.4, 2.5, 3.1, 3.2 | Theorem hypotheses appear only with left exact `F` or `G`; uses for `− ⊗ ℤ/2` occur only in Checks | sentence corrected |
| *From Tau Ceti* bullet | pinned statements | Comparison.lean 70–76: `hab`, `hFa`, `hGa`, `hFb`, `hGb`, `2 ≤ r`, page iso → `IsIso (homologyMap (α.app ⊤) n)`. Exhaustive.lean 200–220: `ModuleCat R`, `[Ring R]`, `hFa`/`hGa` in degrees `n`, `n+1`, `hFex`/`hGex` and `hFb`/`hGb` in `n−1`, `n` | stated as at the pin |
| 1.4 route, modules | finite antidiagonals `n−1`, `n`, `n+1` | Stages of index `≤ a` are 0 in degrees `n`, `n+1`; exhaustive in `n−1`, `n`; graded pieces of index `≥ b` are 0 in `n−1`, `n` | hypotheses hold |
| 1.4 new Check | `K = L ⊕ C → L` | One nonzero position per antidiagonal of `K`; columns of `C` exact; `Tot C = ⊕_p (ℤ →(±1) ℤ)`; `H^{2p} = ℤ`, `H^{2p+1} = 0` both sides; `F^p Tot L ≠ 0, ≠ Tot L` for every `p` | finite theorem inapplicable, first case applies |
| 1.1 rephrased Check | column 0 with `d₂ = ×2` | totals `ℤ →(+2) ℤ`; sign `(−1)^{p+1}` gives `−2` | discriminates |
| F04 docstring | scan of lines 1–58 | Only `import Mathlib` begins with a keyword | clean |

## For the maintainer

- **No Lean name changed.** No declaration was added or removed. The only change to
  `Suggested.lean` is in its module docstring.
- **Citations from and to other roadmaps.** The README's citations of ArithmeticGaloisDuality §D7.1
  and DerivedModuleAlgebra §S.1 are unchanged in content. No section, layer or target id was
  renumbered.
- **Ownership.** No new construction or target was introduced: the repairs widen hypotheses, add
  Checks and name two pinned Tau Ceti theorems. So no new ownership question arises, and ownership
  against open pull requests was not re-examined beyond §D7.1's hypotheses, read at its head.
- **Sources.** No new source was needed. `needs-references.toml` was not written.
