# GATE-CharacterSumsOverFiniteFields~2: answers to human review

One comment (CBirkbeck, 2026-11-06T15:50:35Z, "design edits") with two bullets, split into three
points: the second bullet asks for an edit here (H02) and makes a separate request about
`CongruenceSpectralGap` (H03). Commit `26afea1` on the pull-request branch (not pushed) carries the
repairs. It touches only `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`;
`Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied differently

The trace-function reading of the `L`-polynomials is now recorded in `## Scope and ownership`, which is the only section that makes ownership statements (README l.74–85; old l.74–76 said only "no identification … with Frobenius eigenvalues of a sheaf is a target here"). The new text says that, under the hypotheses of 3.3, 4.5, 4.6 and 5.4, the sums are minus the Frobenius traces on `H¹_c` of `L_χ ⊗ L_ψ`, `L_χ(f)`, `L_ψ(f)` and `L_χ ⊗ L_ψ(a x + b x⁻¹)`, that the `L`-polynomials are `det(1 − T·Frob | H¹_c)`, and that none of this is a target here; it is not attributed to WeilConjectures WC.1 for two reasons. First, WC.1 at the head of the WeilConjectures pull request (`029d8c2`), §§1.1–1.16, contains no character sum, Gauss or Kloosterman sum, Kummer or Artin–Schreier sheaf, or `L`-polynomial of a character sum. Second, WeilConjectures is line 116 of the merge order and this roadmap is line 147, so a theorem about this roadmap's `L`-polynomials cannot be owned there without an upward dependency.

## H02 (CBirkbeck) — applied differently

New `### Not owned here` bullet (README l.216–218): the Kummer and Artin–Schreier sheaves `L_χ`, `L_ψ` and every sheaf-theoretic identification of this roadmap's sums are not targets here, and the roadmap defines no sheaf. The suggested citation is not made because `artinSchreierSheaf` and `kummerSheaf` occur nowhere (`roadmaps grep 'artinSchreierSheaf|kummerSheaf'`: "No match on main or in any open roadmap pull request"). On main, EtaleCohomologyFoundations §F.0 is F.0.1–F.0.4 and F.0.A0–F.0.A2 (constructible sheaves, finite étale Galois categories, Tate twists, topological invariance, inertia, π₁ of a field and of `𝔾_m`), with no Artin–Schreier or Kummer sheaf. Its open revision cannot be cited because it revises an existing roadmap. That revision (head `78f83ad`) builds rank-one lisse sheaves `P ×^G Λ(χ)` from torsors and characters, and it assigns the Artin–Schreier and Kummer sheaves to a downstream FourierDeligneTransform roadmap. FourierDeligneTransform is not on main, not in any open pull request and not in the merge order.

## H03 (CBirkbeck) — answered

This requests a change to `CongruenceSpectralGap`, so nothing changes here. This roadmap consumes only §4.2a's `hyperKloosterman` and §4.2b's `hyperKloosterman_bound`, and neither statement depends on how the sheaf is built. `CongruenceSpectralGap` (head `ad10496`) builds its Kloosterman sheaf in §4.2b, not §4.2a, as `R^(k−1)mult_!(Lψ ⊠ ⋯ ⊠ Lψ)`, and its stated route is already induction by multiplicative convolution `F * G = R¹mult_!(F ⊠ G)` (its README l.695). Its `Lψ` comes from the additive-character-sheaf contract of DeligneWeightsAndPurity, which is not `artinSchreierSheaf` (that name exists nowhere; see H02).

## Repairs of the same defect elsewhere in the README

The defect is a statement that names an owner, or implies a statement, for the zeta and sheaf
bridge that the named roadmap does not plan. It occurred three more times:

- `## Downstream consumers` (l.1773–1776): old "the identification of the `L`-polynomials … with
  numerators of zeta functions is left to them". Neither roadmap plans it. At its head,
  CurvesOverFiniteFields says that character sums belong to this roadmap and that it consumes
  nothing from here (its README l.93–96 and l.170). FunctionFieldArithmetic Layer 5 (§§5.1–5.7)
  has no character-sum `L`-polynomial. New: neither comparison is a target of this roadmap.
- Scope l.93–96: old "the statement that the `L`-polynomials of Layers 3–5 divide their numerators
  is not restated". That statement is false, so the line now calls the relation a comparison and
  gives the counterexample. For `y² = x² + 1` over `𝔽_3`, `L(λ_f, T) = 1 − T` while the conic has
  zeta numerator `1`. The same word "identification" becomes "comparison" in `### Not owned here`
  (l.212–213).
- `### Not owned here` (l.229–233): old "Equidistribution of Kloosterman angles … and the
  Kloosterman sheaf: `DeligneWeightsAndPurity` and `CongruenceSpectralGap` §4.2b". At their heads,
  DeligneWeightsAndPurity has only Deligne's general theorem (§10.5) and Sato–Tate for elliptic
  families (§10.6), and CongruenceSpectralGap has no statement about the distribution of angles.
  New: the law is not a target here. The bullet cites §10.5 for Deligne's theorem and §4.2b for the
  sheaf, and says that the sheaf's geometric monodromy group, which the law also needs, is not a
  target here.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Gauss case: `g(χ, ψ) = −Tr(Frob \| H¹_c(𝔾_m, L_χ ⊗ L_ψ))`, `L = det(1 − T·Frob)` | `𝔽_3`, `χ = η`; lift to `𝔽_9`; `χ = 1 ≠ ψ`; `ψ = 1 ≠ χ`; `χ = ψ = 1` | `g = 1.7321 i`, eigenvalue `−g` of modulus `√3`; `−(−g)² = 3.0000 = g(η_9)` computed directly; `∑_{x≠0} ψ(x) = −1`, so the trace is `1` and `L = 1 − T` (3.3's degenerate case); `ψ = 1`: `χ_c(𝔾_m, L_χ) = 0`, `H¹_c = 0`, `L = 1`; `χ = ψ = 1`: `H²_c ≠ 0` and `−Tr = −1 ≠ g = 2` | holds under 3.3's hypothesis `χ ≠ 1 ∨ ψ ≠ 1`, fails without it | hypotheses of 3.3 written into the sentence |
| 4.5 case: `∑ χ(f(x)) = −Tr` on `H¹_c(𝔸¹ ∖ Z(f), L_χ(f))` | `f = x² + 1`, `χ = η`, `𝔽_3`, `𝔽_9`; `f = X²` | `S_1 = −1`, `S_2 = −1`, so `L = 1 − T`; `dim H¹_c = −χ_c = m − 1 = 1` (tame), matching 4.5's degree `≤ m − 1`; `f = X² = c h²` makes `L_η(f)` geometrically trivial, so `H²_c ≠ 0` | holds under 4.5's non-power hypothesis | none |
| 4.6 case: `∑ ψ(f(x)) = −Tr` on `H¹_c(𝔸¹, L_ψ(f))` | `f = X`, `𝔽_3`; `f = X^p − X` | `∑ψ(x) = 0`; `dim H¹_c = Sw_∞ − 1 = 0`; `L = 1` (4.6 Check); `p ∣ n` makes `L_ψ(f)` trivial | holds under `p ∤ n` | none |
| 5.4 case: `K(χ; a, b) = −Tr` on a two-dimensional `H¹_c` | `𝔽_3`, `a = b = 1`, lift to `𝔽_9` | `K_3 = −1`; roots of `1 − T + 3T²` have `ω₁ + ω₂ = 1 = −K_3` and modulus `1.7321 = √3`; `−(ω₁² + ω₂²) = 5 = K_9` computed directly; `Sw_0 + Sw_∞ = 2` | holds | none |
| CongruenceSpectralGap's Kloosterman sheaf at `χ = 1` has trace `−K(1; a, b)` at `a b` | `𝔽_7`, `a = b = 1`, `k = 2` | CongruenceSpectralGap trace `(−1)^(k−1)·hyperKloosterman = −K_7(1, 1) = −2.0489`, the value in 5.5's Check on Katz's normalization | holds | none |
| Not a divisibility: `L`-polynomial against the zeta numerator | `y² = x² + 1` over `𝔽_3`; control `y² = x³ + x + 1` over `𝔽_5` | affine counts `2 = 3 + S_1` over `𝔽_3` and `8 = 9 + S_2 = 10 − 2` over `𝔽_9`, so two rational points at infinity; `Z_aff = (1 − T)/(1 − 3T)` and `Z_C = 1/((1 − T)(1 − 3T))`, numerator `1`, `L = 1 − T`; control: `∑η(x³ + x + 1) = 3`, `9` projective points, `L = 1 + 3T + 5T²`, equal to FunctionFieldArithmetic §5.4's Check numerator (one point at infinity) | the old wording ("divide") is false; the new one is true | sentence rewritten with the witness |
| Kloosterman-angle equidistribution is not owned by DeligneWeightsAndPurity or CongruenceSpectralGap | grep `sato\|equidistribut\|angle` in both at their heads | DeligneWeightsAndPurity: only §5.19, §10.5 (Weil II (3.5.3)) and §10.6 (elliptic families); CongruenceSpectralGap: no hit about angles | old attribution inaccurate | bullet rewritten |
| CurvesOverFiniteFields and FunctionFieldArithmetic do not plan the `L`-polynomial comparison | their READMEs at their heads | CurvesOverFiniteFields l.93–96 and l.170 exclude character sums; FunctionFieldArithmetic §§5.1–5.7 have no character sum | old "left to them" false | bullet rewritten |

## Suggested.lean and signatures

`Suggested.lean` is unchanged this round: no headline is added, because the trace-function reading
is not a target. I used the elaborated types of all 50 declarations in the provided signature list
and checked its two leads. In `crtFactorLeft` and `crtFactorRight` the coprimality hypothesis is
present as the explicit argument `c₁.Coprime c₂ →` and is only printed without its name, so both
leads are false positives and nothing changed.

## Ownership, citations and sources

Ownership was checked by object, not just by name. I searched for the Artin–Schreier and Kummer
sheaves and for the trace-function or zeta bridge in the roadmaps on main (`eaf17b1`) and in the
458 open roadmap pull requests, using `roadmaps grep` and `roadmaps show`. I also read the sibling
checkouts of CongruenceSpectralGap, FunctionFieldArithmetic and CurvesOverFiniteFields, and the
heads of WeilConjectures, DeligneWeightsAndPurity and the EtaleCohomologyFoundations revision.
None of them owns the bridge, so the README names no owner for it. `roadmaps resolve` on the
edited README reports no cross-roadmap citation and no Lean name found nowhere. No new work is
cited and no source was fetched, so no `needs-references.toml` was written. The
Grothendieck–Lefschetz formula appears only in a sentence that describes a non-target. No passage
in the review text was treated as an instruction, and none was suspicious.

## Build, depcheck and gate

Build: `lake build TauCetiRoadmap.CharacterSumsOverFiniteFields.Suggested` printed `Build completed successfully (8954 jobs).` Its only warnings are `declaration uses 'sorry'`.

Depcheck (after the edits): `depcheck: 239 roadmaps, 2343 edges, 0 problem(s)` (no UPWARD or CYCLE line).

Gate (after the commit): `gate CharacterSumsOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
