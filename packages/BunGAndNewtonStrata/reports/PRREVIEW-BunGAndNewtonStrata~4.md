# Review of BunGAndNewtonStrata (pull request #1241 at c7d0555)

**Verdict:** needs changes

## R01 (P3) — `letI` in the signature of `wittGL_isocrystal_classes` (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/BunGAndNewtonStrata/Suggested.lean:105`, “(letI := wittGLIsocrystal p k c  Nonempty (IsocrystalEquiv p k (Fin n → K(p, k)) V)) ↔”.

**Claim:** The theorem's signature is in the form the gate accepts.

**Witness:** Gate at c7d0555: `statement-hygiene=1 … FAIL`, “line 105: P3 `letI` in the signature of theorem `wittGL_isocrystal_classes`; repair: use an instance binder or a named instance in the signature”.

**Repair:** Replace lines 105–106 by the named instance:

```lean
        Nonempty (@IsocrystalEquiv p _ k _ _ _ (Fin n → K(p, k)) _
          (wittGLIsocrystal p k c) V _ _) ↔
```

Tested on a scratch copy at the pins: it elaborates with `sorry` as the only warning, and `#check @wittGL_isocrystal_classes` prints the same type as before (`Nonempty ((Fin n → K(p, k)) ≃ᶠⁱ[p, k] V) ↔ (wittGLSigmaSetoid p k n) b c`). The `letI` inside the body of the definition `wittGLHasNewtonSlopes` is not a signature and the gate does not flag it.

## R02 (P3) — The description's prose paragraph attributes supplied geometry to this roadmap

**Location:** pull request description, paragraph after the summary block: “Develops reductive bundles … the stack Bun_G and its topology, full automorphism groups and Newton strata, and smooth filtered charts. The roadmap retains the general local-field theory and the unitary flag applications”.

**Claim:** This roadmap develops the stack Bun_G, the full automorphism groups and the charts, and keeps the unitary flag applications.

**Witness:** `TauCetiRoadmap/BunGAndNewtonStrata/README.md:15`: VStackSheavesAndLisseCategories §VS4.0 “owns the bundle stack, … full stratum automorphisms and contracting charts”; IgusaVarietiesAndTorsionConcentration §§3.4–3.5 “owns … the minuscule flag stratification, … unitary dimension theorem”. The description's own summary block agrees with the README.

**Repair:** Replace the paragraph's two sentences by: “Develops the arithmetic of reductive bundles on the relative Fargues–Fontaine curve for a connected reductive group over any nonarchimedean local field: rational filtered tensor theory and families of G-isocrystals, the integral Newton–Kottwitz classification with decent, acceptable and ordinary classes and the centralizers J_b, Beauville–Laszlo uniformization, family descent and the Newton topology, filtered relative automorphism group schemes, stratum dimensions and connected components, and the Newton-order description of chart images. The bundle stack, full stratum automorphisms and charts are imported from VStackSheavesAndLisseCategories §VS4.0, and the flag stratification over ℚ_p from IgusaVarietiesAndTorsionConcentration §§3.4–3.5; this roadmap adds the label comparisons of §§2.21 and 3.12.”

## Previous findings

- R01 — repaired: `README.md:48` links Mathlib at `6b7abb3c…456a`; line 53 reads “Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`”, equal to `lake-manifest.json` lines 18 and 8 and to both installed package heads.
- R02 — not repaired, and withdrawn rather than raised again: the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; the gate's `stray-files` rule takes the README's References as the sources, so a manifest in the folder is not asked for.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Changed contract, `README.md:47–55`: `Units.mapEquiv`, `AddEquiv.neg`, `Representation.coinvariantsKer_eq_range_of_forall_mem_zpowers` as used in §1.8 | A=ℤ under `Multiplicative ℤ`, generator acting by τ=−id, by τ=id; A=0 | τ=−id: range(τ−id)=2ℤ, coinvariants ℤ/2, class of 1 nonzero. τ=id: range 0, coinvariants ℤ. A=0: both sides 0. `coe_mapEquiv h x = h x` by `rfl`. | Pass; only the two hashes changed, and they are the pins. |
| `wittGL_isocrystal_classes` (R01), original and repaired form | n=0; n=1 with V=(K, pσ), c=(p) and c=(1) | n=0: one matrix, the zero isocrystal, both sides true. c=(p): identity is an isomorphism, b=c related. c=(1): u=p·σ(u) forces valuation 0=1, no isomorphism; 1=g·p·σ(g)⁻¹ has valuations 0≠1, unrelated. | Pass; the repair leaves the elaborated type unchanged. |

The rows of the previous review for the untouched statements stand as in the previous review, of `27690bf`.

- Gate, rerun at c7d0555: FAIL on `statement-hygiene=1` only (R01); every other counter 0, including `stray-files`, `outside-folder`, `depcheck` and `build`.
- Dependency check: `depcheck: 246 roadmaps, 2253 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff touches no `*Needs:*` line and no supplier citation.
- Elaboration of `Suggested.lean` with `lake env lean`: two `sorry` warnings (lines 100 and 129), nothing else. The file is unchanged since `27690bf`; the seven elaborated signatures were compared with the worker's list and no binder is lost.
- Library declarations opened at the pins (4): `Units.mapEquiv` at `Mathlib/Algebra/Group/Units/Equiv.lean:39`, `Units.coe_mapEquiv` at line 50, `MulEquiv.inv` at line 195 (its additive form is `AddEquiv.neg`, so “in that same module” holds), `coinvariantsKer_eq_range_of_forall_mem_zpowers` at `TauCeti/RepresentationTheory/Coinvariants.lean:179`; `WittVector.IsocrystalEquiv` at `Mathlib/RingTheory/WittVector/Isocrystal.lean:138` for the repair's argument order.
- Source locators: none of the 15 seeded targets falls in the changed passage (two commit hashes in the supplier contracts); no locator changed, none is flagged unverified.
- Cross-roadmap citations: the worker's resolver finds none unresolved; its one lead, `TauCeti.HodgeTate.filteredFiberFunctor_split` (`README.md:77`), is a target of HodgeTateAndCanonicalSubgroups §2.14, as the previous review recorded. No file outside the folder changed against `origin/main`.
- Pull request text: title, summary block, validation paragraph and the remaining prose were read against the head and the folder's change (a new roadmap, 98 headings and 7 declarations added, none removed); only the paragraph of R02 disagrees with the head.
- Overlap check: not redone by scope, since the diff changes no object; the worker's overlap list at this head shows no other pull request changing this roadmap, no dropped or revision-only id and no second copy, and the ownership of the previous review stands.

Source independence: changed passages only; 0 passages of prose changed (two commit hashes), so no wording was compared; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- GLX Definition 2.3, p. 819, and Lemma 3.16, pp. 829–830: carried from the previous review as paywalled and cited by locator; untouched by this change.
- He21 published pagination against the arXiv text: carried from the previous review; untouched by this change.

## Source issues

- none

## For the human reviewers

- Not tested: this round compared the changed passages only (two commit hashes), and the previous report has no such section; the comparison of the layers with the contents of the most-cited source was not made in this round.
